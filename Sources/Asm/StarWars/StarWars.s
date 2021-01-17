; Star Wars Demo for Atari STE
; By uko from The Arctic Land (T.AL) 2019-2020
; Contact: uko.tal@gmail.com or uko at http://www.atari-forum.com

; -----------------------------------------------------------------------------	
; Mod Play values to be set before includes
MP_PLAY_FRQ	equ 1
MP_NB_BUFFERS	equ 16
MP_MODE 	equ 4
MP_STE_FRQ	equ 1

; -----------------------------------------------------------------------------	
; MPP Mode to be set before includes
MPP_MODE	equ 5
; -----------------------------------------------------------------------------	
	INCDIR "..\Include"
	INCLUDE "Symbols.s"
	INCLUDE "System.s"
	INCLUDE "FX.s"
	INCLUDE "Overscan.s"
	INCLUDE "MppDisplay.s"	
	INCLUDE "MODPlay.s"
	INCLUDE "SWCPROJ.s"
	INCLUDE "MppTable_h10_sch263_rpt.s"
	INCLUDE "TechTable_h10_sch263_rpt.s"
	OUTPUT .TOS

	OPT D+
	OPT X+
	OPT O+
	;OPT OW+
	; vasmm68k_mot -Ftos -monst -align -allmp

; -----------------------------------------------------------------------------	
; Debug 
debug	equ 0
debug_modplay	equ 0
debug_nomod	equ 0

; -----------------------------------------------------------------------------	
DST_LINE_LEN	equ FS_SCRLINE_LEN

	TEXT

main:	; Supexec
	pea main_super
	move.w #XBIOS_SUPEXEC,-(SP)
	trap #14 
	addq.w #6,SP

	; Exit
	clr.w -(SP)
	trap #1
	
main_super:
	bsr assertSTE
	bsr save_system
	bsr init_system
	
	ifeq debug_modplay
	;set_palette #blackPalette
	endif
	
	; Screen buffers
	; with alignment (for fullscreen sync)
	move.l #scrBuff1,d0
	add.l #255,d0
	and.l #~$FF,d0
	move.l d0,curLogBase
	
	move.l #scrBuff2,d1
	add.l #255,d1
	and.l #~$FF,d1
	move.l d1,curPhysBase
	
	; Resolution & Scrs
	move.w #0,-(sp)
	move.l d1,-(sp)
	move.l d0,-(sp)
	move.w #XBIOS_SETSCREEN,-(sp)
	trap #14
	add.w #12,sp
	
	bsr init_system_cont

	; Launch the precompute screen
	bsr precomp_start

	; And now do the precomputing
	
	; Start sound
	bsr mp_init
	
	; Initialise the Song
	lea modfile,a0
	lea mp_buffer,a1
	bsr mp_init_song
	ifne debug_modplay
	doubleBuffer curPhysBase,curLogBase
	bsr mp_init_song_debug
	endif
	
	; Preload music buffer
	REPT MP_NB_BUFFERS
	bsr mp_read_song
	bsr mp_premix
	bsr mp_mix
	ENDR

	; *** SW Scroller
	; Prepare the SW Font
	jsr swfont_Xshift
	; Fill map
	jsr swsc_fill_map

	; Prepare the MPP Scroller
	jsr mppsc_fillbuff	
	
	; Stop the precompute screen
	move.w #$2700,sr
	timer_stop "A"
	timer_stop "B"
	
	; Launch Into Screen
	jsr intro_start
	
	; Wait key & Manage screen changes
main_loop:	tst.l nextScreenAddr
	beq.s .wait_space
	cmp.l #-1,nextScreenAddr
	beq.s .exit_demo
	
	move.w #$2700,sr
	move.l #.wait_space,-(sp)	; return address
	move.l nextScreenAddr,-(sp)	; jump address
	move.l #0,nextScreenAddr
	rts		; and jump !

.wait_space	cmp.b #$39,HW_ACIA_KBD_DAT.w
	bne.s main_loop
.clear	clear_key
	cmp.b #$39,HW_ACIA_KBD_DAT.w
	beq.s .clear
	
.exit_demo	bsr restore_system		
	rts
	
; -----------------------------------------------------------------------------	
; Generic
; -----------------------------------------------------------------------------	

prepare_vbl:
	; This VBL is only used to continue music while preparing a new screen
	movem.l d0-d7/a0-a6,-(sp)
	jsr mp_read_song
	jsr mp_premix
	jsr mp_mix
	movem.l (sp)+,d0-d7/a0-a6
	rte

; Clean the screen buffers
clean_scrBuff:	move.l #(scrBuff_end-scrBuff1)/(8*4)-1,d7
	moveq #0,d0
	lea scrBuff1,a1
	
.loop	REPT 8
	move.l d0,(a1)+
	ENDR
	dbf d7,.loop
	rts
	
; -----------------------------------------------------------------------------	
; Precompute Screen
; -----------------------------------------------------------------------------
precomp_start:
	set_palette #precomp_palette

	; Initialize sequence
	move.l #0,vblCount
	move.l #precompAction,vblCurAction
	
	;lea precomp_img,a0
	;move.l curPhysBase,a1
	;move.l #270,d7
	;bsr precomp_fill
	
	; Anticipate scrolling
	move.l curPhysBase,a1
	sub.l #120*SCRLINE_LEN,a1
	;sub.l #273*SCRLINE_LEN,a1
	lea precomp_scrAddr,a0
	move.l a1,(a0)
	
	setScreenAddrPtr a0
	
	syncVBL
	move.l #precomp_vbl,HW_SYS_VBL_VEC.w
	move.w #$2300,sr
	rts

precomp_vbl:
	overscan_callTimA precomp_timA
	overscan_callTimB precomp_timB

	; VBL actions management
	vblActionDo vblCount,vblCurAction	
	
	rte

	OPT O-
precomp_timA:	; d7 is set by overscan_upborder and must usually be kept
	; and here we are in a precompute screen without L/R borders opening
	move.l d7,-(sp)
	overscan_upborder

	; Check if we need to copy bitmap
	move.l precomp_cpyNbL,d7
	beq.s .noCopy
	
	movem.l d0-d6/a0-a4,-(sp)
	move.l precomp_cpyOffset,d0
	lea precomp_img,a0
	add.l d0,a0
	move.l curPhysBase,a1
	add.l d0,a1
	bsr precomp_fill
	move.l #0,precomp_cpyNbL
	movem.l (sp)+,d0-d6/a0-a4
	bra.s .end
	
.noCopy	; Check if we need to scroll
	move.l precomp_scrStep,d7
	beq.s .end

	movem.l a0-a1,-(sp)
	lea precomp_scrAddr,a0
	move.l (a0),a1
	add.w d7,a1
	move.l a1,(a0)

	setScreenAddrPtr a0
	movem.l (sp)+,a0-a1	
	
	
.end	move.l (sp)+,d7
	timer_eos "A"
	rte		


precomp_timB:	
	overscan_lowborder
	timer_eos "B"
	rte		
	OPT O+

; Fills the screen destination address with Nb lines of source buffer
; The screen is classical (no fullscreen, so 160 bytes per line)
; a0 = src address
; a1 = dst adress
; d7 = nb of lines - 1	
precomp_fill:
	REPT 4
	movem.l (a0)+,d0-d6/a2-a4
	movem.l d0-d6/a2-a4,(a1)
	lea 40(a1),a1
	ENDR
	dbf d7,precomp_fill
	rts
	
; -----------------------------------------------------------------------------	
; MPP Scroller
; -----------------------------------------------------------------------------	
MPPSC_FNT_NCHAR	equ 70

MPPSC_CHAR_H	equ 10
MPPSC_CHAR_LEN	equ MPPSC_CHAR_H
MPPSC_MAP_W	equ 256
MPPSC_MAP_NCHAR	equ MPPSC_MAP_W/8
MPPSC_MAP_LLEN	equ MPPSC_MAP_NCHAR
MPPSC_MAP_DADR	equ (DST_LINE_LEN-MPPSC_MAP_LLEN*4)
MPPSC_MAP_XADR	equ ((FS_DISPLINE_LEN-MPPSC_MAP_LLEN*4)/16+1)*16

MPPSC_TLINE_SPC	equ 2*MPPSC_CHAR_H

; Clean only first 8 palette colors
clear_palette8	macro
	lea (HW_ST_PAL_ADR).w,a0	; 2
	moveq #0,d0		; 1
	REPT 4
	move.l d0,(a0)+		; 3
	ENDR
	endm
	
; Customization of mmp_init for current Screen
mpp5_init_cust	macro

	; Clear all MPP picture colors 
	clear_palette8
	
	; Initialize blitter
	move.w #2,(HW_BLT_ADR+$2e).w	; 4 DstXInc
	move.w #-14,(HW_BLT_ADR+$30).w	; 4 DstYInc
	move.w #8,(HW_BLT_ADR+$36).w	; 4 XCount
	move.w #$0203,(HW_BLT_ADR+$3a).w	; 4 HOP + LOP
	endm	
	
mppsc_start:	
	set_palette #blackPalette
	timer_stop "A"

	; The decoding of the MPP file takes some VBL
	; and we do not want interrupts, so we use a dedicated VBL
	move.l #prepare_vbl,HW_SYS_VBL_VEC.w
	move.w #$2300,sr

	; Initialise the picture
	lea mppfile,a0
	move.l curPhysBase,a1
	move.l curLogBase,a2
	bsr copyMppToFSScr

	set_palette #mppsc_palette

	; Stop interrupts
	move.w #$2700,sr

	; Initialize blitter
	lea HW_BLT_ADR.w,a6
	move.w #2,$20(a6)	; SrcXInc
	move.w #2,$22(a6)	; SrcYInc
	move.w #$FFFF,$28(a6)	; EndMsk1
	move.w #$FFFF,$2a(a6)	; EndMsk2
	move.w #$FFFF,$2c(a6)	; EndMsk3
	
	syncVBL
	move.l #mppsc_vbl,HW_SYS_VBL_VEC.w
	move.w #$2300,sr
	rts

