; Sub routines to manage MPP Display
; This is freely adapted from the fantastic work done by Zerkman / Sector One
; Great job guy, this is fantastic !
; https://github.com/zerkman/mpp
; Currently only mode 3 is supported
; The Arctic Land (T.AL) 2020
; Contact: uko.tal@gmail.com or uko at http://www.atari-forum.com

	TEXT
	
	; This file must be included at the top of the main code
	; but also contains code... so we directly go to the main code !
	bra main
	
	; Warning, more than 10 macro parameters are required
	; vasmm68k_mot -Ftos -monst -align -allmp


; The variable MPP_MODE must be set in main source before including
; MPP_MODE	equ 0

; Mode 3: 416x273, 48+6 colors/scanline, ST/STE, overscan
	ifeq MPP_MODE-3
MPP_COLORS_PER_SCANLINE	equ 48
MPP_STORED_COLORS_PER_SCANLINE	equ 48
MPP_WIDTH		equ 416
MPP_NBITPLANES		equ 4
MPP_HEIGHT		equ FS_SCR_NBLINES
	endif
; Mode 4: 416x273, 48+6 colors/scanline, STE, overscan
	ifeq MPP_MODE-4
MPP_COLORS_PER_SCANLINE	equ 48
MPP_STORED_COLORS_PER_SCANLINE	equ 48
MPP_WIDTH		equ 416
MPP_NBITPLANES		equ 4
MPP_HEIGHT		equ FS_SCR_NBLINES
	endif
; Mode 5: 400x273, 48+3 colors/scanline, STE, overscan
	ifeq MPP_MODE-5
MPP_COLORS_PER_SCANLINE	equ 48
MPP_STORED_COLORS_PER_SCANLINE	equ 48
MPP_WIDTH		equ 400
MPP_NBITPLANES		equ 3
MPP_HEIGHT		equ FS_SCR_NBLINES
	endif	
; -----------------------------------------------------------------------------
; Macros
; -----------------------------------------------------------------------------	
NOPS_MPP5_INIT	equ 65
mpp5_init	macro

	; Clear all colors and espcially the ones for 
	; bitplane 3 & combinations with 0,1,2
	clear_palette		; 27
	
	; Initialize blitter
	lea HW_BLT_ADR.w,a0	; 2
	move.w #2,$20(a0)	; 4 SrcXInc
	move.w #2,$22(a0)	; 4 SrcYInc
	move.w #$FFFF,$28(a0)	; 4 EndMsk1
	move.w #$FFFF,$2a(a0)	; 4 EndMsk2
	move.w #$FFFF,$2c(a0)	; 4 EndMsk3
	move.w #2,$2e(a0)	; 4 DstXInc
	move.w #-14,$30(a0)	; 4 DstYInc
	move.w #8,$36(a0)	; 4 XCount
	move.w #$0203,$3a(a0)	; 4 HOP + LOP
	endm

NOPS_MPP5_1STL	equ 47
mpp5_1stline	macro
	move.l mpp_palp0,a0	; 5
	lea (HW_ST_PAL_ADR).w,a1	; 2
	
	; Initialize blitter
	lea 10(a0),a2		; 2 	Skip 5 first colors 
	move.l a2,(HW_BLT_ADR+$24).w	; 4	Source address register
	move.l #HW_ST_PAL_ADR,(HW_BLT_ADR+$32).w ; 6	Destination address register
	moveq #5,d4		; 1	Number of palettes in main area
	moveq #1,d5		; 1	Number of palettes in border area
	move.w #$C000,d6	; 2 	Control + Skew
	lea (HW_BLT_ADR+$38).w,a3	; 2	Y count
	lea (HW_BLT_ADR+$3C).w,a4	; 2	Start blitter
	
	; First line is special (5 colors to load)
	moveq #0,d0		; 1
	moveq #0,d1		; 1
	move.w (a0)+,d1		; 2
	move.l (a0)+,d2		; 3
	move.l (a0)+,d3		; 3
	movem.l d0-d3,(a1)	; 10
	endm

; \1 : 0 = All lines, 1 = Line 229
mpp5_btwborders	macro
	ifeq \1
	nops 3
	endif
	move.w d4,(a3)		; 2	Set Y count
	move.w d6,(a4)		; 2	Go !
	; Now 4 cycles of bus arbitration
	; Then 5*8*2*4 = 320 cycles of blitting
	; Then 4 cycles of bus arbitration
	nop		; 4 cycles to wait before right border
	endm
	
; \1 : 0 = All lines, 1 = Line 229
mpp5_leftborder	macro
	move.w d5,(a3)		; 2	Set Y count
	move.w d6,(a4)		; 2	Go !
	; Now 4 cycles of bus arbitration
	; Then 1*8*2*4 = 64 cycles of blitting
	; 3 colors will be displayed, and the 5 other will be set in the border
	; Then 4 cycles of bus arbitration
	ifeq \1
	nops 4
	else
	nops 1
	endif
	endm

