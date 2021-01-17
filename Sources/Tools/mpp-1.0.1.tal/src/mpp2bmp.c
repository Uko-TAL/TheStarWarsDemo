/* -------------------------------------------------------------------
 MPP to BMP file converter.
 by Zerkman / Sector One
------------------------------------------------------------------- */

/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */

/* This is an update of Zerman's amazing work to add specific modes
 * for a demoscreen purposes:
 * - Update of mode 3 timings to fit with my STE fullscreen code
 * - New mode to have 3 bitplanes (8 colors) mode for STE fullscreen
 * The Arctic Land (T.AL) 2029
 * Contact: uko.tal@gmail.com or uko at http://www.atari-forum.com */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "pixbuf.h"

#define NB_MODES 6

typedef struct {
  int id;
  int ncolors;
  int nfixed;
  int border0;
  int x0;
  int (*xinc)(int);
  int xdelta;
  int width;
  int height;
  int pal_ncolors;
} Mode;

static int xinc0(int c) { return ((c==15)?88:((c==31)?12:((c==37)?100:4))); }
static int xinc1(int c) { return (((c)&1)?16:4); }
static int xinc2(int c) { return 8; }
static int xinc3(int c) { return ((c==15)?112:((c==31)?12:((c==37)?100:4))); }
static int xinc4(int c) { return ((c==15)?112:((c==31)?12:((c==37)?100:4))); }
/* Mode 5: A blit every 8 pixels. 5 palettes between borders
 * 8 before Right Border, 24 for border opening, 20 to launch blit, 8 for first pixel  = 60 */
static int xinc5(int c) { return ((c==39)?60:8); }

static const Mode modes[NB_MODES] = {
  { 0, 54, 0, 1, 33, xinc0, 148, 320, 199, 16},
  { 1, 48, 0, 1,  9, xinc1, 160, 320, 199, 16},
  { 2, 56, 0, 1,  4, xinc2, 128, 320, 199, 16},
  { 3, 54, 6, 0, 69, xinc3, 160, 416, 273, 16},
  { 4, 54, 6, 0, 57, xinc4, 160, 416, 273, 16},
  { 5, 51, 3, 0,  4, xinc5, 160, 400, 273, 8 }		/* 5 palettes + 3 colors + 3 for next line */
};

static int read32(const void *ptr) {
  const unsigned char *p = ptr;
  return (p[0]<<24) | (p[1]<<16) | (p[2]<<8) | p[3];
}

