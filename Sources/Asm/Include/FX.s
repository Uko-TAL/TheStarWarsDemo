; Sub routines to manage demo FXs
; The Arctic Land (T.AL) 2019
; Contact: uko.tal@gmail.com or uko at http://www.atari-forum.com

	TEXT
	
	; This file must be included at the top of the main code
	; but also contains code... so we directly go to the main code !
	bra main
	
	; Warning, more than 10 macro parameters are required
	; vasmm68k_mot -Ftos -monst -align -allmp
	
; -----------------------------------------------------------------------------
; Macros
; -----------------------------------------------------------------------------	
; Display a multi-line text
; $FF is line separator, 0 text end
; \1 Address of the text
; \2 Address of the mapping between text chars and description of the font (sizes)
; \3 Address of the font size & description
; \4 Address of the font data
; \5 Address of the screen
; \6 Starting Screen line
; \7 Starting X position 
; \8 Number of bitplanes
; \9 Height of the font
; \a Screen line length in bytes
; \b Address of the buffer to store the modified area coordinates (to get cleared the next time)
;
parseText:	macro
	movem.l d0-a6,-(sp)
	move.l \b,a5
.clrPrevText\@	move.l (a5)+,d0
	beq.s .loadParams\@	; No (more) previous text to clear
	move.l (a5)+,d1
	sub.l d0,d1

	lea HW_BLT_ADR.w,a6
	move.w #$FFFF,HW_BLT_LMASK_O(a6)
	move.w #$FFFF,HW_BLT_MMASK_O(a6)
	move.w #$FFFF,HW_BLT_RMASK_O(a6)
	move.w #2,HW_BLT_DXINC_O(a6)	; Does not depend of the font !
	move.b #0,HW_BLT_HOP_O(a6)	; All ones
	move.b #0,HW_BLT_LOP_O(a6)	; All zero
	move.b #0,HW_BLT_SKEW_O(a6)
	move.l #\a,d2
	sub.w d1,d2
	addq.l #2,d2
	move.w d2,HW_BLT_DYINC_O(a6)
	lsr.w #1,d1
	move.w d1,HW_BLT_XCOUNT_O(a6)
	
	move.l d0,HW_BLT_DADR_O(a6)
	move.w #\9,HW_BLT_YCOUNT_O(a6)	; Run in HOG mode
	or.b #$C0,HW_BLT_CTL_O(a6)
	bra .clrPrevText\@
	
.loadParams\@	move.l \1,a0
	lea \2,a1
	lea \3,a2
	lea \4,a3
	move.l \5,a4
	move.l #\6,d6
	move.l #\7,d7
	move.l \b,a5

.init\@	moveq.l #0,d0
	moveq.l #0,d1
	move.l d7,d5
	mulu.w #\a,d6
	add.w d6,a4
	move.l a4,-(sp)
	move.l a4,(a5)+		; Save address
	move.l a5,-(sp)
	
	; Common blitter initialisations
	lea HW_BLT_ADR.w,a6
	move.w #$FFFF,HW_BLT_MMASK_O(a6)
	move.w #2*\8,HW_BLT_SXINC_O(a6)	
	move.w #2*\8,HW_BLT_SYINC_O(a6)
	move.w #8,HW_BLT_DXINC_O(a6)	; Does not depend of the font !
	move.b #2,HW_BLT_HOP_O(a6)	; Source
	move.b #7,HW_BLT_LOP_O(a6)	; Source Or destination
			
.nextParse\@	move.b (a0)+,d0		; d0 = the ASCII character to be displayed
	beq .endParseText\@
	cmp.b #$FF,d0		; New line ?
	beq .newLine\@
	add.w d0,d0
	move.w (a1,d0),d0	; d0 = the offset of the character in the table of font sizes
	move.l a2,a5
	add.w d0,a5		; a5 = the address of the character in the table of font sizes
	move.w 4(a5),d0		; d0 = Nb words per bitplane per line
	move.w 6(a5),d1		; d1 = offset in the font data
	move.w 0(a5),d4		; d4 = char width
	move.l a3,a5
	add.w d1,a5		; a5 = address of the font data
	
	; Display character
.blitChar\@	move.l 4(sp),a4		; Keep on stack
	
	move.l d7,d2		
	move.l d7,d3
	andi.w #$FFF0,d2	
	lsr.w #1,d2		; d2 = X offset (bytes)
	add.w d2,a4
	andi.w #$000F,d3	; d3 = Delta X
	beq.s .aligned\@
	
	; Char is not aligned
	move.w d3,d2
	add.w d2,d2
	move.w .blit_endmask\@(PC,d2.w),d2
	move.w d2,HW_BLT_LMASK_O(a6)
	not.w d2
	move.w d2,HW_BLT_RMASK_O(a6)
	
	ori.b #%01000000,d3	; NFSR
	move.b d3,HW_BLT_SKEW_O(a6)
	addq.w #1,d0		; Increase the X count since NFSR is set
	bra.s .endAligned\@
	
	; To be kept from the usage... 128 bytes max
