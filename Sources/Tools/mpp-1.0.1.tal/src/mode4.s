;---------------------------------------------------------------------
;	Multipalette routine.
;	by Zerkman / Sector One
;	New T.AL mode
;	mode 4: 416x273, CPU based, displays 48+6 colors per scanline
;		with overscan and non-uniform repartition of color changes.
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
m4_begin:
	dc.w	416			; width
	dc.w	273			; height
	dc.w	48			; colors per scanline
	dc.w	48			; stored colors per scanline
	dc.w	224			; physical screen line size in bytes
	dc.w	4			; number of bitplanes	
	dc.w	97 			; timer A data
	dc.w	0			; default flags
m4_pal:	dc.l	0			; palette address
	bra.w	m4_init
	bra.w	m4_palette_unpack
m4_tab:	bra.w	m4_timera1


; Palette unpacking.
; a0: destination unpacked palette
; a5: get_color function
; d5-d7/a4-a6 : reserved for get_color function
m4_palette_unpack:
	move	#272,d2			; line counter
m4_pu_newline:
	moveq	#47,d1			; 48 colors per line
m4_pu_newcol:
	jsr	(a5)
	move	d0,(a0)+
	dbra	d1,m4_pu_newcol
	dbra	d2,m4_pu_newline
	rts

; Init routine.
; a0: file structure address
; a1: destination palette
m4_init:
	move.b	#2,$ffff820a.w
	clr.b	$ffff8260.w

	rts

m4_timera1:
	move	#$2100,sr
	stop	#$2100
	move	#$2700,sr

; top border HBL=33, LineCycles=452~460
	naupe	90
	clr.b	$ffff820a.w
	naupe	11
	move.b	#2,$ffff820a.w
	move.l	a7,usp

	moveq 	#2,d7	; 2=50Hz but also HiRes
m4_tstsync0:
	move.b	$ffff8209.w,d0
	beq.s	m4_tstsync0
	neg.b	d0
	lsr.l	d0,d0

	move.l	m4_pal(pc),a0	; 4
	lea	$ffff8240.w,a1	; 2
	lea	$ffff824c.w,a7	; 2
	naupe	(36-4+4)
	
	
	REPT 228
	movem.l	(a0)+,d1-d5	; 52 = 13
	movem.l	d1-d5,(a7)	; 48 = 12
	nop
	move.b	d7,$ffff8260.w	;switch mono for left border
	move.w	d7,$ffff8260.w
	naupe 2	
	movem.l	(a0)+,d2-d6/a3-a5	; 19
	movem.l	d2-d6/a3-a5,(a1)	; 18
	movem.l	(a0)+,d0-d6/a3-a6	; 100 = 25
	movem.l	d0-d6/a3,(a1)		; 72 = 18
	movem.l	a4-a6,(a1)		; 24 = 8
	move.w	d7,$ffff820a.w	; 60/50 Hz switch for right border
	move.b	d7,$ffff820a.w	
	ENDR	
	
	movem.l	(a0)+,d1-d6	; 60 = 15
	movem.l	d1-d3,(a7)	; 32 = 8
	move.w 	d7,$ffff820a.w	; 60Hz to start opening bottom border
	move.b	d7,$ffff8260.w	;switch mono for left border
	move.w	d7,$ffff8260.w
	move.b 	d7,$ffff820a.w	; go back to 50Hz, the bottom border is opened
	move.l	d6,d2		; 1
	movem.l	(a0)+,d3-d6/a3-a5	; 17
	movem.l	d2-d6/a3-a5,(a1)	; 18
	movem.l	(a0)+,d0-d6/a3-a6	; 100 = 25
	movem.l	d0-d6/a3,(a1)		; 72 = 18
	movem.l	a4-a6,(a1)		; 24 = 8
	move.w	d7,$ffff820a.w	; 60/50 Hz switch for right border
	move.b	d7,$ffff820a.w	

	REPT 43
	movem.l	(a0)+,d1-d5	; 52 = 13
	movem.l	d1-d5,(a7)	; 48 = 12
	nop
	move.b	d7,$ffff8260.w	;switch mono for left border
	move.w	d7,$ffff8260.w
	naupe 2
	movem.l	(a0)+,d2-d6/a3-a5	; 19
	movem.l	d2-d6/a3-a5,(a1)	; 18
	movem.l	(a0)+,d0-d6/a3-a6	; 100 = 25
	movem.l	d0-d6/a3,(a1)		; 72 = 18
	movem.l	a4-a6,(a1)		; 24 = 8
	move.w	d7,$ffff820a.w	; 60/50 Hz switch for right border
	move.b	d7,$ffff820a.w	
	ENDR
	
	rept	8
	clr.l	(a1)+
	endr

.end	move.l	usp,a7
	move	#$2300,sr
	rts