mppsc_vbl:
	overscan_callTimA mppsc_timA
	
	; VBL actions management
	vblActionDo vblCount,vblCurAction
	
	; Prepare the Play module
	jsr mp_read_song
	jsr mp_premix

	; Scroller
	move.l mppscLines_pos,a0
	move.l curPhysBase,a1
	move.l mppscText_pos,a2
	move.w (a0)+,d2		; Map Offset
	move.w (a0)+,d1		; Screen Offset

	; Center scroller & First line is 160 bytes & Fourth Bitplane
	lea (6+SCRLINE_LEN+MPPSC_MAP_XADR/2)(a1),a1
	move.l a1,a5		; Backup a1
	
	add.w d1,a1
	add.w d2,a2
	
	; Initialize blitter
	move.w #8,(HW_BLT_ADR+$2e).w	; DstXInc
	move.w #MPPSC_MAP_DADR+8,(HW_BLT_ADR+$30).w	; DstYInc
	move.w #MPPSC_MAP_LLEN/2,(HW_BLT_ADR+$36).w	; XCount
	move.w #$0203,(HW_BLT_ADR+$3a).w	; HOP + LOP	
	move.l a1,(HW_BLT_ADR+$32).w	; Destination address register
	move.l a2,(HW_BLT_ADR+$24).w	; Source address register
	
	move.w #$C000,d6	; Control + Skew
	lea (HW_BLT_ADR+$38).w,a3	; Y count
	lea (HW_BLT_ADR+$3C).w,a4	; Start blitter	

	move.l #MPPSC_TLINE_SPC*DST_LINE_LEN,d5	; Space between text lines

	; First Text line
	move.w (a0)+,(a3)
	move.w d6,(a4)
	add.l d5,(HW_BLT_ADR+$32).w
	
	; Middle lines
	move.w (a0)+,d4
	REPT MPPSC_NTLINES-2
	move.w d4,(a3)
	move.w d6,(a4)
	add.l d5,(HW_BLT_ADR+$32).w
	ENDR
	
	; Last line
	move.w (a0)+,d4
	beq.s .endBlitScroll
	move.w d4,(a3)
	move.w d6,(a4)	
	
.endBlitScroll	; Now clean the latest line of the previous scroll for each text line
	move.l a5,a1		; Restore a1
	lea -30+2(a0),a2	; Go back to previous pos
	add.w (a2)+,a1		; Screen offset
	move.w (a2)+,d1		; First text line height
	subq.w #1,d1
	mulu.w #DST_LINE_LEN,d1
	add.w d1,a1
	move.l a1,(HW_BLT_ADR+$32).w	; Destination address register
	move.w #DST_LINE_LEN*(MPPSC_CHAR_H+MPPSC_TLINE_SPC)-(MPPSC_MAP_LLEN*4)+8,(HW_BLT_ADR+$30).w ; DstYInc
	move.w #$0200,(HW_BLT_ADR+$3a).w	; HOP + LOP
	move.w #MPPSC_NTLINES,(a3)
	move.w d6,(a4)

	; Loop on table
	cmp.l #mppscLines_end,a0
	bne.s .noEndSteps
	move.l #mppscLines,a0
	add.l #MPPSC_CHAR_H*MPPSC_MAP_LLEN,mppscText_pos

.noEndSteps	move.l a0,mppscLines_pos
	
	; Prepare the MPP Display
	mpp5_init_cust
	
	rte

	OPT O-
	
mppsc_timA:	; d7 = reserved for Fullscreen
	overscan_upborder (NOPS_MPP5_1STL-OVERSCAN_NOPS_BEFORE_LEFT_BORDER)

	mpp5_1stline

	REPT OVERSCAN_BOTTOM_BORDER_NBSCANLINE-1
	overscan_left_border
	mpp5_btwborders 0
	overscan_right_border
	mpp5_leftborder 0	
	ENDR
	
	; Line 228
	overscan_left_border
	mpp5_btwborders 0
	overscan_right_border
	; Line 229
	mpp5_leftborder 1	
	overscan_low_left_border
	mpp5_btwborders 1
	overscan_right_border
	
	; Continue the remaining lines (43)
	; And remove 7 lines, because MIX routine takes 7+6(not displayed) scanlines
	REPT 43-7
	mpp5_leftborder 0	
	overscan_left_border
	mpp5_btwborders 0
	overscan_right_border	
	ENDR
	clear_palette8
	
.exit	doubleBuffer curPhysBase,curLogBase
	swapPointers mpp_palp0,mpp_palp1

	bsr mp_mix_ext_cust
	
	timer_eos "A"
	rte		

	OPT O+


; Extreme (Oversampling + long word) version, without volume
; Optimized for non fullscreen part of the screen (wins two scanlines)
; Requires MP_PLAY_FRQVAL	equ 12517
; and MP_BUFF_SLICE	equ 256

; Mix 2 voices
; \1 : 0 = left voices, 1 =right voices
mp_mix_ext_2v:	macro
	move.l (a0)+,a1		; 12
	move.l (a0)+,a2		; 12

	REPT 8
	movem.l (a1)+,d0-d7	; 76
	add.l (a2)+,d0		; 16
	add.l (a2)+,d1		; 16	
	add.l (a2)+,d2		; 16	
	add.l (a2)+,d3		; 16
	add.l (a2)+,d4		; 16
	add.l (a2)+,d5		; 16
	add.l (a2)+,d6		; 16
	add.l (a2)+,d7		; 16
	movep.l d0,REPTN*64+\1(a5)	; 24
	movep.l d1,REPTN*64+\1+8(a5)	; 24
	movep.l d2,REPTN*64+\1+16(a5)	; 24
	movep.l d3,REPTN*64+\1+24(a5)	; 24
	movep.l d4,REPTN*64+\1+32(a5)	; 24
	movep.l d5,REPTN*64+\1+40(a5)	; 24
	movep.l d6,REPTN*64+\1+48(a5)	; 24
	movep.l d7,REPTN*64+\1+56(a5)	; 24
	ENDR
	move.l a1,(a4)+		; 12
	move.l a2,(a4)+		; 12	
	endm


mp_mix_ext_cust:	
	; Get the Start Address
	lea mp_copySAddr,a0	; 12
	move.l mp_copyDAddr,a5	; 20
	move.l mp_copySPosPtr,a4	; 20
	
	mp_mix_ext_2v 0
	mp_mix_ext_2v 1
	move.w #0,mp_mix_step	; 20
	rts


; Fills the buffer that contains all the rendered scroll text
mppsc_fillbuff:	; First update the text to get addresses of font chars
	lea mppscText,a0
	move.l #mppscFontData,d1
	move.w #(mppscText_end-mppscText)/4-1,d7
.loopChar	move.l (a0),d0
	mulu.w #MPPSC_CHAR_LEN,d0
	add.l d1,d0
	move.l d0,(a0)+
	dbf d7,.loopChar

	; Now fill the buffer
	lea mppscText,a0
	lea modfile,a1	; At this stage, the initial mod data is no longer useful !
	move.l a1,mppscText_pos

	; Screen is blank before scrolling
	moveq #0,d0
	move.w #(MPPSC_NTLINES+1)*MPPSC_MAP_LLEN*MPPSC_CHAR_H/4-1,d7
.loopClean	move.l d0,(a1)+
	dbf d7,.loopClean
	
	move.w #(mppscText_end-mppscText)/4,d7
	
.loopLine	move.w #MPPSC_MAP_NCHAR-1,d6

.loopLineChar	move.l (a0)+,a2
	REPT MPPSC_CHAR_H
	move.b (a2)+,REPTN*MPPSC_MAP_LLEN(a1)
	ENDR
	addq.w #1,a1
	dbf d6,.loopLineChar

	add.w #(MPPSC_CHAR_H-1)*MPPSC_MAP_LLEN,a1
	sub.w #MPPSC_MAP_NCHAR,d7
	bne.s .loopLine

	rts

; -----------------------------------------------------------------------------	
; Technical Details
; -----------------------------------------------------------------------------	
TECHSC_MAP_W	equ 368
TECHSC_MAP_NCHAR	equ TECHSC_MAP_W/8
TECHSC_MAP_LLEN	equ TECHSC_MAP_NCHAR
TECHSC_MAP_DADR	equ (DST_LINE_LEN-TECHSC_MAP_LLEN*4)
TECHSC_MAP_XADR	equ ((FS_DISPLINE_LEN-TECHSC_MAP_LLEN*4)/16+0)*16

TECHSC_TLINE_SPC	equ 2*MPPSC_CHAR_H

techsc_start:	
	set_palette #blackPalette
	timer_stop "A"
	
	; Clean previous screens
	jsr clean_scrBuff
	
	; Fill the scroller
	jsr techsc_fillbuff
	set_palette #mppsc_palette

	; For the fade out
	move.l #0,curPalette
	
	syncVBL
	move.l #techsc_vbl,HW_SYS_VBL_VEC.w
	move.w #$2300,sr
	rts

