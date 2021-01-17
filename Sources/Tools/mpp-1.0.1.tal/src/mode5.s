;---------------------------------------------------------------------
;	Multipalette routine.
;	by Zerkman / Sector One
;	New T.AL mode
;	mode 5: 400x273, blitter based, displays 48+2 colors per scanline
;		3 bitplanes 
;		with overscan and quite-uniform repartition of color changes.
;---------------------------------------------------------------------

; This program is free software. It comes without any warranty, to
; the extent permitted by applicable law. You can redistribute it
; and/or modify it under the terms of the Do What The Fuck You Want
; To Public License, Version 2, as published by Sam Hocevar. See
; http://sam.zoy.org/wtfpl/COPYING for more details.

naupe	macro	1
	rept	\1/2
	or.l	d0,d0
	endr
	rept	\1%2
	nop
	endr
	endm

; Plugin header.
m5_begin:
	dc.w	400			; width
	dc.w	273			; height
	dc.w	48			; colors per scanline
	dc.w	48			; stored colors per scanline
	dc.w	224			; physical screen line size in bytes
	dc.w	3			; number of bitplanes
	dc.w	97 			; timer A data
	dc.w	0			; default flags
m5_pal:	dc.l	0			; palette address
	bra.w	m5_init
	bra.w	m5_palette_unpack
m5_tab:	bra.w	m5_timera1


; Palette unpacking.
; a0: destination unpacked palette
; a5: get_color function
; d5-d7/a4-a6 : reserved for get_color function
m5_palette_unpack:
	move	#272,d2			; line counter
m5_pu_newline:
	moveq	#47,d1			; 48 colors per line
m5_pu_newcol:
	jsr	(a5)
	move	d0,(a0)+
	dbra	d1,m5_pu_newcol
	dbra	d2,m5_pu_newline
	rts

; Init routine.
; a0: file structure address
; a1: destination palette
m5_init:
	move.b	#2,$ffff820a.w
	clr.b	$ffff8260.w
	
	; Clear colors for bitplane 3 & combinations with 0,1,2
	clr.l	$ffff8250.w
	clr.l	$ffff8254.w
	clr.l	$ffff8258.w
	clr.l	$ffff825C.w
	
	; Initialize blitter
	move	#2,$ffff8a20.w		; source X increment
	move	#2,$ffff8a22.w		; source Y increment
	move	#-1,$ffff8a28.w	; Endmask 1 (first write of a line)
	move	#-1,$ffff8a2a.w	; Endmask 2 (all other writes of a line)
	move	#-1,$ffff8a2c.w	; Endmask 3 (last write of a line)
	move	#2,$ffff8a2e.w		; destination X increment
	move	#-14,$ffff8a30.w	; destination Y increment
	move	#8,$ffff8a36.w	; words per line in bit-block
	move.b	#2,$ffff8a3a.w		; halftone operation (2=source)
	move.b	#3,$ffff8a3b.w		; logical operation (3=source)
	move.b	#0,$ffff8a3d.w		; skew	
	
	rts

m5_timera1:
	move	#$2100,sr
	stop	#$2100
	move	#$2700,sr

; top border HBL=33, LineCycles=452~460
	naupe	90
	clr.b	$ffff820a.w
	naupe	11
	move.b	#2,$ffff820a.w

	moveq 	#2,d7	; 2=50Hz but also HiRes