.blit_endmask\@	dc.w $FFFF,$7FFF,$3FFF,$1FFF,$0FFF,$07FF,$03FF,$01FF,$00FF,$007F,$003F,$001F,$000F,$0007,$0003,$0001,$0000

.aligned\@	move.w #$FFFF,HW_BLT_LMASK_O(a6)
	move.w #$FFFF,HW_BLT_RMASK_O(a6)
	move.b #0,HW_BLT_SKEW_O(a6)
	
.endAligned\@	move.w #\a,d1
	move.w d0,HW_BLT_XCOUNT_O(a6)
	subq.w #1,d0
	lsl.w #3,d0
	sub.w d0,d1
	move.w d1,HW_BLT_DYINC_O(a6)
	
	REPT \8
	move.l a4,HW_BLT_DADR_O(a6)
	move.l a5,HW_BLT_SADR_O(a6)
	lea 2(a4),a4
	lea 2(a5),a5
	move.w #\9,HW_BLT_YCOUNT_O(a6)	; Run in HOG mode
	or.b #$C0,HW_BLT_CTL_O(a6)
	ENDR
	
	add.w d4,d7
	bra .nextParse\@
	
.newLine\@	move.l (sp)+,a5
	addq.l #2,a4
	move.l a4,(a5)+
	move.l (sp)+,a4
	lea \a*(\9+10)(a4),a4
	move.w d5,d7
	move.l a4,-(sp)
	move.l a4,(a5)+
	move.l a5,-(sp)
	bra .nextParse\@
	
.endParseText\@	move.l (sp)+,a5
	addq.l #2,a4
	move.l a4,(a5)+
	move.l (sp)+,a4	
	movem.l (sp)+,d0-a6
	endm

; Perform a computation of fade of the palette, according to the parameters in the data section
; (speed, fade in/out, ...)
; \1 Palette pointer to be set (to be called by tset_palette)
fade_palette:	macro
	move.l \1,a0
	jsr fadePalette
	move.l a0,\1
	endm

; Decrement a color
; \1 The color to be decremented
decrementCol:	macro
	andi.b #$F,\1	; isolate R,G,B
	beq.s .end\@
	btst #3,\1
	bne.s .decrement\@
	subq.b #1,\1
	bset #3,\1
	bra.s .end\@
.decrement\@	bclr #3,\1
.end\@	
	endm

; Fade a list of colors
; \1 = Src list of colors
; \2 = Dst list of colors
; \3 = Number of colors 
fadeOutColorList: macro
	; Fade params
	move.l \1,a0
	move.l \2,a1

	; Fade out
	move.w #\3-1,d0
.nextCol	move.w (a0)+,d1
	move.b d1,d3
	decrementCol d3	; Blue
	lsr.w #4,d1
	move.b d1,d2
	decrementCol d2	; Green
	lsr.b #4,d1
	decrementCol d1	; Red
	lsl.b #4,d1
	or.b d2,d1
	lsl.w #4,d1
	or.b d3,d1
	move.w d1,(a1)+
	dbf d0,.nextCol
	endm

; Manages the good fade tempo !
; according to the parameters in the data section
; \1 End label name
manageFadeCount: macro
	; Is it the good step ?
	move.w fadeCount,d0
	beq \1
	
	move.w fadeCountCur,d1
	beq.s .endStep
	subq.w #1,d1
	move.w d1,fadeCountCur
	bra \1
	
.endStep	move.w fadeCountStep,fadeCountCur
	subq.w #1,d0
	move.w d0,fadeCount
	endm



; VBL actions management
; Allows to assign an action to a vbl number,
; and execute it automatically at the right time
; \1 vbl counter address
; \2 current pointer in vbl actions list
VBL_ACTION_SIZE	equ 4*4 ; 4 Long words (number, method pointer, param1, param2)

vblActionDo:	macro
	movem.l d0-d1/a0,-(sp)
	move.l \1,d0		; d0 = current VBL number
.loop\@	move.l \2,a0		; a0 = current action to process
	move.l (a0),d1		; d1 = number of the VBL to perform action	
	cmp.l d0,d1
	bne .end\@		; not the same number, exit
	
	; Do actions
	move.l #.actionDone\@,-(sp)	; return address
	move.l 4(a0),-(sp)	; jump address
	rts		; and jump !
	
.actionDone\@	lea VBL_ACTION_SIZE(a0),a0	; Action has been processed
	move.l a0,\2		; We load the next action
	bra .loop\@		; and loop in case it is also applicable to the current vbl
	