techsc_vbl:
	overscan_callTimA techsc_timA

	; VBL actions management
	vblActionDo vblCount,vblCurAction
	
	; Scroller
	tst.l techscText_stop
	bne .scroll_end
	
	move.l techscLines_pos,a0
	move.l curLogBase,a1
	move.l techscText_pos,a2
	move.w (a0)+,d2		; Map Offset
	move.w (a0)+,d1		; Screen Offset

	; Center scroller & First line is 160 bytes & Fourth Bitplane
	lea (6+SCRLINE_LEN+TECHSC_MAP_XADR/2)(a1),a1
	move.l a1,a5		; Backup a1
	
	add.w d1,a1
	add.w d2,a2
	
	; Initialize blitter
	lea HW_BLT_ADR.w,a6
	move.w #2,$20(a6)	; SrcXInc
	move.w #2,$22(a6)	; SrcYInc
	move.w #$FFFF,$28(a6)	; EndMsk1
	move.w #$FFFF,$2a(a6)	; EndMsk2
	move.w #$FFFF,$2c(a6)	; EndMsk3
	move.w #8,$2e(a6)	; DstXInc
	move.w #TECHSC_MAP_DADR+8,$30(a6)	; DstYInc
	move.w #TECHSC_MAP_LLEN/2,$36(a6)	; XCount
	move.w #$0203,$3a(a6)	; HOP + LOP
	
	move.l a1,(HW_BLT_ADR+$32).w	; Destination address register
	move.l a2,(HW_BLT_ADR+$24).w	; Source address register
	
	move.w #$C000,d6	; Control + Skew
	lea (HW_BLT_ADR+$38).w,a3	; Y count
	lea (HW_BLT_ADR+$3C).w,a4	; Start blitter	

	move.l #TECHSC_TLINE_SPC*DST_LINE_LEN,d5	; Space between text lines

	; First Text line
	move.w (a0)+,(a3)
	move.w d6,(a4)
	add.l d5,(HW_BLT_ADR+$32).w
	
	; Middle lines
	move.w (a0)+,d4
	REPT TECHSC_NTLINES-2-1	; No time for all here, we must skip one
	move.w d4,(a3)
	move.w d6,(a4)
	add.l d5,(HW_BLT_ADR+$32).w
	ENDR	
	bra.s .end
	
.scroll_end	; Palette
	fade_palette curPalette
	tset_palette curPalette
	
.end	rte

	OPT O-
	
techsc_timA:	; d7 = reserved for Fullscreen
	overscan_upborder
	
	; Start with the first slices	
	move.w #OVERSCAN_BOTTOM_BORDER_NBSCANLINE-1,d1	; 8
	nop			; 4
.loopHi	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-3
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER
	overscan_right_border	
	dbf d1,.loopHi			;12 (taken) or 16 (not taken)
	
	; We are at scanline 228, we open the low border
	nops OVERSCAN_NOPS_BEFORE_LOW_BORDER-4
	overscan_low_left_border
	nops OVERSCAN_NOPS_AFTER_LOW_LEFT_BORDER
	overscan_right_border

	; Continue the remaining slices
	move.w #OVERSCAN_ENDSCREEN_NBSCANLINE-8-1,d1	; 8
	nop			; 4
.loopLo	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-3
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER
	overscan_right_border	
	dbf d1,.loopLo			;12 (taken) or 16 (not taken)	

	; Scroller (continued)
	tst.l techscText_stop
	bne .exit

	; Remaining middle line
	move.w d4,(a3)
	move.w d6,(a4)
	add.l d5,(HW_BLT_ADR+$32).w

	; Last line
	move.w (a0)+,d4
	beq.s .endBlitScroll
	move.w d4,(a3)
	move.w d6,(a4)	
	
.endBlitScroll	; Now clean the latest line of the previous scroll for each text line
	move.l a5,a1		; Restore a1
	lea -30+2(a0),a2	; Go back to previous pos
	add.w (a2)+,a1		; Screen offset
	move.w (a2)+,d1		; First text line height
	subq.w #1,d1
	mulu.w #DST_LINE_LEN,d1
	add.w d1,a1
	move.l a1,(HW_BLT_ADR+$32).w	; Destination address register
	move.w #DST_LINE_LEN*(MPPSC_CHAR_H+TECHSC_TLINE_SPC)-(TECHSC_MAP_LLEN*4)+8,$30(a6) ; DstYInc
	move.w #$0200,$3a(a6)	; HOP + LOP
	move.w #TECHSC_NTLINES,(a3)
	move.w d6,(a4)

	; Loop on table
	cmp.l #techscLines_end,a0
	bne.s .noEndSteps
	move.l #techscLines,a0
	add.l #MPPSC_CHAR_H*TECHSC_MAP_LLEN,techscText_pos

.noEndSteps	move.l a0,techscLines_pos

	doubleBuffer curPhysBase,curLogBase

.exit	timer_eos "A"
	rte		

	OPT O+

; Fills the buffer that contains all the rendered scroll text
techsc_fillbuff: ; First update the text to get addresses of font chars
	lea techscText,a0
	move.l #mppscFontData,d1
	move.w #(techscText_end-techscText)/4-1,d7
.loopChar	move.l (a0),d0
	mulu.w #MPPSC_CHAR_LEN,d0
	add.l d1,d0
	move.l d0,(a0)+
	dbf d7,.loopChar

	; Now fill the buffer
	lea techscText,a0
	lea modfile,a1	; At this stage, the initial mod data is no longer useful !
	move.l a1,techscText_pos
	ifeq debug
	; Screen is blank before scrolling
	moveq #0,d0
	move.w #(TECHSC_NTLINES+0)*TECHSC_MAP_LLEN*MPPSC_CHAR_H/4-1,d7
.loopClean	move.l d0,(a1)+
	dbf d7,.loopClean
	endif
	
	move.w #(techscText_end-techscText)/4,d7
	
.loopLine	move.w #TECHSC_MAP_NCHAR-1,d6

.loopLineChar	move.l (a0)+,a2
	REPT MPPSC_CHAR_H
	move.b (a2)+,REPTN*TECHSC_MAP_LLEN(a1)
	ENDR
	addq.w #1,a1
	dbf d6,.loopLineChar

	add.w #(MPPSC_CHAR_H-1)*TECHSC_MAP_LLEN,a1
	sub.w #TECHSC_MAP_NCHAR,d7
	bne.s .loopLine

	rts
	
; -----------------------------------------------------------------------------	
; SW Scroller
; -----------------------------------------------------------------------------	
SWFONT_W	equ 16
SWFONT_H_SPACE	equ 4
SWFONT_H	equ 24+SWFONT_H_SPACE
SWFONT_NB_SIZES	equ 12
SWFONT_NB_CHARS	equ 26*2+4
SWFONT_LINES_NB	equ 188
SWFONT_SIZE_LEN	equ SWFONT_W*4
SWFONT_LINE_LEN	equ SWFONT_NB_SIZES*SWFONT_SIZE_LEN
SWFONT_CHAR_LEN	equ 4*SWFONT_H

SWMAP_NB_LINES	equ 17
SWMAP_NB_CHARS	equ 25
SWMAP_LINE_LEN	equ SWMAP_NB_CHARS*4
SWMAP_H	equ SWMAP_NB_LINES*SWFONT_H

SWCPROJ_NB_SL1	equ 252
SWCPROJ_NB_SL2	equ 510-SWCPROJ_NB_SL1

; Simply set 3 colors ;-)
; 12 NOPS
NOPS_SET_STCOL	equ 12
set_starscolors	macro
	move.w (a5)+,4(a6)	; 16
	move.w (a5)+,8(a6)	; 16
	move.w (a5)+,12(a6)	; 16
	endm

swsc_start:	
	set_palette #blackPalette
	timer_stop "A"

	; The preparation of the screen takes some VBL
	; and we do not want interrupts, so we use a dedicated VBL
	move.l #prepare_vbl,HW_SYS_VBL_VEC.w
	move.w #$2300,sr
	
	; Display Stars background
	copyPictToScr #starsImageData,curPhysBase,1,2,(400/2)*2/4,$0,1
	copyPictToScr #starsImageData,curLogBase,1,2,(400/2)*2/4,$0,1

	move.w #$2700,sr	
	syncVBL
	move.l #swsc_vbl_1,HW_SYS_VBL_VEC.w
	move.w #$2300,sr
	rts

swsc_vbl_1:
	overscan_callTimA swsc_timA_1
	
	; VBL actions management
	vblActionDo vblCount,vblCurAction
	
	set_palette #swsc_Pal

	; Play module
	jsr mp_read_song
	jsr mp_premix
	jsr mp_mix
	
	; Scroller projection
	; d0 = reserved for mixing bitplan data
	; a0 = Map address
	; a1 = reserved for line address
	; a2 = Screen address
	move.l swMap_pos,a0
	move.l curLogBase,a2
	;move.l curPhysBase,a2
	lea SCRLINE_LEN(a2),a2	; First line is not Fullscreen
	
	; Palette management
	; a5 and a6 must be kept
	lea HW_ST_PAL_ADR.w,a6
	lea starsImagePal,a5
	
	; Switch VBL
	move.l #swsc_vbl_2,HW_SYS_VBL_VEC.w
	rte

swsc_vbl_2:
	overscan_callTimA swsc_timA_2

	; VBL actions management
	vblActionDo vblCount,vblCurAction

	; Play module
	movem.l a0/a2,-(sp)
	jsr mp_read_song
	jsr mp_premix
	jsr mp_mix
	movem.l (sp)+,a0/a2
	
	; Do we scroll ?
	tst.l swScrollGo
	beq.s .noScroll
	
	; Scroll the map
	movem.l d0-d2/a0-a4,-(sp)
	move.l swMap_pos,a1
	add.w #SWMAP_LINE_LEN,a1	; Next line
	cmp.l #swMapMid,a1	; Loop buffer ?
	bne.s .noLoop

	; Loop
	lea swMap,a1		; Go back to the begin of buffer
	bra.s .setMapPos