PixBuf *decode_mpp(const Mode *mode, int ste, int extra, FILE *in) {
  int bits = 3 * (3 + ste + extra);
  unsigned short nbitplanes=4;
  if(mode->pal_ncolors == 8) {
	  nbitplanes = 3;
  }

  int palette_size = (mode->ncolors-mode->nfixed)*mode->height;
  int packed_palette_size = ((bits*(mode->ncolors-mode->nfixed-mode->border0*2)*mode->height+15)/8)&-2;
  int extra_palette_bytes = palette_size*sizeof(Pixel) - packed_palette_size;
  int image_size = mode->width/8*nbitplanes*mode->height;
  Pixel *pal = malloc(palette_size*sizeof(Pixel));
  unsigned char *img = malloc(image_size);
  unsigned char *p = ((unsigned char*)pal)+extra_palette_bytes;
  int bitbuf = 0, bbnbits = 0;
  int i;
  
  fread(p, packed_palette_size, 1, in);
  fread(img, image_size, 1, in);

  printf("Packed Palette Size: %d, Image Size: %d\n",packed_palette_size, image_size);

  for (i = 0; i < palette_size; i++) {
    int x = i % mode->ncolors;
    if (mode->border0 && (x == 0 || x == ((mode->ncolors-1) & -mode->pal_ncolors))) {
      pal[i].rgb = 0;
      continue;
    }
    while (bbnbits < bits) {
      bitbuf = (bitbuf << 8) | *p++;
      bbnbits += 8;
    }
    bbnbits -= bits;
    unsigned short c = (bitbuf >> bbnbits) & ((1<<bits)-1);
    Pixel p;
    p.cp.a = 0;
    switch (bits) {
    case 9:
      p.cp.r = (c>>6);
      p.cp.g = (c>>3)&7;
      p.cp.b = c&7;
      break;
    case 12:
    case 15:
      p.cp.r = ((c>>7)&0xe) | ((c>>11)&1);
      p.cp.g = ((c>>3)&0xe) | ((c>>7)&1);
      p.cp.b = ((c<<1)&0xe) | ((c>>3)&1);
      if (bits == 15) {
        p.cp.r = (p.cp.r << 1) | ((c>>14)&1);
        p.cp.g = (p.cp.g << 1) | ((c>>13)&1);
        p.cp.b = (p.cp.b << 1) | ((c>>12)&1);
      }
      break;
    default:
      abort();
    }
    p.cp.r <<= 8 - (bits/3);
    p.cp.g <<= 8 - (bits/3);
    p.cp.b <<= 8 - (bits/3);
    pal[i] = p;
  }

  PixBuf *pix = pixbuf_new(mode->width, mode->height);
  memset(pix->array, 0, mode->width * mode->height * sizeof(Pixel));
  int k=0, l=0;
  int x, y;
  unsigned short b0=0, b1=0, b2=0, b3=0;
  Pixel palette[16];
  memset(palette, 0, sizeof(Pixel));
  for (y=0; y<mode->height; ++y) {
    Pixel *ppal = pal + y * (mode->ncolors-mode->nfixed);
    int nextx = mode->x0;
    int nextc = 0;
    for (i=mode->nfixed; i<mode->pal_ncolors; ++i)
      palette[i] = *ppal++;
    for (x=0; x<mode->width; ++x) {
      if (x==nextx) {
        palette[nextc&(mode->pal_ncolors-1)] = *ppal++;
        nextx += mode->xinc(nextc);
        ++nextc;
      }
      if ((x&0xf) == 0) {
        b0 = (img[k+0]<<8) | (img[k+1]);
        b1 = (img[k+2]<<8) | (img[k+3]);
        b2 = (img[k+4]<<8) | (img[k+5]);
		k += 6;
		if (nbitplanes > 3){
			b3 = (img[k+0]<<8) | (img[k+1]);
			k += 2;
		} else {
			b3 = 0;
		}
      }
      i = ((b3>>12)&8) | ((b2>>13)&4) | ((b1>>14)&2) | ((b0>>15)&1);
      pix->array[l++] = palette[i];
      b0 <<= 1;
      b1 <<= 1;
      b2 <<= 1;
      b3 <<= 1;
    }
  }
  free(pal);
  free(img);
  return pix;
}

int main(int argc, char **argv)
{
  if (argc < 2) {
    fprintf(stderr, "usage: %s file.mpp [output.bmp]\n", argv[0]);
    return 1;
  }
  const char *filename = argv[1];
  unsigned char header[12];

  FILE *in = fopen(filename, "rb");
  if (!in) {
    perror(filename);
    return 1;
  }
  fread(header, 12, 1, in);
  const Mode *mode = &modes[header[3]];
  int doubl = (header[4]&4) >> 2;
  int extra = (header[4]&2) >> 1;
  int ste = header[4]&1;
  int skip = read32(header+8);

  if (skip)
    fseek(in, skip, SEEK_CUR);
  PixBuf *pix = decode_mpp(mode, ste, extra, in);
  if (doubl) {
    PixBuf *pix2 = decode_mpp(mode, ste, extra, in);
    int k;
    for (k = 0; k < mode->width*mode->height; ++k) {
      Pixel a = pix->array[k], b = pix2->array[k];
      a.cp.r = ((int)a.cp.r + b.cp.r)/2;
      a.cp.g = ((int)a.cp.g + b.cp.g)/2;
      a.cp.b = ((int)a.cp.b + b.cp.b)/2;
      pix->array[k] = a;
    }
    pixbuf_delete(pix2);
  }
  fclose(in);

  if (argc > 2)
    pixbuf_export_bmp(pix, argv[2]);
  else {
    char buf[256];
    char *dot = strrchr(argv[1], '.');
    int len;
    len = dot ? (dot-argv[1]) : strlen(argv[1]);
    strncpy(buf, argv[1], len);
    strcpy(buf+len, ".bmp");
    pixbuf_export_bmp(pix, buf);
  }
  pixbuf_delete(pix);

  return 0;
}