.end\@	addq.l #1,d0
	move.l d0,\1
	movem.l (sp)+,d0-d1/a0
	endm

; Copy picture to screen
; \1 = Picture address
; \2 = Screen address
; \3 = 0=Classical Low Res, 1=Full Screen Low res
; \4 = Nb bitplanes src
; \5 = nbBytesSrc (nb bytes per line in the image)
; \6 = Fill value for Nb bitplanes < 4
; \7 = Destination bitplane

copyPictToScr:	macro
	movem.l d0-a6,-(sp)
	move.l \1,a0
	move.l \2,a1
	lea (\7*2)(a1),a1	; Go to first bitplane
	
	ifeq \3
	move.w #SCR_NBLINES-1,d5
.y\@	move.w #160/8-1,d6
	else
	; First Line is sync line
	move.w #160/4-1,d5
.clear1stLine\@	move.l #0,(a1)+
	dbf d5,.clear1stLine\@

	move.w #FS_SCR_NBLINES-1,d5
	; nbBytesDest	equ 400/2	; 416 in fullscreen, we remove 16 pixels to have a symmetrical display
			; (overscans shifts display 8 pixels to the right)
.y\@	move.w #FS_DISPLINE_LEN/8-1,d6	
	endif
	
.x\@	
	ifeq \4-4
	move.l (a0)+,(a1)+
	move.l (a0)+,(a1)+
	endif
	ifeq \4-3
	move.l (a0)+,(a1)+
	move.w (a0)+,(a1)+
	move.w #\6,(a1)+
	endif
	ifeq \4-2
	move.l (a0)+,(a1)+
	move.w #\6,(a1)+
	move.w #\6,(a1)+
	endif
	ifeq \4-1
	move.w (a0)+,(a1)+
	move.w #\6,(a1)+
	move.w #\6,(a1)+
	move.w #\6,(a1)+
	endif
	dbf d6,.x\@

	ifeq \3
	;lea (nbBytesBuff-nbBytesDest)(a1),a1
	;lea (nbBytesSrc-nbBytesDest)(a0),a0
	;lea (320/2-320/2)(a1),a1 ; no need to clear !
	lea (\5-(SCRLINE_LEN)*\4/4)(a0),a0
	else
	;nbBytesSrc	equ 416/2	; 416 for overscan picture
	;nbBytesBuff	equ 448/2	; 448 in fullscreen
	;lea (448/2-400/2)(a1),a1
	move.w #(FS_SCRLINE_LEN-FS_DISPLINE_LEN)/2-1,d6
.clear\@	move.w #0,(a1)+
	dbf d6,.clear\@
	lea (\5-(FS_DISPLINE_LEN)*\4/4)(a0),a0
	endif
	dbf d5,.y\@
	movem.l (sp)+,d0-a6
	endm
	
; -----------------------------------------------------------------------------
; Sub routines
; -----------------------------------------------------------------------------	

; Here follow VBL Actions methods
; All take the vblAction Line as param in a0

; Set address contents \1=pointer to be set \2=Address
vblActionSetAddr:
	move.l a1,-(sp)
	move.l 8(a0),a1
	move.l 12(a0),(a1)
	move.l (sp)+,a1
	rts
	
; Fade out current palette \1=Number of vbls
vblActionFadeOut:
	move.l d0,-(sp)
	move.l 8(a0),d0
	lsr.w #4,d0		; 16 levels to fade
	bne.s .noNull
	moveq #1,d0
.noNull	move.w d0,fadeCountStep
	move.w d0,fadeCountCur
	move.w #16,fadeCount
	move.l (sp)+,d0
	rts

; Set new screen adress \1=Address
vblActionSetNewScren:
	move.l 8(a0),nextScreenAddr
	rts
nextScreenAddr	dc.l 0

; Fade out current palette
; INPUT/OUTPUT: A0 = Palette adress to be set
fadePalette:	movem.l d0-d1,-(sp)
	
	manageFadeCount .end
	
	movem.l d2-a6,-(sp)
	
	; Fade params
	move.l fadeInPalette,a2
	
	; Type of fade
	cmp.l #0,a2
	bne.s .fadeIn
	
	fadeOutColorList #HW_ST_PAL_ADR,#fadeTmpPalette,16 

	bra.s .setPalette
	
.fadeIn	NOP

.setPalette	movem.l (sp)+,d2-a6
	move.l #fadeTmpPalette,a0

.end	movem.l (sp)+,d0-d1
	rts

; -----------------------------------------------------------------------------	
	DATA
	even
fadeCount	dc.w 0
fadeCountStep	dc.w 0
fadeCountCur	dc.w 0	
fadeInPalette	dc.l 0 	
	
; -----------------------------------------------------------------------------	
	BSS
	
fadeTmpPalette	ds.w 16