.noLoop	; No Loop
	; Add a new pixel line of the text line
	move.l a1,a2
	add.l #SWMAP_LINE_LEN*SWMAP_H,a2	; at the end of the sliding map
	move.l a1,a4
	sub.w #SWMAP_LINE_LEN,a4		; and at previous line (for looping)
	move.l swText_pos,a0	; Text to be displayed
	move.w swScrollStep,d0	; Pixel line within the text line
	move.w d0,d1
	lsl.w #2,d0
	
	moveq #SWMAP_NB_CHARS-1,d2	; Loop on chars
.loopChar	move.l (a0)+,a3		; Get the font description
	add.w d0,a3		; and the step line
	move.l (a3),(a2)+
	move.l (a3),(a4)+
	dbf d2,.loopChar

	addq.w #1,d1		; Now, increment pixel line
	cmp.w #SWFONT_H,d1	; All lines of a char done ?
	bne.s .setScrollStep
	
	moveq #0,d1		; Reset pixel line
	cmp.l #swText_end,a0
	beq.s .setScrollStep	; End of text
	move.l a0,swText_pos	; Next text line (increased previously)
	
.setScrollStep	move.w d1,swScrollStep	
	
.setMapPos	move.l a1,swMap_pos
	movem.l (sp)+,d0-d2/a0-a4

	; Double buffers
.noScroll	doubleBuffer curPhysBase,curLogBase
	
	; Palette management
	; a5 and a6 must be kept
	lea HW_ST_PAL_ADR.w,a6
	lea starsImagePal,a5
	
	; Switch VBL
	move.l #swsc_vbl_1,HW_SYS_VBL_VEC.w
	rte

	
	; WARNING: FULLSCREEN means no optimisation by assembler...
	OPT O-
			
swsc_timA_1:	; d7 = reserved for Fullscreen
	overscan_upborder
	; Start with the first slices
	REPT OVERSCAN_BOTTOM_BORDER_NBSCANLINE
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET_STCOL
	set_starscolors
	overscan_left_border
	swc_proj REPTN
	overscan_right_border	
	ENDR
	
	; We are at scanline 228, we open the low border
	nops OVERSCAN_NOPS_BEFORE_LOW_BORDER-NOPS_SET_STCOL
	set_starscolors
	overscan_low_left_border
	nops OVERSCAN_NOPS_AFTER_LOW_LEFT_BORDER
	overscan_right_border

	; Continue the remaining slices
	REPT SWCPROJ_NB_SL1-OVERSCAN_BOTTOM_BORDER_NBSCANLINE
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET_STCOL
	set_starscolors
	overscan_left_border
	swc_proj REPTN+OVERSCAN_BOTTOM_BORDER_NBSCANLINE
	overscan_right_border	
	ENDR
	
	; And wait till the end
	REPT OVERSCAN_BOTTOM_BORDER_NBSCANLINE+OVERSCAN_ENDSCREEN_NBSCANLINE-SWCPROJ_NB_SL1
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET_STCOL
	set_starscolors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER
	overscan_right_border	
	ENDR
	
.exit	timer_eos "A"
	rte		
	
swsc_timA_2:	; d7 = reserved for Fullscreen
	overscan_upborder
	; Start with the first slices
	REPT OVERSCAN_BOTTOM_BORDER_NBSCANLINE
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET_STCOL
	set_starscolors
	overscan_left_border
	swc_proj REPTN+SWCPROJ_NB_SL1
	overscan_right_border
	ENDR
	
	; We are at scanline 228, we open the low border
	nops OVERSCAN_NOPS_BEFORE_LOW_BORDER-NOPS_SET_STCOL
	set_starscolors
	overscan_low_left_border
	nops OVERSCAN_NOPS_AFTER_LOW_LEFT_BORDER
	overscan_right_border

	; Continue the remaining slices
	REPT SWCPROJ_NB_SL2-OVERSCAN_BOTTOM_BORDER_NBSCANLINE
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET_STCOL
	set_starscolors
	overscan_left_border
	swc_proj REPTN+SWCPROJ_NB_SL1+OVERSCAN_BOTTOM_BORDER_NBSCANLINE
	overscan_right_border	
	ENDR
	
	; And wait till the end
	REPT OVERSCAN_BOTTOM_BORDER_NBSCANLINE+OVERSCAN_ENDSCREEN_NBSCANLINE-SWCPROJ_NB_SL2
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET_STCOL
	set_starscolors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER
	overscan_right_border	
	ENDR
	
.exit	timer_eos "A"
	rte

	; WARNING: End of FULLSCREEN, we can set back optimisation by assembler...
	OPT O+

; Performs a X shifting of the swfont binary file for all X positions	
swfont_Xshift:	lea swfontLines,a0
	lea swfontLinesX,a1
	move.l #SWFONT_LINES_NB-1,d7
.loopLine	moveq #SWFONT_NB_SIZES-1,d6
.loopSize	moveq #SWFONT_W-1,d5	; Number of X shifts
	moveq #0,d0
	move.w (a0)+,d0
	swap d0
.loopXshift	move.l d0,(a1)+
	lsr.l #1,d0
	dbf d5,.loopXshift
	dbf d6,.loopSize
	dbf d7,.loopLine
	
	; Now update the font definition offsets
	lea swfontBin,a0
	move.l #swfontLinesX,d1
	move.l #SWFONT_NB_CHARS*SWFONT_H-1,d7
.loopFont	move.l (a0),d0
	mulu.w #SWFONT_LINE_LEN,d0
	add.l d1,d0
	move.l d0,(a0)+
	dbf d7,.loopFont
	
	; Finally update the text with font char addresses
	lea swText,a0
	move.l #swfontBin,d1
	move.w #(swText_end-swText)/4-1,d7
.loopChar	move.l (a0),d0
	mulu.w #SWFONT_CHAR_LEN,d0
	add.l d1,d0
	move.l d0,(a0)+
	dbf d7,.loopChar
	
	rts

swsc_fill_map:	; Clean map
	lea swMap,a6
	move.l #(SWMAP_NB_CHARS*SWMAP_H)*2-1,d7
	move.l #swfontLinesX,d6
.loopEmpty	move.l d6,(a6)+
	dbf d7,.loopEmpty	
	rts


; -----------------------------------------------------------------------------	
; SW Logo Screen
; -----------------------------------------------------------------------------	
SWLOGO_W	equ 368
SWLOGO_H	equ 192

; For swlogo_mskdo
NOPS_SWLM_DO	equ 38	; Cf swlogo_mskdo
NB_SWLM_DO	equ SWLOGO_H/NOPS_SWLM_DO
NB_SWLM_INIT	equ SWLOGO_H-(NB_SWLM_DO*NOPS_SWLM_DO)

; Simply set 8 colors ;-)
; 22 NOPS
NOPS_SET8COL	equ 22
set8colors	macro
	; MOVEM is faster, but data registers must be kept for blitter intialisation
	lea (HW_ST_PAL_ADR+16).w,a6	; 8 = 2 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	endm

; Save/Restore the registers used by set8colors
; 3 NOPS
NOPS_SAV8COL	equ 3
sav_reg8colors	macro
	move.l a0,-(sp)	; 12
	endm
; 3 NOPS
NOPS_RES8COL	equ 3
res_reg8colors	macro
	move.l (sp)+,a0	; 12
	endm

; Change background color to debug
NOPS_SWLOGO_DEBUGCOL	equ 4
swlogo_debugcol	macro
	ifne debug
	move.w #\1,(HW_ST_PAL_ADR+16).w
	else
	nops NOPS_SWLOGO_DEBUGCOL
	endif
	endm

; MP: Extreme No Volume
swlogo_nb_mixs_per_line	equ OVERSCAN_NOPS_AFTER_LEFT_BORDER/(MP_NOPS_MIX_EXT_MIX)
swlogo_nb_lines_for_mix	equ (MP_BUFF_SLICE/4)/swlogo_nb_mixs_per_line
swlogo_nb_mixs_missing	equ (MP_BUFF_SLICE/4)-(swlogo_nb_lines_for_mix*swlogo_nb_mixs_per_line)
swlogo_nb_mp_lines	equ (1+swlogo_nb_lines_for_mix+2)

swlogo_nb_cleanlines	equ (FS_SCR_NBLINES-SWLOGO_H)/3
swlogo_nb_cleanlines_lin	equ (FS_SCR_NBLINES-SWLOGO_H)-(swlogo_nb_cleanlines*3)
		ifeq swlogo_nb_cleanlines_lin
swlogo_nb_cleanlines_add	equ 0
		else
swlogo_nb_cleanlines_add	equ 1
		endif
swlogo_nb_cleanlines_total	equ (1+swlogo_nb_cleanlines+1+1+SWLOGO_H/40+1)		

	printt "SWLogo: Nb scanlines: Mix, Clean"
	printv swlogo_nb_mp_lines, swlogo_nb_cleanlines_total

swlogoscr_start:	
	set_palette #blackPalette
	timer_stop "A"
	
	; The preparation of the screen takes some VBL
	; and we do not want interrupts, so we use a dedicated VBL
	move.l #prepare_vbl,HW_SYS_VBL_VEC.w
	move.w #$2300,sr

	copyPictToScr #falconImageData,curPhysBase,1,3,(416/2)*3/4,$FFFF,0
	copyPictToScr #falconImageData,curLogBase,1,3,(416/2)*3/4,$FFFF,0

	move.w #$2700,sr	
	syncVBL
	move.l #swlogo_vbl,HW_SYS_VBL_VEC.w
	move.w #$2300,sr
	rts

swlogo_vbl:
	overscan_callTimA swlogo_timA

	; VBL actions management
	vblActionDo vblCount,vblCurAction

	; Reads the song, and prepare the mixing phase
	jsr mp_read_song
	jsr mp_premix

	; For the whole screen, a0 is reserved for colors management
	; Prepare the palette (set the 8 low colors for bitplane 4)
	lea falconImagePal,a0
	lea HW_ST_PAL_ADR.w,a6	; 8 = 2 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	
	ifne debug
	move.w #$007,HW_ST_PAL_ADR.w
	endif
	
	; Display Logo
	move.l updateLogo,d0
	bne.s .showLogo
	; Prepare the filling of the outside of the logo