; -----------------------------------------------------------------------------
; Sub routines
; -----------------------------------------------------------------------------	
; -----------------------------------------------------------------------------
; Decode and copy an included MPP File to one or two Fullscren screens
; according to --double conversion flag
; a0 = Address of the MPP file
; a1 = Scr1 Address
; a2 = Scr2 Address
; -----------------------------------------------------------------------------	
copyMppToFSScr: movem.l d0-d7/a0-a6,-(sp)
	cmp.b #MPP_MODE,3(a0)	; MPP Mode
	bne .end		; Only current compilation mode is managed
	
	move.l a1,mpp_picp0	; Save the screens address
	move.l a2,mpp_picp1
	
	move.b 4(a0),d0		; Flags
	move.b d0,mpp_flags
	
	moveq #9,d2		; Bit size
	btst #0,d0		; STE palette ?
	beq.s .noste
	addq.w #3,d2
.noste	btst #1,d0		; extra palette bit ?
	beq.s .noxtra
	addq.w #3,d2
.noxtra	move.w d2,mpp_nbits	; number of bits
	mulu #MPP_STORED_COLORS_PER_SCANLINE,d2
	mulu #FS_SCR_NBLINES,d2
	moveq #15,d0
	add.l d0,d2
	lsr.l #3,d2
	and #-2,d2		; packed palette size
	move.w d2,mpp_ppalsz
	
	move.l 8(a0),d0		; Skip the extra header
	lea 12(a0),a0		; And the header
	add.l d0,a0
	
	move.l mpp_picp0,a1	; destination screen
	lea mpp_palbuff0,a2	; unpacked palette address
	move.l a2,mpp_palp0
	bsr mpp_rdimg

	btst.b #2,mpp_flags	; Double image ?
	beq.s .copy2nd

	; Read second image
	move.l mpp_picp1,a1	; destination screen
	lea mpp_palbuff1,a2	; unpacked palette address
	move.l a2,mpp_palp1
	bsr mpp_rdimg
	bra.s .end

.copy2nd	; Copy picture on second screen
	move.l #FS_SCR_NBLINES*FS_SCRLINE_LEN/4+39,d7
	move.l mpp_picp0,a1
	move.l mpp_picp1,a2
.loopLW	move.l (a1)+,(a2)+
	dbf d7,.loopLW
	
	move.l mpp_palp0,mpp_palp1	; Same palette of course

.end	movem.l (sp)+,d0-d7/a0-a6
	rts

; -----------------------------------------------------------------------------
; Read palette and image from file
; a0 (I/O): Pointer to the MPP file contents
; a1: Address of allocated picture
; a2: Address of the unpacked palette
mpp_rdimg:	movem.l d0-d7/a1-a6,-(sp)
	
	; Compute image source address
	move.l a0,a3
	add.w mpp_ppalsz,a3	; Add packed palette size
	
	; Unpack palette
	moveq #0,d7		; bit buffer
	moveq #0,d6		; bit counter
	move.w mpp_nbits,d5	; number of bits per color

	move.w #MPP_HEIGHT-1,d2
.loopLine	moveq #MPP_COLORS_PER_SCANLINE-1,d1
.loopCol	; Get color from a stream with variable number of bits.
	sub d5,d6		; enough bits in bit buffer ?
	bpl.s .gcl_getbits
	swap d7
	move.w (a0)+,d7
	add.w #16,d6
.gcl_getbits:
	move.l d7,d0
	lsr.l d6,d0

	move.w d0,(a2)+
	dbf d1,.loopCol
	dbf d2,.loopLine
	
	btst #0,mpp_flags	; STE Palette ?
	bne.s .ste_pal
	; Convert 9-bit palette entries to ST format
	; Not implemented
	neverGoHere

.ste_pal	; Copy image data
	move.l a3,a0
	copyPictToScr a0,a1,1,MPP_NBITPLANES,MPP_WIDTH/8*MPP_NBITPLANES,$0,0
	add.l #MPP_HEIGHT*MPP_WIDTH/8*MPP_NBITPLANES,a0	; Seek to next image data

.end	movem.l (sp)+,d0-d7/a1-a6	
	rts



; -----------------------------------------------------------------------------	
	BSS
mpp_flags	ds.w 1		; Should be byte, but avoids even statement 
	
mpp_nbits:	ds.w 1
mpp_ppalsz:	ds.w 1

mpp_picp0:	ds.l 1
mpp_picp1:	ds.l 1

mpp_palp0	ds.l 1
mpp_palp1	ds.l 1

mpp_palbuff0:	ds.w MPP_COLORS_PER_SCANLINE*MPP_HEIGHT
mpp_palbuff1:	ds.w MPP_COLORS_PER_SCANLINE*MPP_HEIGHT

