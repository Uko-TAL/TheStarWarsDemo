#!/bin/sh
gcc src/bmp2mpp.c -lm -o bmp2mpp
gcc src/mpp2bmp.c src/pixbuf.c -o mpp2bmp
$ATARI_VASM_DIR/vasmm68k_mot -Ftos -monst -align -allmp -no-opt src/mppview.s -o mppview.ttp