.noLogo	move.w #$020F,blit_clean_mode	; All ones
	bra.s .cleanAddr

.showLogo	move.w #$0200,blit_clean_mode	; All zeros
	move.l updateLogoPos,d0
	beq.s .noPos		; Address of pos table is not set
	move.l d0,a1
	move.l (a1)+,d0		; Both coords are zero, this is the end of the table
	beq.s .noPos	
	move.w d0,logo_y
	swap d0
	move.w d0,logo_x
	move.l a1,updateLogoPos
	bra.s .cleanAddr
	
.noPos	; If logo is displayed, but not using a pos table, then we center it
	; (according to the logo size, and so of x  we may not be able to do it 
	; in case of no show because of blitter mask R not set)
	move.w #16,logo_x
	move.w #0,logo_y
	
	; Computes the address
.cleanAddr	move.l curLogBase,a3
	lea 6(a3),a3	; Last Bitplan
	add.l #SCRLINE_LEN,a3	; First line is non full screen
	move.l a3,blit_clean_addr+4

	move.l #SWLOGO_H,d1	
	tst.l updateLogoMode
	beq.s .normalClean
	moveq #0,d1
.normalClean	mulu.w #FS_SCRLINE_LEN,d1
	add.l d1,a3
	move.l a3,blit_clean_addr
	
	move.l updateLogo,d0
	bne.s .vbl_blt
	move.l #fake_logo,d0

.vbl_blt	; Prepare blitter launch parameters for each slice
	; d3 = Xcount
	; d4 = Source X increment
	; d5 = Source X pos (mod 16)
	; d6 = Dest X pos (mod 16)
	; a0 = Source Y increment for second slice
	; a1 = number of blitter bus accesses
	; a2 = previous position
	; a3 = Dst addr
	; a4 = Slices parameters
	; a5 = zoom input
	move.l a0,-(sp)
	lea blit_params,a4
	lea logoPrevPos,a2

	tst.l updateLogoMode
	beq.s .normalDisplay
	
	; Zoom out mode
	moveq #8,d4		; Source X increment (copy from screen)
	move.l #FS_SCRLINE_LEN-(SWLOGO_W/2)+8,a0	; Source Y increment for second slice (copy from screen)

	lea cur_logo_zoom,a3	; Get current position in zoom table
	move.l (a3),a5
	tst.w (a5)		; The end of the zoom table ?
	beq.s .noMoreZoom
	lea 8(a5),a3		; Set next position for next VBL
	move.l a3,cur_logo_zoom
	move.w #1,blit_zoom_dx
	move.l #FS_SCRLINE_LEN,blit_line_jump

	bra.s .destAddr

.noMoreZoom	move.w #0,blit_zoom_dx
	lea logo_no_zoom,a5
	move.l #0,blit_line_jump
	bra.s .destAddr
	
.normalDisplay	; Normal display from incbin
	moveq #2,d4		; Source X increment (copy from buffer)
	move.l #2,a0		; Source Y increment for second slice (copy from buffer)
	move.w #0,blit_zoom_dx
	move.l #0,blit_line_jump
	
	lea logo_no_zoom,a5
	move.l d0,(a2)		; Set logo source address
	move.l #0,4(a2)		; Source X position

			
	; Compute destination address