m5_tstsync0:
	move.b	$ffff8209.w,d0
	beq.s	m5_tstsync0
	neg.b	d0
	lsr.l	d0,d0

	move.l	m5_pal(pc),a0	; 4
	lea	$ffff8240.w,a1	; 2
	lea	$ffff8244.w,a2	; 2
	
	; Initialize blitter
	lea	10(a0),a3	; 8 = 2 : skip 5 first colors 
	move.l	a3,$ffff8a24.w	; 16 = 4 : source address register
	move.l	#$ffff8240,$ffff8a32.w	; 24 = 6 : destination address register
	moveq	#5,d4	; 4 = 1 : number of palettes in main area
	moveq	#1,d5	; 4 = 1 : number of palettes in border area
	move	#$c0,d6	; 8 = 2 : to start blitter
	lea	$ffff8a38.w,a3	; 8 = 2 : Y count
	lea	$ffff8a3c.w,a4	; 8 = 2 : Start blitter
	
	naupe	(36-4+4-20)

	; First line is special (5 colors to load)
	moveq	#0,d0	; 4 = 1
	moveq	#0,d1	; 4 = 1
	move	(a0)+,d1	; 8 = 2
	move.l	(a0)+,d2	; 12 = 3
	move.l	(a0)+,d3	; 12 = 3
	movem.l	d0-d3,(a1)	; 40 = 10
	naupe (26-1-1-2-3-3-10)
			
	REPT 227
	move.b	d7,$ffff8260.w	;switch mono for left border
	move.w	d7,$ffff8260.w
	naupe 3
	move	d4,(a3)	; 8 = 2 : Set Y count
	move.b	d6,(a4)	; 8 = 2 : Go !
	; Now 4 cycles of bus arbitration
	; Then 5*8*2*4 = 320 cycles of blitting
	; Then 4 cycles of bus arbitration
	nop	; 4 cycles to wait before right border
	move.w	d7,$ffff820a.w	; 60/50 Hz switch for right border
	move.b	d7,$ffff820a.w	
	move	d5,(a3)	; 8 = 2 : Set Y count
	move.b	d6,(a4)	; 8 = 2 : Go !
	; Now 4 cycles of bus arbitration
	; Then 1*8*2*4 = 64 cycles of blitting
	; 3 colors will be displayed, and the 5 other will be set in the border
	; Then 4 cycles of bus arbitration
	naupe 4
	ENDR	
	
	move.b	d7,$ffff8260.w	;switch mono for left border
	move.w	d7,$ffff8260.w
	naupe 3
	move	d4,(a3)	; 8 = 2 : Set Y count
	move.b	d6,(a4)	; 8 = 2 : Go !
	; Now 4 cycles of bus arbitration
	; Then 5*8*2*4 = 320 cycles of blitting
	; Then 4 cycles of bus arbitration
	nop	; 4 cycles to wait before right border
	move.w	d7,$ffff820a.w	; 60/50 Hz switch for right border
	move.b	d7,$ffff820a.w	
	move	d5,(a3)	; 8 = 2 : Set Y count
	move.b	d6,(a4)	; 8 = 2 : Go !
	; Now 4 cycles of bus arbitration
	; Then 1*8*2*4 = 64 cycles of blitting
	; 2 colors will be displayed, and the 6 other will be set in the border
	; Then 4 cycles of bus arbitration
	naupe 1
	move.w 	d7,$ffff820a.w	; 60Hz to start opening bottom border
	move.b	d7,$ffff8260.w	;switch mono for left border
	move.w	d7,$ffff8260.w
	move.b 	d7,$ffff820a.w	; go back to 50Hz, the bottom border is opened
	move	d4,(a3)	; 8 = 2 : Set Y count
	move.b	d6,(a4)	; 8 = 2 : Go !
	; Now 4 cycles of bus arbitration
	; Then 5*8*2*4 = 320 cycles of blitting
	; Then 4 cycles of bus arbitration
	nop	; 4 cycles to wait before right border
	move.w	d7,$ffff820a.w	; 60/50 Hz switch for right border
	move.b	d7,$ffff820a.w	

	REPT 43
	move	d5,(a3)	; 8 = 2 : Set Y count
	move.b	d6,(a4)	; 8 = 2 : Go !
	; Now 4 cycles of bus arbitration
	; Then 1*8*2*4 = 64 cycles of blitting
	; 2 colors will be displayed, and the 6 other will be set in the border
	; Then 4 cycles of bus arbitration
	naupe 4
	move.b	d7,$ffff8260.w	;switch mono for left border
	move.w	d7,$ffff8260.w
	naupe 3
	move	d4,(a3)	; 8 = 2 : Set Y count
	move.b	d6,(a4)	; 8 = 2 : Go !
	; Now 4 cycles of bus arbitration
	; Then 5*8*2*4 = 320 cycles of blitting
	; Then 4 cycles of bus arbitration
	nop	; 4 cycles to wait before right border
	move.w	d7,$ffff820a.w	; 60/50 Hz switch for right border
	move.b	d7,$ffff820a.w	
	ENDR
	
	rept	8
	clr.l	(a1)+
	endr

.end	move	#$2300,sr
	rts