.destAddr	move.l curLogBase,a3
	add.l #SCRLINE_LEN,a3	; First line is non full screen
	
	moveq #0,d0
	move.w logo_y,d0
	mulu.w #FS_SCRLINE_LEN,d0
	add.l d0,a3
	lea 6(a3),a3	; Last Bitplan
	
	; X Position
	move.l 4(a2),d5		; Source X Pos
	move.w logo_x,d1	; Destination X Pos
	moveq #1,d7		; 2 slices

	moveq #0,d6
	move.w d1,d6
	move.w d1,d2
	and.w #$F,d6
	and.w #$FFF0,d2
	lsr.w #1,d2
	add.w d2,a3
	
	; Set the blitter params
	move.l a3,(a4)+		; Destination Address
	move.l (a2),(a4)+	; Source Address
	move.w d4,(a4)+		; SXInc
	
	; Set the Previous position info
	move.l a3,(a2)+
	move.l d6,(a2)+
	
	move.l #0,a1		; Number of blitter bus accesses
	move.w d4,8(a4)		; SYInc for first slice

	; Compute the "replacement" mask parameters
	; We never use the right mask for these blits because it is unnecessary
	; (nothing to mask on a single bitplan) and that making implies an additionnal 
	; destination that we want to avoid (not enough time on a scanline)
	; Unfortunately in some cases (NFSR) , the internal blitter registers are not cleaned on
	; real HW (only recent Hatari versions emulate this.
	; Dirty trick, to not change all the routine, is to blit a black area at the end of each line
	move.l #SWLOGO_W,d3
	sub.w blit_zoom_dx,d3
	add.w d6,d3		; Dest X + Width = Ending X
	move.l d3,d2
	and.w #$F,d3		; X offset
	bne.s .mask
	
	move.w #$FFFF,blit_mask_value
	bra.s .loopSlice
	
.mask	and.w #$FFF0,d2
	lsr.w #1,d2		; Address offset
	add.l a3,d2		; Mask Destination address
	move.l d2,blit_mask_addr
	
	move.w #$FFFF,d2
	lsr.w d3,d2
	
	;not.w d2
	move.w d2,blit_mask_value

	
.loopSlice	; From the Width we get the number of words to read
	moveq #0,d3
	move.w (a5)+,d3		; Width in pixels
	add.w d5,d3		; Add the source X position
	move.w d3,d2
	and.w #$F,d2
	lsr.w #4,d3		; Width in Nb of words
	tst.w d2
	beq.s .endWAligned
	addq.w #1,d3

.endWAligned   	add.l d3,a1		; d3 source read accesses
	move.w d3,blit_sxcount
	
	; Now manage the different cases between Source & destination X position
	cmp.w d5,d6
	beq.s .equalAligned
	bhi.s .sourceAligned
	
	; POS < IN_X
	; ----------
	; FXSR = 1
	; NFSR = 1
	; SKEW = 16-IN_X+POS
	; X_COUNT=X_COUNT0
	; LMASK = $FFFF >> POS
	; #RS = X_COUNT
	; #WD = X_COUNT
	moveq #16,d2
	sub.w d5,d2
	add.w d6,d2
	ori.b #%11000000,d2	; NFSR + FXSR
	move.b d2,4(a4)		; SKEW/NFSR/FXSR

	; Specific case of Xcount = 1 with NFSR set
	; This cannot happen in POS > IN_X case since we increment XCount 
	cmp.w #1,d3
	bne.s .endAligned
	; Blitter does not take into account NFSR if XCount =1
	; So we have to update the SXinc 
	add.w #1,blit_sxcount
	bra.s .endAligned

.sourceAligned	; POS > IN_X
	; ----------
	; FXSR = 0
	; NFSR = 1
	; SKEW = POS-IN_X
	; X_COUNT=X_COUNT0 + 1
	; LMASK = LMASK = $FFFF >> POS
	; RMASK = NOT ($FFFF >> (POS-IN_X))
	; #RS = X_COUNT0
	; #WD = X_COUNT	
	addq.w #1,d3		; Xcount
	move.w d6,d2
	sub.w d5,d2
	ori.b #%01000000,d2	; NFSR
	move.b d2,4(a4)		; SKEW/NFSR/FXSR
	bra.s .endAligned
	
.equalAligned	; POS = IN_X
	; ----------
	; FXSR = 0
	; NFSR = 0
	; SKEW = 0
	; X_COUNT=X_COUNT0
	; LMASK = LMASK = $FFFF >> POS
	; #RS = X_COUNT
	; #WD = X_COUNT
	move.b #0,4(a4)		; SKEW/NFSR

.endAligned	move.w d3,(a4)		; Xcount
	add.l d3,a1		; Number of write accesses
	move.w d3,blit_dxcount
	
	move.w #$FFFF,d0	; Prepare mask
	lsr.w d6,d0
	move.w d0,2(a4)		; L_Mask

	tst.w d6		; Mask impact on number of buses accesses
	beq.s .nsl
	addq.l #1,a1		; Mask not $FFFF -> 1 destination read access

	; Next slice
.nsl	move.w -2(a5),d2	; Width in pixels of previous slice
	move.w blit_zoom_dx,d1	; If we zoom out we must remove 1 pixel

	; New source X position
	add.w d2,d5		; Add to the previous source X position
	move.w d5,d0
	and.w #$F,d5

	and.w #$FFF0,d0
	lsr.w #4,d0
	sub.w blit_sxcount,d0
	mulu.w d4,d0
	add.w d0,8(a4)		; SY		

	; End of line management
	tst.w d7		; Second slice ?
	beq.s .secondSlice
	move.w #8,6(a4)		; DY
	
	; New destination X position
	add.w d2,d6		; Add to the previous Destination X position
	sub.w d1,d6
	move.w d6,d0
	and.w #$F,d6

	and.w #$FFF0,d0
	lsr.w #4,d0
	sub.w blit_dxcount,d0
	lsl.w #3,d0
	add.w d0,6(a4)		; DY		
	
	bra.s .nextSlice 
	
.secondSlice	move.w #FS_SCRLINE_LEN,d0	; Nb bytes/line dest
	add.w -10(a4),d3	; Previous XCount
	subq.w #2,d3		; Ending word of each copy is not added by blitter
	lsl.w #3,d3
	add.w -4(a4),d3		; Previous DYInc
	sub.w d3,d0
	move.w d0,6(a4)		; DY
	
.nextSlice	lea 10(a4),a4		; Next slice
	move.w a0,8(a4)		; SYInc for second slice
	dbf d7,.loopSlice

	move.l (sp)+,a0

	; Blitter bus accesses
.computeTimeCorrection
	; 90 free NOPS - 32 for blitter init - 2*2 for bus arbitration
	; This lets 54 for blitter copy
	moveq #90-32-4,d3
	sub.l a1,d3
	lsl.l #1,d3	; To be KEPT for .end_vbl_blt

	; Manage the lines zooming
.lineZoom	move.w (a5)+,d0
	cmp.w #-1,d0
	beq.s .noVZoom

	move.w d0,blit_nb_lines
	move.w (a5)+,d0

	move.w d0,blit_nb_lines+2
	bra.s .loBorder

.noVZoom	move.w #SWLOGO_H,blit_nb_lines
	move.w #1,blit_nb_lines+2
	move.l #0,blit_line_jump
	
.loBorder	; We have identified the number of lines of each part
	; Nevertheless, the low border may need to broke the copy, so we may split once again
	; So we fill a jump table
	ifne debug
	move.w #$070,HW_ST_PAL_ADR.w
	endif
	lea swlogo_jmpTable,a4
	move.w #OVERSCAN_BOTTOM_BORDER_NBSCANLINE,d7
	move.l #swlogo_blit,a5
	move.l #swlogo_endFS,a6
	moveq #1,d6		; Loop twice
	
	move.w #OVERSCAN_BOTTOM_BORDER_NBSCANLINE-(swlogo_nb_mp_lines+swlogo_nb_cleanlines_total+1),d0	; All before + blit init
	move.w blit_nb_lines,d1
	blt.s .P1toP2

.P1	tst.w d0		; Have we already gone further than Scanline 228 ?
	blt.s .noSplit1		; If yes, no need to split

	cmp.w d1,d0		; Is there enough scanlines to copy the whole part
	blt.s .splitP1		; If no, we need to split
	
.noSplit1	move.w d1,d7		; Copy the whole part
	subq.w #1,d7
	sub.w d1,d0
	moveq #0,d1
	bra.s .copy1

.splitP1	move.w d0,d7		; Copy until scanline 228
	subq.w #1,d7
	sub.w d0,d1
	moveq #0,d0
	
.copy1	move.l a5,(a4)+
	dbf d7,.copy1	

	tst.w d0		; Are we at scanline 228
	bne.s .noLoBorder1	; If no, continue
	move.l #swlogo_line_228,(a4)+	; Else do the low border removal
	subq.w #1,d0
	
.noLoBorder1	tst.w d1	; Still some part to copy (splitted before ?)
	bne.s .P1
	
	; Here we have copied the first part if we are on the first loop, else we have finished the second part  
.P1toP2	tst.w d6
	beq.s .noMoreBlit
	
	move.l #swlogo_blit_p2,(a4)+	; The zooming line skip
	subq.w #1,d0
	
	tst.w d0		; Are we at scanline 228
	bne.s .noLoBorder2	; If no, continue
	move.l #swlogo_line_228,(a4)+	; Else do the low border removal
	subq.w #1,d0
	
.noLoBorder2	move.w blit_nb_lines+2,d1	; Second part
	blt.s .noMoreBlit
	dbf d6,.P1

	; Both part are blit. We are sure that the lo border has been reached
.noMoreBlit	add.w #1+OVERSCAN_ENDSCREEN_NBSCANLINE-1,d0

	; But we still have to mask our blits
	; Do only if mask is required, else number of bit access will be less, and we
	; will loose sync for Fullscreen
	move.w blit_mask_value,d6
	cmp.w #$FFFF,d6
	beq.s .loopEndFS	
	
	;move.w #$F0F0,blit_mask_value
	move.l #swlogo_mskinit,(a4)+
	REPT NB_SWLM_DO
	move.l #swlogo_mskdo,(a4)+
	ENDR
	subq.w #1+NB_SWLM_DO,d0

.loopEndFS	move.l a6,(a4)+
	dbf d0,.loopEndFS
	; End !
	move.l #swlogo_timA_end,(a4)+	
	
end_vbl_blt	; Translate the blitter parameters into a more efficient structure
	; At the end we will have
	; d3 Counter of cycles to be waited
	; d4 Backup of a6, so as a6 can be used by set8colors
	; d5 XYCOUNT 1
	; d6 XYCOUNT 2
	; d7 Reserved
	; a4 = Jump table
	; All other ax for blitter addresses (except a0, and a6)
	lea blit_params+10,a3
	lea blit_fill_data,a4
	move.l a4,d4
	lea blit_fill_regs,a6
	
	move.w (a3),d5		; X Count
	swap d5
	move.w #1,d5		; Y Count
	move.w 2(a3),d1		; L Mask
	move.w 6(a3),(a4)+	; DYInc
	move.w 8(a3),(a4)+	; SYInc	
	move.b #$C0,d0		; HOG mode
	lsl.w #8,d0
	move.b 4(a3),d0		; SKEW
	move.w d0,(a4)+

	lea 10(a3),a3
	move.w 0(a3),d6		; X Count
	swap d6
	move.w #1,d6		; Y Count
	move.w 2(a3),d2		; L Mask
	move.w 6(a3),(a4)+	; DYInc
	move.w 8(a3),(a4)+	; SYInc	
	move.b #$C0,d0		; HOG mode
	lsl.w #8,d0
	move.b 4(a3),d0		; SKEW
	move.w d0,(a4)+
	
	move.l sp,sav_sp	; Backup SP
	lea (HW_BLT_XCOUNT_O+HW_BLT_ADR).w,a1
	lea (HW_BLT_LMASK_O+HW_BLT_ADR).w,a2
	lea (HW_BLT_DYINC_O+HW_BLT_ADR).w,a3
	lea (HW_BLT_SYINC_O+HW_BLT_ADR).w,a5
	lea (HW_BLT_CTL_O+HW_BLT_ADR).w,sp
	lea swlogo_jmpTable,a4
	movem.l d1-d6/a1-a5/sp,(a6)	; Save the registers to use them later
	move.l sav_sp,sp	; Restore SP

	; Double buffers
	doubleBuffer curPhysBase,curLogBase

	ifne debug
	move.w #$000,HW_ST_PAL_ADR.w
	endif	
	rte
	
	
	; WARNING: FULLSCREEN means no optimisation by assembler...
	OPT O-
	
swlogo_timA:	
	overscan_upborder
	
	; Start MOD replay
	; First line is special because we must initialise the mix process
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-MP_NOPS_MIX_EXT_INIT-NOPS_SAV8COL-NOPS_RES8COL
	sav_reg8colors
	mp_mix_ext_init_m
	res_reg8colors
	overscan_right_border	

	; Do the maximum mixes possible
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-2
	moveq #swlogo_nb_lines_for_mix-1,d4	; 4

.mix	nop
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-(swlogo_nb_mixs_per_line)*MP_NOPS_MIX_EXT_MIX
	mp_mix_ext_mix_m swlogo_nb_mixs_per_line
	overscan_right_border
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-4
	dbf d4,.mix	; 3 (taken) or 4 (not taken)

	; Do the remaining mixes
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-(swlogo_nb_mixs_missing)*MP_NOPS_MIX_EXT_MIX
	mp_mix_ext_mix_m swlogo_nb_mixs_missing
	overscan_right_border

	; Now end the mix process
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-MP_NOPS_MIX_EXT_END-NOPS_SAV8COL-NOPS_RES8COL-NOPS_SWLOGO_DEBUGCOL
	sav_reg8colors
	mp_mix_ext_end_m
	res_reg8colors
	swlogo_debugcol $070
	overscan_right_border

	; Now display the SW Logo
	; First fill the outside part of the logo
	; And prepare the blitter to do it
	; Start with bottom
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-40
	lea HW_BLT_ADR.w,a1		; 8
	move.w #$FFFF,HW_BLT_LMASK_O(a1)	; 16
	move.w #$FFFF,HW_BLT_MMASK_O(a1)	; 16
	move.w #$FFFF,HW_BLT_RMASK_O(a1)	; 16
	
	move.w #8,HW_BLT_DXINC_O(a1)		; 16
	move.w #8+(FS_SCRLINE_LEN-FS_DISPLINE_LEN),HW_BLT_DYINC_O(a1)		; 16
	move.l blit_clean_addr,HW_BLT_DADR_O(a1)	; 32
	
	move.w #(FS_DISPLINE_LEN/8),HW_BLT_XCOUNT_O(a1)	; 16
	move.w blit_clean_mode,HW_BLT_HOP_O(a1)	; 24	
	overscan_right_border

	; We clean 3 lines at each blit
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-2	
	moveq #swlogo_nb_cleanlines-1,d4	; 4

.cleanBottom	nop	
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-75-8-2
	; Blit during 75 words + 2 arbitration buses
	move.w #3,HW_BLT_YCOUNT_O(a1)		; 16
	move.w #$C000,HW_BLT_CTL_O(a1)		; 16
	overscan_right_border
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-4
	dbf d4,.cleanBottom		; 3 (taken) or 4 (not taken)

	; Clean the remaining (if some)
	set8colors
	overscan_left_border
	ifeq swlogo_nb_cleanlines_add
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER
	else
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-(swlogo_nb_cleanlines_lin*25)-8-2-NOPS_SWLOGO_DEBUGCOL
	; Blit during 75 words + 2 arbitration buses
	move.w #swlogo_nb_cleanlines_lin,HW_BLT_YCOUNT_O(a1)		; 16
	move.w #$C000,HW_BLT_CTL_O(a1)		; 16
	swlogo_debugcol $700
	endif
	overscan_right_border

	; Then clean the left/right sides
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-16
	move.w #FS_DISPLINE_LEN-8,HW_BLT_DXINC_O(a1)	; 16
	move.w #2,HW_BLT_XCOUNT_O(a1)		; 16
	move.l blit_clean_addr+4,HW_BLT_DADR_O(a1)	; 32	
	overscan_right_border

	; We clean 40 lines at each blit
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-2	
	moveq #SWLOGO_H/40,d4	; 4 (do not remove one because of dbf because of rounding)
.cleanSides	nop	
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-80-8-2
	; Blit during 80 words + 2 arbitration buses
	move.w #40,HW_BLT_YCOUNT_O(a1)		; 16
	move.w #$C000,HW_BLT_CTL_O(a1)		; 16
	overscan_right_border
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-4
	dbf d4,.cleanSides		; 3 (taken) or 4 (not taken)

	; Blitter initialisation for displaying logo
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-79
	
	lea HW_BLT_ADR.w,a2		; 8
	move.w #$FFFF,HW_BLT_MMASK_O(a2)	; 16
	move.w #$FFFF,HW_BLT_RMASK_O(a2)	; 16
	
	move.w #8,HW_BLT_DXINC_O(a2)		; 16 - Dest has always 4 bitplanes
	move.b #2,HW_BLT_HOP_O(a2)		; 16 - Source (HOP)
	move.b #3,HW_BLT_LOP_O(a2)		; 16 - Source (OP)
	
	lea blit_params,a3		; 12
	
	move.l (a3)+,HW_BLT_DADR_O(a2)		; 24
	move.l (a3)+,HW_BLT_SADR_O(a2)		; 24
	move.w (a3)+,HW_BLT_SXINC_O(a2)		; 16

	move.l sp,sav_sp		; 20 Backup SP
	lea blit_fill_regs,a3		; 12
	movem.l (a3),d1-d6/a1-a5/sp		; 108 Prepare all registers

	move.l (a4)+,a6			; 12
	; 316
	overscan_right_border
	
	; Starts the blits
	jmp (a6)			; 8
	
swlogo_timA_end	; Restore SP
	move.l sav_sp,sp
	; Make sure nothing can be seen
	set_palette #blackPalette
	
.exit	timer_eos "A"
	rte

swlogo_blit:	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-4 ; Previous jump + increase a4
	move.w d1,(a2)		;  8 (L Mask)
	set8colors
	overscan_left_border
	; Following is 128 cycles (excl jmp) = 32 NOPS		
	move.l d4,a6		; 4
	move.l d5,(a1)		; 12 (X + Y Count)

	move.w (a6)+,(a3)	; 12 (DYInc)
	move.w (a6)+,(a5)	; 12 (SYInc)
	move.w (a6)+,(sp)	; 12 (CTL + SKEW)
	
	move.l d6,(a1)		; 12 (X + Y Count)
	move.w d2,(a2)		;  8 (L Mask)
	move.w (a6)+,(a3)	; 12 (DYInc)
	move.w (a6)+,(a5)	; 12 (SYInc)
	move.w (a6)+,(sp)	; 12 (CTL + SKEW)
	
	lsr.l d3,d0		; Compensate the blit execution times ; 8 + 4*x
	
	move.l (a4)+,a6		; 12
	overscan_right_border
	jmp (a6)		; 8

swlogo_blit_p2:	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-2 ; Previous jump
	set8colors
	overscan_left_border
	; Prepare the second part
	; Correct or not the destination address
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-14
	move.l blit_line_jump,d0		; 20
	sub.l d0,(HW_BLT_ADR+HW_BLT_DADR_O).w	; 24
	move.l (a4)+,a6			; 12
	overscan_right_border	
	jmp (a6)		; 8


swlogo_line_228:; We are at scanline 228, we open the low border
	nops OVERSCAN_NOPS_BEFORE_LOW_BORDER-2-17 ; Previous jump + partial set8colors
	lea (HW_ST_PAL_ADR+16).w,a6	; 8 = 2 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	overscan_low_left_border
	nops OVERSCAN_NOPS_AFTER_LOW_LEFT_BORDER-8
	move.l (a0)+,(a6)+	; 20 = 5 NOPS
	move.l (a4)+,a6		; 12
	overscan_right_border
	jmp (a6)		; 8
	
	
swlogo_endFS:	; Now continue normally
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-2 ; Previous jump 
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-3
	move.l (a4)+,a6		; 12
	overscan_right_border
	jmp (a6)		; 8


swlogo_mskinit:	; Initialise the masking replacement
	; Replace the right mask that was not been possible with remaining time
	; with a clean blit
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-2 ; Previous jump 
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-30-3-8-2-NB_SWLM_INIT*2

	lea HW_BLT_ADR.w,a5	; 8 = 2 NOPS

	; It is not necessary to set:
	; HW_BLT_MMASK_O, HW_BLT_RMASK_O, HW_BLT_DXINC_O(a6), and SYInc
	
	move.w blit_clean_mode,HW_BLT_HOP_O(a5)	; 24 - HOP & LOP
	move.w #1,HW_BLT_XCOUNT_O(a5)		; 16 - XCount
	
	move.l blit_mask_addr,HW_BLT_DADR_O(a5)	; 32
	move.w blit_mask_value,HW_BLT_LMASK_O(a5)	; 24
	move.w #FS_SCRLINE_LEN,HW_BLT_DYINC_O(a5)	; 16
	; 30 NOPS up to here
	
	; In swlogo_mskdo, there will be 38 lines of blit
	; And we have SW_LOGO_H = 192 lines, so we need 5 calls to swlogo_mskdo
	; And here we do the remaining ones
	move.w #NB_SWLM_INIT,HW_BLT_YCOUNT_O(a5)	; 16 - Y Count
	move.w #$C000,HW_BLT_CTL_O(a5)		; 16 - HOG mode, SKEW = 0
	
	; Prepare jump
	move.l (a4)+,a6		; 12
	overscan_right_border
	jmp (a6)		; 8


swlogo_mskdo:	; Blit the masking replacement
	nops OVERSCAN_NOPS_BEFORE_LEFT_BORDER-NOPS_SET8COL-2 ; Previous jump 
	set8colors
	overscan_left_border
	nops OVERSCAN_NOPS_AFTER_LEFT_BORDER-8-3-2-(NOPS_SWLM_DO*2)

	; NOPS Available: 90 - 3 (jump) - 8 (run blit) - 2 for bus arbitration =  77
	; Therefore 38 lines possible 
	move.w #NOPS_SWLM_DO,HW_BLT_YCOUNT_O(a5)	; 16 - Y Count
	move.w #$C000,HW_BLT_CTL_O(a5)	; 16 - HOG mode, SKEW = 0
	
	; Prepare jump
	move.l (a4)+,a6		; 12
	overscan_right_border
	jmp (a6)		; 8
	
	; WARNING: End of FULLSCREEN, we can set back optimisation by assembler...
	OPT O+
	
; -----------------------------------------------------------------------------	
; Text Intro Screen
; -----------------------------------------------------------------------------	
intro_start:
	set_palette #blackPalette

	; Clean previous screens
	jsr clean_scrBuff

	; Initialize sequence
	move.l #0,vblCount
	move.l #vblAction,vblCurAction

	; Set Introduction VBL
	syncVBL
	move.l #intro_vbl,HW_SYS_VBL_VEC.w
	move.w #$2300,sr
	
	; Launch music
	jsr mp_playtheblues
	
	rts

intro_vbl:
	; Palette
ivbl_pal	fade_palette curPalette
	tset_palette curPalette
	
	; VBL actions management
ivbl_acr	vblActionDo vblCount,vblCurAction

	; Play module
	jsr mp_read_song
	jsr mp_premix
	jsr mp_mix

	; Parse text
ivbl_txt	parseText curIntroText,introFontASCII,introFontSize,introFontData,curLogBase,50,0,4,21,SCRLINE_LEN,logPosLastIntro 

	; Double buffers
	doubleBuffer curPhysBase,curLogBase
	swapPointers physPosLastIntro,logPosLastIntro

ivbl_end	rte

	
; -----------------------------------------------------------------------------	
	DATA
; -----------------------------------------------------------------------------	
data:
MUSIC_BAR_LEN	equ 7*8
SEQ_SWLOGO	equ MUSIC_BAR_LEN*16
SEQ_SWSC	equ SEQ_SWLOGO+MUSIC_BAR_LEN*20
SEQ_MPPSC	equ SEQ_SWSC+MUSIC_BAR_LEN*54
SEQ_TECH	equ SEQ_MPPSC+MUSIC_BAR_LEN*8*9+MUSIC_BAR_LEN*1
SEQ_TECH_END	equ SEQ_TECH+87*50

; *** Generic	
vblCount	dc.l 0
vblCurAction	dc.l 0
vblAction	ifeq debug
	dc.l MUSIC_BAR_LEN*2,vblActionSetAddr,curIntroText,introText
	dc.l MUSIC_BAR_LEN*8,vblActionSetAddr,curIntroText,introText2
	dc.l MUSIC_BAR_LEN*12,vblActionSetAddr,curIntroText,introText3
	dc.l MUSIC_BAR_LEN*14,vblActionFadeOut,50,0
	dc.l SEQ_SWLOGO,vblActionSetNewScren,swlogoscr_start,0
	dc.l SEQ_SWLOGO+MUSIC_BAR_LEN*4,vblActionSetAddr,updateLogoMode,0
	dc.l SEQ_SWLOGO+MUSIC_BAR_LEN*4,vblActionSetAddr,updateLogo,swlogoData
	dc.l SEQ_SWLOGO+MUSIC_BAR_LEN*8,vblActionSetAddr,updateLogoPos,swlogo_pos
	dc.l SEQ_SWLOGO+MUSIC_BAR_LEN*8+160,vblActionSetAddr,updateLogoMode,1
	dc.l SEQ_SWSC,vblActionSetNewScren,swsc_start,0
	dc.l SEQ_SWSC+MUSIC_BAR_LEN*4,vblActionSetAddr,swScrollGo,1
	dc.l SEQ_MPPSC,vblActionSetNewScren,mppsc_start,0
	dc.l SEQ_TECH,vblActionSetNewScren,techsc_start,0
	dc.l SEQ_TECH_END,vblActionSetAddr,techscText_stop,1
	dc.l SEQ_TECH_END+100,vblActionFadeOut,50,0
	dc.l SEQ_TECH_END+200,vblActionSetNewScren,-1,0
	else
	dc.l 0,vblActionSetAddr, curIntroText, introText
	dc.l 0,vblActionFadeOut, 50, 0
	dc.l 50,vblActionSetNewScren, mppsc_start,0
	endif
	dc.l 0,0,0,0

curPalette	dc.l introFontPal
blackPalette	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

	ifeq debug_nomod
modfile	incbin "OLDSKOOL.MOD"
	else
modfile	incbin "EMPTY.MOD"
	ds.l 32000/4	; Because modfile memory space is reused by mppsc
	endif
	even	
	
; *** Intro screen	
	include "IntroFont.s"
introFontData	incbin "IntroFont.bin"

curIntroText	dc.l introTextEmpty
introTextEmpty	dc.b 0
introText	dc.b "A long time ago, in a galaxy",$ff
                dc.b "far, far away ...",0
introText2	dc.b "Decades have passed, the fight",$ff
                dc.b "has continued...",0
introText3	dc.b "And the Atari ST legend is still",$ff
                dc.b "alive...",0

	even
logPosLastIntro		dc.l posLastIntroTextLog
physPosLastIntro	dc.l posLastIntroTextPhys
posLastIntroTextPhys	dc.l 0,0,0,0,0,0,0	; 3 lines max of two coords + one ending long
posLastIntroTextLog	dc.l 0,0,0,0,0,0,0	; 3 lines max of two coords + one ending long

; *** SW Logo screen
	include "Falcon_416_273_red8_Line_Merged.s"
falconImageData incbin "Falcon_416_273_red8_Line_Merged.bin"
swlogoData	incbin "SWLOGO_182.BIN"
fake_logo	dcb.w SWLOGO_W*SWLOGO_H/4,$FFFF

cur_logo_zoom	dc.l table_zoom_xy
logo_no_zoom	dc.w SWLOGO_W/2,SWLOGO_W/2,SWLOGO_H/2,SWLOGO_H/2
	include "ZoomTable_182.s"
	dc.w 0,0,0,0

	include "SWLogoPos_182.s"
	dc.w 0,0
	

; *** SW Scroller
	even
swsc_Pal	dc.w 0,$F74,$F74,$F74,$F74,$F74,$F74,$F74,$F74,$F74,$F74,$F74,$F74,$F74,$F74,$F74
starsImageData	incbin "Stars6_400_273.bin"
	include "Stars6_400_273.s"

swfontBin	incbin "SWFONT.bin"
swfontLines	incbin "SWFONT_L.bin"
swText	incbin "SWCTEXT.bin"
swText_end
swText_pos	dc.l swText	
swMap_pos	dc.l swMap
swScrollStep	dc.w 0
swScrollGo	dc.l 0

; *** MPP Scroller
mppscFontData	incbin "MppFont_h10.bin"
mppscText	incbin "MppText_h10_w256.bin"
mppscText_end
	
mppfile	incbin "R2.MPP"

mppsc_palette	dc.w $000,$000,$000,$000,$000,$000,$000,$000,$777,$777,$777,$777,$777,$777,$777,$777

; *** Technical Scroller
techscText	incbin "TechText_h10_w368.bin"
techscText_end

; *** Precompute Screen
precomp_img	incbin "SWLOAD.bin"
precomp_palette	dc.w $0000,$0fff,$0222,$0444,$0111,$0888,$0777,$0eee,$0999,$0333,$0666,$0aaa,$0555,$0ddd,$0ccc,$0bbb

SEQ_PRCMP_TAL	equ 1
SEQ_PRCMP_SCR_B	equ SEQ_PRCMP_TAL+50
SEQ_PRCMP_SCR_E	equ SEQ_PRCMP_SCR_B+120
SEQ_PRCMP_PRES	equ SEQ_PRCMP_SCR_E+25
SEQ_PRCMP_SW	equ SEQ_PRCMP_PRES+75	
SEQ_PRCMP_TXT1	equ SEQ_PRCMP_SW+75
SEQ_PRCMP_TXT2	equ SEQ_PRCMP_TXT1+50
SEQ_PRCMP_TXT3	equ SEQ_PRCMP_TXT2+50

precompAction2	dc.l 1,vblActionSetAddr,precomp_scrStep,SCRLINE_LEN
	dc.l 274,vblActionSetAddr,precomp_scrStep,0
	dc.l 0,0,0,0
	
precompAction	dc.l SEQ_PRCMP_TAL,vblActionSetAddr,precomp_cpyOffset,0		; The Arctic Land
	dc.l SEQ_PRCMP_TAL,vblActionSetAddr,precomp_cpyNbL,41
	dc.l SEQ_PRCMP_SCR_B,vblActionSetAddr,precomp_scrStep,SCRLINE_LEN	; Scroll Begin
	dc.l SEQ_PRCMP_SCR_E,vblActionSetAddr,precomp_scrStep,0		; Scroll End 
	dc.l SEQ_PRCMP_PRES,vblActionSetAddr,precomp_cpyOffset,60*SCRLINE_LEN	; Presents
	dc.l SEQ_PRCMP_PRES,vblActionSetAddr,precomp_cpyNbL,11
	dc.l SEQ_PRCMP_SW,vblActionSetAddr,precomp_cpyOffset,96*SCRLINE_LEN	; SW
	dc.l SEQ_PRCMP_SW,vblActionSetAddr,precomp_cpyNbL,73
	dc.l SEQ_PRCMP_TXT1,vblActionSetAddr,precomp_cpyOffset,210*SCRLINE_LEN	; Txt1
	dc.l SEQ_PRCMP_TXT1,vblActionSetAddr,precomp_cpyNbL,12
	dc.l SEQ_PRCMP_TXT2,vblActionSetAddr,precomp_cpyOffset,229*SCRLINE_LEN	; Txt2
	dc.l SEQ_PRCMP_TXT2,vblActionSetAddr,precomp_cpyNbL,12
	dc.l SEQ_PRCMP_TXT3,vblActionSetAddr,precomp_cpyOffset,248*SCRLINE_LEN	; Txt3
	dc.l SEQ_PRCMP_TXT3,vblActionSetAddr,precomp_cpyNbL,12
	dc.l 0,0,0,0

; -----------------------------------------------------------------------------
	BSS
; -----------------------------------------------------------------------------
bss:
; *** Generic	
curPhysBase	ds.l 1
curLogBase	ds.l 1

scrBuff1	ds.l ((FS_SCRLINE_LEN*FS_SCR_NBLINES+256)/4)	; 2 Fullscreen buffers with margins
	ds.l FS_SCRLINE_LEN*25		; 100 lines of margin
scrBuff2	ds.l ((FS_SCRLINE_LEN*FS_SCR_NBLINES+256)/4)
	ds.l FS_SCRLINE_LEN*25
scrBuff_end

; Buffer that will contain the mod for the replay routine
mp_buffer	ds.l ($948AB+4)/4
mp_buffer_end

sav_sp	ds.l 1

; *** SW Logo screen
updateLogo	ds.l 1	; 0 = Do not show, else the source address
updateLogoMode	ds.l 1	; 0 = Normal, else Zoom out
updateLogoPos	ds.l 1	; 0 = Do not move, else use position table
logoPrevPos	ds.l 2	; Address & X%16

logo_x	ds.w 1
logo_y	ds.w 1

blit_params	ds.l 1	;  0 - Destination Address
	ds.l 1	;  4 - Source address
	ds.w 1	;  8 - SXinc
	REPT 2
	ds.w 1	;  +0 - Xcount
	ds.w 1	;  +2 - LMASK
	ds.b 1	;  +4 - SKEW/NFSR/FXSR
	ds.b 1	;  +5 - Unused
	ds.w 1	;  +6 - DYInc
	ds.w 1	;  +8 - SYInc
	ENDR

blit_mask_addr	ds.l 1
blit_mask_value	ds.w 1

blit_sxcount	ds.w 1
blit_dxcount	ds.w 1
blit_zoom_dx	ds.w 1	
	
blit_fill_data	ds.w 3*2
blit_fill_regs	ds.l 16
blit_nb_lines	ds.w 2
blit_line_jump	ds.l 1

blit_clean_addr	ds.l 2
blit_clean_mode	ds.w 1

swlogo_jmpTable	ds.l FS_SCR_NBLINES

; *** SW Scroller
swfontLinesX	ds.w SWFONT_LINES_NB*SWFONT_NB_SIZES*SWFONT_W*2	
swMap	ds.l (SWMAP_NB_CHARS*SWMAP_H)
swMapMid	ds.l (SWMAP_NB_CHARS*SWMAP_H)	

; *** MPP Scroller
mppscText_pos	ds.l 1

; *** Technical Scroller
techscText_pos	ds.l 1
techscText_stop	ds.l 1

; *** Precompute Screen
precomp_cpyOffset ds.l 1
precomp_cpyNbL	ds.l 1
precomp_scrStep	ds.l 1
precomp_scrAddr	ds.l 1
