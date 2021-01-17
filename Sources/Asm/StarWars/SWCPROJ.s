; Starwars Scroller projection code
; The Arctic Land 2020

	TEXT

	; d0 = reserved for mixing bitplan data
	; a0 = Map address
	; a1 = reserved for line address
	; a2 = Screen address

swc_proj	macro
; Slice_0
	ifeq \1-0
;swc_L0:
	lea (85*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 628(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 656(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 744(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 360
; Slice_1
	ifeq \1-1
;swc_L0_1:
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 720
; Slice_2
	ifeq \1-2
;swc_L0_2:
	or.l 700(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,134(a2)	; 16
;swc_L1:
	lea (6*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 624(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 1080
; Slice_3
	ifeq \1-3
;swc_L1_1:
	or.l 700(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 1440
; Slice_4
	ifeq \1-4
;swc_L1_2:
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 1800
; Slice_5
	ifeq \1-5
;swc_L1_3:
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,134(a2)	; 16
;swc_L2:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 688(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 2160
; Slice_6
	ifeq \1-6
;swc_L2_1:
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 2520
; Slice_7
	ifeq \1-7
;swc_L2_2:
	or.l 692(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 588(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,118(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,134(a2)	; 16
;swc_L3:
	lea (6*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 2880
; Slice_8
	ifeq \1-8
;swc_L3_1:
	move.l 620(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 656(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,78(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 3240
; Slice_9
	ifeq \1-9
;swc_L3_2:
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 604(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 656(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,118(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 3600
; Slice_10
	ifeq \1-10
;swc_L3_3:
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,134(a2)	; 16
;swc_L4:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 616(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 656(a1),d0	; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 3960
; Slice_11
	ifeq \1-11
;swc_L4_1:
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,78(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 4320
; Slice_12
	ifeq \1-12
;swc_L4_2:
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 656(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,118(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,134(a2)	; 16
;swc_L5:
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 4680
; Slice_13
	ifeq \1-13
;swc_L5_1:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 680(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 576(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 668(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 652(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,78(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 5040
; Slice_14
	ifeq \1-14
;swc_L5_2:
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 656(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 5400
; Slice_15
	ifeq \1-15
;swc_L5_3:
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 668(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 588(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,134(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),136(a2)	; 20
;swc_L6:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 612(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 640(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 5760
; Slice_16
	ifeq \1-16
;swc_L6_1:
	move.l 652(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 6120
; Slice_17
	ifeq \1-17
;swc_L6_2:
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 604(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 656(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,134(a2)	; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 6480
; Slice_18
	ifeq \1-18
;swc_L6_3:
	move.l (a0)+,a1		; 12
	move.w 576(a1),136(a2)	; 20
;swc_L7:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 608(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 636(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 6840
; Slice_19
	ifeq \1-19
;swc_L7_1:
	or.l 688(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 7200
; Slice_20
	ifeq \1-20
;swc_L7_2:
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 644(a1),142(a2)	; 20
;swc_L8:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 608(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 700(a1),62(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 7560
; Slice_21
	ifeq \1-21
;swc_L8_1:
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 7920
; Slice_22
	ifeq \1-22
;swc_L8_2:
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 8280
; Slice_23
	ifeq \1-23
;swc_L8_3:
	or.l 632(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 648(a1),142(a2)	; 20
;swc_L9:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 604(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 696(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 8640
; Slice_24
	ifeq \1-24
;swc_L9_1:
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 9000
; Slice_25
	ifeq \1-25
;swc_L9_2:
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 9360
; Slice_26
	ifeq \1-26
;swc_L9_3:
	move.w 584(a1),142(a2)	; 20
;swc_L10:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 600(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 628(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 656(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 604(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 9720
; Slice_27
	ifeq \1-27
;swc_L10_1:
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 10080
; Slice_28
	ifeq \1-28
;swc_L10_2:
	or.l 688(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 652(a1),142(a2)	; 20
;swc_L11:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 600(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 692(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 10440
; Slice_29
	ifeq \1-29
;swc_L11_1:
	move.w 588(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,70(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 668(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 684(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 10800
; Slice_30
	ifeq \1-30
;swc_L11_2:
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 652(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,126(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 11160
; Slice_31
	ifeq \1-31
;swc_L11_3:
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 588(a1),142(a2)	; 20
;swc_L12:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 596(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 624(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 652(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,70(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 668(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,78(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 11520
; Slice_32
	ifeq \1-32
;swc_L12_1:
	move.l (a0)+,a1		; 12
	move.l 656(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 672(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 11880
; Slice_33
	ifeq \1-33
;swc_L12_2:
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 588(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,126(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 668(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 592(a1),142(a2)	; 20
;swc_L13:
	lea (5*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 592(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 12240
; Slice_34
	ifeq \1-34
;swc_L13_1:
	move.l 620(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 604(a1),d0		; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 12600
; Slice_35
	ifeq \1-35
;swc_L13_2:
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 676(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 692(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 12960
; Slice_36
	ifeq \1-36
;swc_L13_3:
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 604(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 660(a1),142(a2)	; 20
;swc_L14:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 592(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 620(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,70(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 13320
; Slice_37
	ifeq \1-37
;swc_L14_1:
	move.l (a0)+,a1		; 12
	move.l 664(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 604(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 13680
; Slice_38
	ifeq \1-38
;swc_L14_2:
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,110(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 640(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 656(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 596(a1),142(a2)	; 20
;swc_L15:
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 14040
; Slice_39
	ifeq \1-39
;swc_L15_1:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 588(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 616(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 700(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 588(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 680(a1),d0		; 12
	move.w d0,86(a2)	; 12
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 14400
; Slice_40
	ifeq \1-40
;swc_L15_2:
	move.w 576(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,110(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 668(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 14760
; Slice_41
	ifeq \1-41
;swc_L15_3:
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 648(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 600(a1),142(a2)	; 20
;swc_L16:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 520(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 680(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 576(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 15120
; Slice_42
	ifeq \1-42
;swc_L16_1:
	or.l 632(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 652(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,86(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,102(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 15480
; Slice_43
	ifeq \1-43
;swc_L16_2:
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,110(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 696(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,134(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 15840
; Slice_44
	ifeq \1-44
;swc_L16_3:
	move.w 668(a1),142(a2)	; 20
;swc_L17:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 584(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 612(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 576(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 660(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,86(a2)	; 12
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 16200
; Slice_45
	ifeq \1-45
;swc_L17_1:
	move.w 576(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,110(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 16560
; Slice_46
	ifeq \1-46
;swc_L17_2:
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 652(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,134(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 604(a1),142(a2)	; 20
;swc_L18:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 580(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 16920
; Slice_47
	ifeq \1-47
;swc_L18_1:
	or.l 628(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,86(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 688(a1),d0		; 20
	move.l d0,102(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 17280
; Slice_48
	ifeq \1-48
;swc_L18_2:
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,110(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 580(a1),d0	; 12
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 17640
; Slice_49
	ifeq \1-49
;swc_L18_3:
	or.w 608(a1),d0		; 12
	move.w d0,142(a2)	; 12
;swc_L19:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 512(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,86(a2)	; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 18000
; Slice_50
	ifeq \1-50
;swc_L19_1:
	move.l (a0)+,a1		; 12
	move.w 576(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 644(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 604(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 18360
; Slice_51
	ifeq \1-51
;swc_L19_2:
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 580(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 608(a1),d0		; 12
	move.w d0,142(a2)	; 12
;swc_L20:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 576(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,62(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 18720
; Slice_52
	ifeq \1-52
;swc_L20_1:
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 19080
; Slice_53
	ifeq \1-53
;swc_L20_2:
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 19440
; Slice_54
	ifeq \1-54
;swc_L20_3:
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,142(a2)	; 12
;swc_L21:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 572(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 19800
; Slice_55
	ifeq \1-55
;swc_L21_1:
	or.l 616(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 20160
; Slice_56
	ifeq \1-56
;swc_L21_2:
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L22:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 20520
; Slice_57
	ifeq \1-57
;swc_L22_1:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 568(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 20880
; Slice_58
	ifeq \1-58
;swc_L22_2:
	or.l 636(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 21240
; Slice_59
	ifeq \1-59
;swc_L22_3:
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L23:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 632(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 21600
; Slice_60
	ifeq \1-60
;swc_L23_1:
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,78(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 512(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 21960
; Slice_61
	ifeq \1-61
;swc_L23_2:
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 580(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 544(a1),d0		; 12
	move.w d0,118(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 22320
; Slice_62
	ifeq \1-62
;swc_L23_3:
	or.l 560(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L24:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 564(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 22680
; Slice_63
	ifeq \1-63
;swc_L24_1:
	or.w 612(a1),d0		; 12
	move.w d0,78(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,110(a2)	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 23040
; Slice_64
	ifeq \1-64
;swc_L24_2:
	move.l (a0)+,a1		; 12
	move.w 516(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,118(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L25:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 23400
; Slice_65
	ifeq \1-65
;swc_L25_1:
	move.l 560(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 516(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,78(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 23760
; Slice_66
	ifeq \1-66
;swc_L25_2:
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,118(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 512(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 24120
; Slice_67
	ifeq \1-67
;swc_L25_3:
	or.l 636(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L26:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 624(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 24480
; Slice_68
	ifeq \1-68
;swc_L26_1:
	or.l 548(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 580(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 544(a1),d0		; 12
	move.w d0,78(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 24840
; Slice_69
	ifeq \1-69
;swc_L26_2:
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 548(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 580(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 608(a1),d0		; 20
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 25200
; Slice_70
	ifeq \1-70
;swc_L26_3:
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L27:
	lea (4*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 556(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,70(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 512(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 25560
; Slice_71
	ifeq \1-71
;swc_L27_1:
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 25920
; Slice_72
	ifeq \1-72
;swc_L27_2:
	or.l 548(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 580(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 544(a1),d0		; 12
	move.w d0,126(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L28:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 552(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 26280
; Slice_73
	ifeq \1-73
;swc_L28_1:
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 516(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,70(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 512(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 26640
; Slice_74
	ifeq \1-74
;swc_L28_2:
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 516(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,126(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 576(a1),128(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 27000
; Slice_75
	ifeq \1-75
;swc_L28_3:
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L29:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 484(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 548(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 580(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 544(a1),d0		; 12
	move.w d0,70(a2)	; 12
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 27360
; Slice_76
	ifeq \1-76
;swc_L29_1:
	move.w 576(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 27720
; Slice_77
	ifeq \1-77
;swc_L29_2:
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 516(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,126(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 512(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 28080
; Slice_78
	ifeq \1-78
;swc_L29_3:
	move.l d0,142(a2)	; 16
;swc_L30:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 548(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 516(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,62(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 512(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 28440
; Slice_79
	ifeq \1-79
;swc_L30_1:
	or.l 632(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 28800
; Slice_80
	ifeq \1-80
;swc_L30_2:
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 548(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 580(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 544(a1),d0		; 12
	move.w d0,134(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 512(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 608(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	move.l d0,142(a2)	; 16
;swc_L31:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 544(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 512(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 544(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 29160
; Slice_81
	ifeq \1-81
;swc_L31_1:
	move.w 576(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 29520
; Slice_82
	ifeq \1-82
;swc_L31_2:
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 516(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,134(a2)	; 12
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 29880
; Slice_83
	ifeq \1-83
;swc_L31_3:
	move.w 512(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 544(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 576(a1),144(a2)	; 20
;swc_L32:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 544(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 576(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 604(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 30240
; Slice_84
	ifeq \1-84
;swc_L32_1:
	or.l 632(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 30600
; Slice_85
	ifeq \1-85
;swc_L32_2:
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 584(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 548(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 516(a1),d0	; 12
	move.l (a0)+,a1		; 12
	or.w 612(a1),d0		; 12
	move.w d0,142(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w 512(a1),144(a2)	; 20
;swc_L33:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 540(a1),48(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 30960
; Slice_86
	ifeq \1-86
;swc_L33_1:
	move.l (a0)+,a1		; 12
	move.l 572(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 636(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 600(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 31320
; Slice_87
	ifeq \1-87
;swc_L33_2:
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 31680
; Slice_88
	ifeq \1-88
;swc_L33_3:
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 616(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 548(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 516(a1),150(a2)	; 20
;swc_L34:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 536(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 568(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 32040
; Slice_89
	ifeq \1-89
;swc_L34_1:
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 32400
; Slice_90
	ifeq \1-90
;swc_L34_2:
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 620(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 32760
; Slice_91
	ifeq \1-91
;swc_L34_3:
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 584(a1),150(a2)	; 20
;swc_L35:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 468(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 568(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 632(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 33120
; Slice_92
	ifeq \1-92
;swc_L35_1:
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 33480
; Slice_93
	ifeq \1-93
;swc_L35_2:
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 588(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 520(a1),150(a2)	; 20
;swc_L36:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 33840
; Slice_94
	ifeq \1-94
;swc_L36_1:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 532(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 564(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 628(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 34200
; Slice_95
	ifeq \1-95
;swc_L36_2:
	or.l 560(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 624(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 34560
; Slice_96
	ifeq \1-96
;swc_L36_3:
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 524(a1),150(a2)	; 20
;swc_L37:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 464(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 564(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 34920
; Slice_97
	ifeq \1-97
;swc_L37_1:
	move.l 596(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 35280
; Slice_98
	ifeq \1-98
;swc_L37_2:
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 35640
; Slice_99
	ifeq \1-99
;swc_L37_3:
	or.l 560(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 592(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 524(a1),150(a2)	; 20
;swc_L38:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 528(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 560(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 36000
; Slice_100
	ifeq \1-100
;swc_L38_1:
	or.l 560(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 36360
; Slice_101
	ifeq \1-101
;swc_L38_2:
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 36720
; Slice_102
	ifeq \1-102
;swc_L38_3:
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 528(a1),150(a2)	; 20
;swc_L39:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 524(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 556(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 37080
; Slice_103
	ifeq \1-103
;swc_L39_1:
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 37440
; Slice_104
	ifeq \1-104
;swc_L39_2:
	or.l 560(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 532(a1),150(a2)	; 20
;swc_L40:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 456(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 37800
; Slice_105
	ifeq \1-105
;swc_L40_1:
	move.l 556(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 38160
; Slice_106
	ifeq \1-106
;swc_L40_2:
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,126(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 38520
; Slice_107
	ifeq \1-107
;swc_L40_3:
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 532(a1),150(a2)	; 20
;swc_L41:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 452(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 552(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 38880
; Slice_108
	ifeq \1-108
;swc_L41_1:
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 39240
; Slice_109
	ifeq \1-109
;swc_L41_2:
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 39600
; Slice_110
	ifeq \1-110
;swc_L41_3:
	or.l 568(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 536(a1),150(a2)	; 20
;swc_L42:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 516(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 39960
; Slice_111
	ifeq \1-111
;swc_L42_1:
	or.l 556(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 40320
; Slice_112
	ifeq \1-112
;swc_L42_2:
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 472(a1),150(a2)	; 20
;swc_L43:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 40680
; Slice_113
	ifeq \1-113
;swc_L43_1:
	move.w 448(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 548(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 484(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 41040
; Slice_114
	ifeq \1-114
;swc_L43_2:
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 41400
; Slice_115
	ifeq \1-115
;swc_L43_3:
	or.l 568(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 540(a1),150(a2)	; 20
;swc_L44:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 508(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 480(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 41760
; Slice_116
	ifeq \1-116
;swc_L44_1:
	or.l 548(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 42120
; Slice_117
	ifeq \1-117
;swc_L44_2:
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 42480
; Slice_118
	ifeq \1-118
;swc_L44_3:
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 544(a1),150(a2)	; 20
;swc_L45:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 508(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 544(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 512(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 480(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 484(a1),d0		; 20
	move.l d0,70(a2)	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 42840
; Slice_119
	ifeq \1-119
;swc_L45_1:
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 43200
; Slice_120
	ifeq \1-120
;swc_L45_2:
	or.l 564(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 544(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 512(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 43560
; Slice_121
	ifeq \1-121
;swc_L45_3:
	move.l 480(a1),150(a2)	; 28
;swc_L46:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 504(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 544(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 548(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 43920
; Slice_122
	ifeq \1-122
;swc_L46_1:
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 44280
; Slice_123
	ifeq \1-123
;swc_L46_2:
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 512(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 480(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 548(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L47:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 500(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 44640
; Slice_124
	ifeq \1-124
;swc_L47_1:
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 512(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 480(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 484(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 45000
; Slice_125
	ifeq \1-125
;swc_L47_2:
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 45360
; Slice_126
	ifeq \1-126
;swc_L47_3:
	move.w 544(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 548(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L48:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 500(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 45720
; Slice_127
	ifeq \1-127
;swc_L48_1:
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 544(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 46080
; Slice_128
	ifeq \1-128
;swc_L48_2:
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 512(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 480(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 484(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 46440
; Slice_129
	ifeq \1-129
;swc_L48_3:
	or.l 488(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L49:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 496(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 544(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 548(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 46800
; Slice_130
	ifeq \1-130
;swc_L49_1:
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 572(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 47160
; Slice_131
	ifeq \1-131
;swc_L49_2:
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 512(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 480(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L50:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 428(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 532(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 47520
; Slice_132
	ifeq \1-132
;swc_L50_1:
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 512(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 480(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 47880
; Slice_133
	ifeq \1-133
;swc_L50_2:
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 544(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 48240
; Slice_134
	ifeq \1-134
;swc_L50_3:
	move.l 548(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L51:
	lea (3*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 492(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 48600
; Slice_135
	ifeq \1-135
;swc_L51_1:
	or.l 504(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 484(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 48960
; Slice_136
	ifeq \1-136
;swc_L51_2:
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 484(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 49320
; Slice_137
	ifeq \1-137
;swc_L51_3:
	or.l 556(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L52:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 488(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 568(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 49680
; Slice_138
	ifeq \1-138
;swc_L52_1:
	or.l 508(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 516(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 484(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 50040
; Slice_139
	ifeq \1-139
;swc_L52_2:
	or.l 504(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 540(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 552(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 50400
; Slice_140
	ifeq \1-140
;swc_L52_3:
	or.l 564(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L53:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 420(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 524(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 544(a1),78(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 50760
; Slice_141
	ifeq \1-141
;swc_L53_1:
	move.l (a0)+,a1		; 12
	move.w 448(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 51120
; Slice_142
	ifeq \1-142
;swc_L53_2:
	move.w 512(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 480(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 560(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L54:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 484(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 51480
; Slice_143
	ifeq \1-143
;swc_L54_1:
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 564(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 51840
; Slice_144
	ifeq \1-144
;swc_L54_2:
	or.l 492(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 528(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 52200
; Slice_145
	ifeq \1-145
;swc_L54_3:
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L55:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 480(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 52560
; Slice_146
	ifeq \1-146
;swc_L55_1:
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 556(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 52920
; Slice_147
	ifeq \1-147
;swc_L55_2:
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 536(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 53280
; Slice_148
	ifeq \1-148
;swc_L55_3:
	or.l 504(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L56:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 412(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),78(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 53640
; Slice_149
	ifeq \1-149
;swc_L56_1:
	move.l (a0)+,a1		; 12
	move.w 448(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 520(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 54000
; Slice_150
	ifeq \1-150
;swc_L56_2:
	move.w 448(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,150(a2)	; 16
;swc_L57:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 476(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 54360
; Slice_151
	ifeq \1-151
;swc_L57_1:
	move.w 448(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 54720
; Slice_152
	ifeq \1-152
;swc_L57_2:
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 55080
; Slice_153
	ifeq \1-153
;swc_L57_3:
	or.l 496(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),152(a2)	; 20
;swc_L58:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 472(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 444(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 484(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 55440
; Slice_154
	ifeq \1-154
;swc_L58_1:
	or.l 492(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 55800
; Slice_155
	ifeq \1-155
;swc_L58_2:
	or.l 432(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 56160
; Slice_156
	ifeq \1-156
;swc_L58_3:
	or.l 504(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),152(a2)	; 20
;swc_L59:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 404(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 508(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 480(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 56520
; Slice_157
	ifeq \1-157
;swc_L59_1:
	or.l 500(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 56880
; Slice_158
	ifeq \1-158
;swc_L59_2:
	or.l 508(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 57240
; Slice_159
	ifeq \1-159
;swc_L59_3:
	move.w 452(a1),158(a2)	; 20
;swc_L60:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 468(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 504(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 412(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 57600
; Slice_160
	ifeq \1-160
;swc_L60_1:
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 57960
; Slice_161
	ifeq \1-161
;swc_L60_2:
	move.l (a0)+,a1		; 12
	or.l 424(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 456(a1),158(a2)	; 20
;swc_L61:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 400(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 504(a1),46(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 58320
; Slice_162
	ifeq \1-162
;swc_L61_1:
	move.l (a0)+,a1		; 12
	move.w 476(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 420(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 58680
; Slice_163
	ifeq \1-163
;swc_L61_2:
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,134(a2)	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 59040
; Slice_164
	ifeq \1-164
;swc_L61_3:
	move.l (a0)+,a1		; 12
	move.w 408(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 456(a1),158(a2)	; 20
;swc_L62:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 396(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 500(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 408(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 59400
; Slice_165
	ifeq \1-165
;swc_L62_1:
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 59760
; Slice_166
	ifeq \1-166
;swc_L62_2:
	or.l 508(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 420(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 60120
; Slice_167
	ifeq \1-167
;swc_L62_3:
	move.w 460(a1),158(a2)	; 20
;swc_L63:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 460(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 432(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 60480
; Slice_168
	ifeq \1-168
;swc_L63_1:
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,94(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 484(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 60840
; Slice_169
	ifeq \1-169
;swc_L63_2:
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 488(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 396(a1),158(a2)	; 20
;swc_L64:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 392(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 496(a1),46(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 61200
; Slice_170
	ifeq \1-170
;swc_L64_1:
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 61560
; Slice_171
	ifeq \1-171
;swc_L64_2:
	move.l 488(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,110(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 484(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 61920
; Slice_172
	ifeq \1-172
;swc_L64_3:
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 464(a1),158(a2)	; 20
;swc_L65:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 388(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 428(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 468(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 62280
; Slice_173
	ifeq \1-173
;swc_L65_1:
	move.l 480(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 424(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 488(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 62640
; Slice_174
	ifeq \1-174
;swc_L65_2:
	move.l (a0)+,a1		; 12
	move.w 408(a1),110(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 484(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 63000
; Slice_175
	ifeq \1-175
;swc_L65_3:
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 468(a1),158(a2)	; 20
;swc_L66:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 388(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 492(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 424(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 63360
; Slice_176
	ifeq \1-176
;swc_L66_1:
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 488(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),110(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 420(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 63720
; Slice_177
	ifeq \1-177
;swc_L66_2:
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 484(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 496(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 404(a1),158(a2)	; 20
;swc_L67:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 384(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 488(a1),46(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 64080
; Slice_178
	ifeq \1-178
;swc_L67_1:
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 488(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 488(a1),94(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 64440
; Slice_179
	ifeq \1-179
;swc_L67_2:
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),110(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 420(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 420(a1),142(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 64800
; Slice_180
	ifeq \1-180
;swc_L67_3:
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 472(a1),158(a2)	; 20
;swc_L68:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 444(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 420(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 65160
; Slice_181
	ifeq \1-181
;swc_L68_1:
	move.l 420(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),110(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 65520
; Slice_182
	ifeq \1-182
;swc_L68_2:
	move.l 488(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 488(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),158(a2)	; 20
;swc_L69:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 65880
; Slice_183
	ifeq \1-183
;swc_L69_1:
	move.l 444(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 484(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 460(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 66240
; Slice_184
	ifeq \1-184
;swc_L69_2:
	move.w 408(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),110(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 488(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 66600
; Slice_185
	ifeq \1-185
;swc_L69_3:
	move.w 476(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),158(a2)	; 28
;swc_L70:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 440(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 416(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 66960
; Slice_186
	ifeq \1-186
;swc_L70_1:
	or.l 496(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 484(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 448(a1),88(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 67320
; Slice_187
	ifeq \1-187
;swc_L70_2:
	move.l (a0)+,a1		; 12
	or.l 500(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),110(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 464(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 492(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 67680
; Slice_188
	ifeq \1-188
;swc_L70_3:
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 480(a1),158(a2)	; 28
;swc_L71:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 436(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 412(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,62(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 68040
; Slice_189
	ifeq \1-189
;swc_L71_1:
	move.l (a0)+,a1		; 12
	move.l 416(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),110(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 68400
; Slice_190
	ifeq \1-190
;swc_L71_2:
	move.w 384(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 504(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 508(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 68760
; Slice_191
	ifeq \1-191
;swc_L71_3:
	move.l 416(a1),158(a2)	; 28
;swc_L72:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 436(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 412(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 424(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 69120
; Slice_192
	ifeq \1-192
;swc_L72_1:
	or.l 496(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 476(a1),110(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),112(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 69480
; Slice_193
	ifeq \1-193
;swc_L72_2:
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),158(a2)	; 28
;swc_L73:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 432(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 69840
; Slice_194
	ifeq \1-194
;swc_L73_1:
	move.w 408(a1),46(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 456(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,86(a2)	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 70200
; Slice_195
	ifeq \1-195
;swc_L73_2:
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 452(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 424(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 70560
; Slice_196
	ifeq \1-196
;swc_L73_3:
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 488(a1),158(a2)	; 28
;swc_L74:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 364(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 472(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 70920
; Slice_197
	ifeq \1-197
;swc_L74_1:
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 71280
; Slice_198
	ifeq \1-198
;swc_L74_2:
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 484(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),150(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 71640
; Slice_199
	ifeq \1-199
;swc_L74_3:
	move.l (a0)+,a1		; 12
	move.w 384(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),158(a2)	; 28
;swc_L75:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 428(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),70(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 72000
; Slice_200
	ifeq \1-200
;swc_L75_1:
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 72360
; Slice_201
	ifeq \1-201
;swc_L75_2:
	or.l 428(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,158(a2)	; 16
;swc_L76:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 72720
; Slice_202
	ifeq \1-202
;swc_L76_1:
	move.l (a0)+,a1		; 12
	move.l 424(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 73080
; Slice_203
	ifeq \1-203
;swc_L76_2:
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 73440
; Slice_204
	ifeq \1-204
;swc_L76_3:
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,158(a2)	; 16
;swc_L77:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 356(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 73800
; Slice_205
	ifeq \1-205
;swc_L77_1:
	or.l 440(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 360(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 74160
; Slice_206
	ifeq \1-206
;swc_L77_2:
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 424(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 74520
; Slice_207
	ifeq \1-207
;swc_L77_3:
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,158(a2)	; 16
;swc_L78:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 420(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),54(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 74880
; Slice_208
	ifeq \1-208
;swc_L78_1:
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 75240
; Slice_209
	ifeq \1-209
;swc_L78_2:
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 364(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),150(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 75600
; Slice_210
	ifeq \1-210
;swc_L78_3:
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,158(a2)	; 16
;swc_L79:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 416(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 364(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),70(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 75960
; Slice_211
	ifeq \1-211
;swc_L79_1:
	move.l (a0)+,a1		; 12
	move.w 384(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 76320
; Slice_212
	ifeq \1-212
;swc_L79_2:
	or.l 432(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,158(a2)	; 16
;swc_L80:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 76680
; Slice_213
	ifeq \1-213
;swc_L80_1:
	move.l 348(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 344(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 424(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 77040
; Slice_214
	ifeq \1-214
;swc_L80_2:
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),128(a2)	; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 77400
; Slice_215
	ifeq \1-215
;swc_L80_3:
	move.l (a0)+,a1		; 12
	move.l 428(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,158(a2)	; 16
;swc_L81:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 412(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 77760
; Slice_216
	ifeq \1-216
;swc_L81_1:
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 360(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),94(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 78120
; Slice_217
	ifeq \1-217
;swc_L81_2:
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 344(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 340(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 78480
; Slice_218
	ifeq \1-218
;swc_L81_3:
	move.w 384(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 424(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,158(a2)	; 16
;swc_L82:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 344(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 428(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 340(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 78840
; Slice_219
	ifeq \1-219
;swc_L82_1:
	move.l 424(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 79200
; Slice_220
	ifeq \1-220
;swc_L82_2:
	move.l 348(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 344(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 364(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 360(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 79560
; Slice_221
	ifeq \1-221
;swc_L82_3:
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,158(a2)	; 16
;swc_L83:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 340(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 360(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 424(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,70(a2)	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 79920
; Slice_222
	ifeq \1-222
;swc_L83_1:
	move.l (a0)+,a1		; 12
	move.l 420(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 80280
; Slice_223
	ifeq \1-223
;swc_L83_2:
	move.l 412(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 428(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),158(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 384(a1),160(a2)	; 20
;swc_L84:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 404(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 380(a1),38(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 80640
; Slice_224
	ifeq \1-224
;swc_L84_1:
	move.l (a0)+,a1		; 12
	move.l 424(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 444(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 81000
; Slice_225
	ifeq \1-225
;swc_L84_2:
	move.l 352(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 81360
; Slice_226
	ifeq \1-226
;swc_L84_3:
	move.l 344(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 388(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 364(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 408(a1),158(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),160(a2)	; 20
;swc_L85:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 336(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 444(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 356(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 81720
; Slice_227
	ifeq \1-227
;swc_L85_1:
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 82080
; Slice_228
	ifeq \1-228
;swc_L85_2:
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 82440
; Slice_229
	ifeq \1-229
;swc_L85_3:
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 344(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 388(a1),166(a2)	; 20
;swc_L86:
	lea (2*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 332(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 376(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 420(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 82800
; Slice_230
	ifeq \1-230
;swc_L86_1:
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 83160
; Slice_231
	ifeq \1-231
;swc_L86_2:
	or.l 436(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 392(a1),166(a2)	; 20
;swc_L87:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 83520
; Slice_232
	ifeq \1-232
;swc_L87_1:
	move.l (a0)+,a1		; 12
	move.w 328(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 372(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 352(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 83880
; Slice_233
	ifeq \1-233
;swc_L87_2:
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 84240
; Slice_234
	ifeq \1-234
;swc_L87_3:
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 328(a1),166(a2)	; 20
;swc_L88:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 328(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 372(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 84600
; Slice_235
	ifeq \1-235
;swc_L88_1:
	move.l 416(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 84960
; Slice_236
	ifeq \1-236
;swc_L88_2:
	move.l 416(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 85320
; Slice_237
	ifeq \1-237
;swc_L88_3:
	move.l 352(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 396(a1),166(a2)	; 20
;swc_L89:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 324(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 368(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 85680
; Slice_238
	ifeq \1-238
;swc_L89_1:
	or.l 368(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 86040
; Slice_239
	ifeq \1-239
;swc_L89_2:
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 396(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 86400
; Slice_240
	ifeq \1-240
;swc_L89_3:
	or.l 376(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 420(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 332(a1),166(a2)	; 20
;swc_L90:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 324(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 432(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),62(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 86760
; Slice_241
	ifeq \1-241
;swc_L90_1:
	move.l (a0)+,a1		; 12
	move.l 392(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 87120
; Slice_242
	ifeq \1-242
;swc_L90_2:
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 440(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 87480
; Slice_243
	ifeq \1-243
;swc_L90_3:
	move.w 336(a1),166(a2)	; 20
;swc_L91:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 320(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 432(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 344(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 87840
; Slice_244
	ifeq \1-244
;swc_L91_1:
	move.l 348(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 416(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 88200
; Slice_245
	ifeq \1-245
;swc_L91_2:
	move.l 356(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 400(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 404(a1),166(a2)	; 20
;swc_L92:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 380(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 88560
; Slice_246
	ifeq \1-246
;swc_L92_1:
	move.l 360(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),46(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 436(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 88920
; Slice_247
	ifeq \1-247
;swc_L92_2:
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 89280
; Slice_248
	ifeq \1-248
;swc_L92_3:
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 404(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),166(a2)	; 20
;swc_L93:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 380(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 360(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),46(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 89640
; Slice_249
	ifeq \1-249
;swc_L93_1:
	move.w 320(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 412(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 90000
; Slice_250
	ifeq \1-250
;swc_L93_2:
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),150(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 90360
; Slice_251
	ifeq \1-251
;swc_L93_3:
	move.l (a0)+,a1		; 12
	move.w 320(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),166(a2)	; 28
; Align next section with slice
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 90720
; Slice_252
	ifeq \1-252
;swc_L94:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 376(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 356(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),78(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 91080
; Slice_253
	ifeq \1-253
;swc_L94_1:
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 91440
; Slice_254
	ifeq \1-254
;swc_L94_2:
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),166(a2)	; 28
;swc_L95:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 308(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 356(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 91800
; Slice_255
	ifeq \1-255
;swc_L95_1:
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 92160
; Slice_256
	ifeq \1-256
;swc_L95_2:
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 92520
; Slice_257
	ifeq \1-257
;swc_L95_3:
	move.l 364(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),166(a2)	; 28
;swc_L96:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 304(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 352(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,46(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 92880
; Slice_258
	ifeq \1-258
;swc_L96_1:
	move.l (a0)+,a1		; 12
	move.l 356(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 93240
; Slice_259
	ifeq \1-259
;swc_L96_2:
	or.l 372(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 288(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 93600
; Slice_260
	ifeq \1-260
;swc_L96_3:
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),166(a2)	; 28
;swc_L97:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 368(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 93960
; Slice_261
	ifeq \1-261
;swc_L97_1:
	or.l 380(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 94320
; Slice_262
	ifeq \1-262
;swc_L97_2:
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 368(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 94680
; Slice_263
	ifeq \1-263
;swc_L97_3:
	move.l 288(a1),166(a2)	; 28
;swc_L98:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 300(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 288(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 95040
; Slice_264
	ifeq \1-264
;swc_L98_1:
	move.l 276(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,86(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 95400
; Slice_265
	ifeq \1-265
;swc_L98_2:
	move.l 296(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 368(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 348(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),166(a2)	; 28
;swc_L99:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 296(a1),30(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 95760
; Slice_266
	ifeq \1-266
;swc_L99_1:
	move.l (a0)+,a1		; 12
	move.l 344(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 96120
; Slice_267
	ifeq \1-267
;swc_L99_2:
	move.l 368(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 96480
; Slice_268
	ifeq \1-268
;swc_L99_3:
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 304(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 352(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),166(a2)	; 28
;swc_L100:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 360(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 96840
; Slice_269
	ifeq \1-269
;swc_L100_1:
	or.l 368(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 284(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 300(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 97200
; Slice_270
	ifeq \1-270
;swc_L100_2:
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,118(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 97560
; Slice_271
	ifeq \1-271
;swc_L100_3:
	move.l 288(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),166(a2)	; 28
;swc_L101:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 292(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),38(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 368(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 97920
; Slice_272
	ifeq \1-272
;swc_L101_1:
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 300(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 98280
; Slice_273
	ifeq \1-273
;swc_L101_2:
	move.l 356(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 364(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 98640
; Slice_274
	ifeq \1-274
;swc_L101_3:
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),166(a2)	; 28
;swc_L102:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 288(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),38(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 300(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 99000
; Slice_275
	ifeq \1-275
;swc_L102_1:
	move.l 356(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 300(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),120(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 99360
; Slice_276
	ifeq \1-276
;swc_L102_2:
	move.l (a0)+,a1		; 12
	move.l 300(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),158(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),160(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 300(a1),166(a2)	; 28
;swc_L103:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 352(a1),30(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 99720
; Slice_277
	ifeq \1-277
;swc_L103_1:
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),80(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 100080
; Slice_278
	ifeq \1-278
;swc_L103_2:
	move.l 300(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 368(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 100440
; Slice_279
	ifeq \1-279
;swc_L103_3:
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 304(a1),d0		; 20
	move.l d0,166(a2)	; 16
;swc_L104:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 284(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 100800
; Slice_280
	ifeq \1-280
;swc_L104_1:
	move.l 296(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 288(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 101160
; Slice_281
	ifeq \1-281
;swc_L104_2:
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 368(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 101520
; Slice_282
	ifeq \1-282
;swc_L104_3:
	move.l 360(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,166(a2)	; 16
;swc_L105:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 280(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),54(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 101880
; Slice_283
	ifeq \1-283
;swc_L105_1:
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 304(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 288(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 102240
; Slice_284
	ifeq \1-284
;swc_L105_2:
	move.l 292(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),118(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),120(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 352(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 102600
; Slice_285
	ifeq \1-285
;swc_L105_3:
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,166(a2)	; 16
;swc_L106:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 280(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 328(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 102960
; Slice_286
	ifeq \1-286
;swc_L106_1:
	move.l 352(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 103320
; Slice_287
	ifeq \1-287
;swc_L106_2:
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 304(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 288(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 336(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 348(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,166(a2)	; 16
;swc_L107:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 103680
; Slice_288
	ifeq \1-288
;swc_L107_1:
	move.l (a0)+,a1		; 12
	move.l 276(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 288(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 368(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 104040
; Slice_289
	ifeq \1-289
;swc_L107_2:
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 324(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 304(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 104400
; Slice_290
	ifeq \1-290
;swc_L107_3:
	move.l 288(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 300(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,166(a2)	; 16
;swc_L108:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 272(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),38(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 104760
; Slice_291
	ifeq \1-291
;swc_L108_1:
	move.l (a0)+,a1		; 12
	move.l 288(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 320(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 300(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 380(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 105120
; Slice_292
	ifeq \1-292
;swc_L108_2:
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 372(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 288(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 105480
; Slice_293
	ifeq \1-293
;swc_L108_3:
	move.l 304(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 352(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,166(a2)	; 16
;swc_L109:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 272(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 352(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 105840
; Slice_294
	ifeq \1-294
;swc_L109_1:
	or.l 316(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 332(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 376(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 106200
; Slice_295
	ifeq \1-295
;swc_L109_2:
	move.l 292(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 340(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),166(a2)	; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 106560
; Slice_296
	ifeq \1-296
;swc_L109_3:
	move.l (a0)+,a1		; 12
	move.w 320(a1),168(a2)	; 20
;swc_L110:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 268(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 316(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 300(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 364(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),70(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 106920
; Slice_297
	ifeq \1-297
;swc_L110_1:
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 360(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 107280
; Slice_298
	ifeq \1-298
;swc_L110_2:
	or.l 308(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 356(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),166(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),168(a2)	; 20
;swc_L111:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 200(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 107640
; Slice_299
	ifeq \1-299
;swc_L111_1:
	move.l 316(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 364(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 108000
; Slice_300
	ifeq \1-300
;swc_L111_2:
	move.l 296(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 344(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 108360
; Slice_301
	ifeq \1-301
;swc_L111_3:
	move.l 276(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 260(a1),174(a2)	; 20
;swc_L112:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 264(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 312(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 296(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 108720
; Slice_302
	ifeq \1-302
;swc_L112_1:
	move.l 280(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 109080
; Slice_303
	ifeq \1-303
;swc_L112_2:
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 109440
; Slice_304
	ifeq \1-304
;swc_L112_3:
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 264(a1),174(a2)	; 20
;swc_L113:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 260(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 308(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 109800
; Slice_305
	ifeq \1-305
;swc_L113_1:
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 228(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 110160
; Slice_306
	ifeq \1-306
;swc_L113_2:
	move.l 296(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 110520
; Slice_307
	ifeq \1-307
;swc_L113_3:
	move.l 280(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 264(a1),174(a2)	; 20
;swc_L114:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 192(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 308(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 110880
; Slice_308
	ifeq \1-308
;swc_L114_1:
	move.l 276(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 244(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 111240
; Slice_309
	ifeq \1-309
;swc_L114_2:
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 268(a1),174(a2)	; 20
;swc_L115:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 111600
; Slice_310
	ifeq \1-310
;swc_L115_1:
	move.w 256(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 111960
; Slice_311
	ifeq \1-311
;swc_L115_2:
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 228(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 112320
; Slice_312
	ifeq \1-312
;swc_L115_3:
	move.l 300(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 268(a1),174(a2)	; 20
;swc_L116:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 252(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 304(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 112680
; Slice_313
	ifeq \1-313
;swc_L116_1:
	move.l 288(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),46(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 240(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 113040
; Slice_314
	ifeq \1-314
;swc_L116_2:
	move.l 212(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 113400
; Slice_315
	ifeq \1-315
;swc_L116_3:
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 304(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),174(a2)	; 20
;swc_L117:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 248(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 300(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),46(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 113760
; Slice_316
	ifeq \1-316
;swc_L117_1:
	move.w 256(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 308(a1),d0		; 20
	move.l d0,78(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 292(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 114120
; Slice_317
	ifeq \1-317
;swc_L117_2:
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),158(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 114480
; Slice_318
	ifeq \1-318
;swc_L117_3:
	move.l (a0)+,a1		; 12
	move.l 224(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),174(a2)	; 28
;swc_L118:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 312(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 114840
; Slice_319
	ifeq \1-319
;swc_L118_1:
	move.l 288(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 308(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 115200
; Slice_320
	ifeq \1-320
;swc_L118_2:
	move.l 284(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 308(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 115560
; Slice_321
	ifeq \1-321
;swc_L118_3:
	move.l 212(a1),174(a2)	; 28
;swc_L119:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 244(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 296(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 115920
; Slice_322
	ifeq \1-322
;swc_L119_1:
	move.w 256(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 240(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 116280
; Slice_323
	ifeq \1-323
;swc_L119_2:
	move.l d0,126(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 304(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 244(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),174(a2)	; 28
;swc_L120:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 240(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 116640
; Slice_324
	ifeq \1-324
;swc_L120_1:
	move.l 292(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 240(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 117000
; Slice_325
	ifeq \1-325
;swc_L120_2:
	move.l 292(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 304(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 117360
; Slice_326
	ifeq \1-326
;swc_L120_3:
	move.l 224(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),174(a2)	; 28
;swc_L121:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 304(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),38(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 117720
; Slice_327
	ifeq \1-327
;swc_L121_1:
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),72(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 240(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 118080
; Slice_328
	ifeq \1-328
;swc_L121_2:
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 240(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 118440
; Slice_329
	ifeq \1-329
;swc_L121_3:
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),174(a2)	; 28
;swc_L122:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 236(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 244(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 118800
; Slice_330
	ifeq \1-330
;swc_L122_1:
	move.l 296(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 304(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 119160
; Slice_331
	ifeq \1-331
;swc_L122_2:
	move.l 232(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 308(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 119520
; Slice_332
	ifeq \1-332
;swc_L122_3:
	move.l 236(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),174(a2)	; 28
;swc_L123:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 232(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 272(a1),38(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 308(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 119880
; Slice_333
	ifeq \1-333
;swc_L123_1:
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 304(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 120240
; Slice_334
	ifeq \1-334
;swc_L123_2:
	move.w 272(a1),126(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),128(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 308(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 304(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),174(a2)	; 28
;swc_L124:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 120600
; Slice_335
	ifeq \1-335
;swc_L124_1:
	move.l 232(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 284(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),38(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 240(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 280(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 120960
; Slice_336
	ifeq \1-336
;swc_L124_2:
	move.l 304(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 121320
; Slice_337
	ifeq \1-337
;swc_L124_3:
	or.l 244(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 296(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),158(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 256(a1),160(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 240(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),174(a2)	; 28
;swc_L125:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 228(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 121680
; Slice_338
	ifeq \1-338
;swc_L125_1:
	move.l 268(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 292(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 122040
; Slice_339
	ifeq \1-339
;swc_L125_2:
	move.l 276(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 244(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 122400
; Slice_340
	ifeq \1-340
;swc_L125_3:
	move.l 284(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),158(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),160(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 244(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 296(a1),174(a2)	; 28
;swc_L126:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 224(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 122760
; Slice_341
	ifeq \1-341
;swc_L126_1:
	move.l 236(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 123120
; Slice_342
	ifeq \1-342
;swc_L126_2:
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 312(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),158(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 123480
; Slice_343
	ifeq \1-343
;swc_L126_3:
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 244(a1),d0		; 20
	move.l d0,166(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),174(a2)	; 28
;swc_L127:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 224(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),54(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 123840
; Slice_344
	ifeq \1-344
;swc_L127_1:
	move.l (a0)+,a1		; 12
	move.l 276(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 276(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),110(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 124200
; Slice_345
	ifeq \1-345
;swc_L127_2:
	move.l (a0)+,a1		; 12
	move.l 288(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,166(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 124560
; Slice_346
	ifeq \1-346
;swc_L127_3:
	move.l (a0)+,a1		; 12
	move.l 236(a1),174(a2)	; 28
;swc_L128:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 220(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 300(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 124920
; Slice_347
	ifeq \1-347
;swc_L128_1:
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 288(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 125280
; Slice_348
	ifeq \1-348
;swc_L128_2:
	move.l 212(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 264(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 316(a1),d0		; 20
	move.l d0,166(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),174(a2)	; 28
;swc_L129:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 125640
; Slice_349
	ifeq \1-349
;swc_L129_1:
	move.l 216(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),30(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 244(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 126000
; Slice_350
	ifeq \1-350
;swc_L129_2:
	move.l 300(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 126360
; Slice_351
	ifeq \1-351
;swc_L129_3:
	or.l 252(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 304(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,166(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),174(a2)	; 28
;swc_L130:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 216(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),30(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 126720
; Slice_352
	ifeq \1-352
;swc_L130_1:
	move.l (a0)+,a1		; 12
	move.w 192(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 244(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 260(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 244(a1),d0		; 20
	move.l d0,70(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 232(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 127080
; Slice_353
	ifeq \1-353
;swc_L130_2:
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 127440
; Slice_354
	ifeq \1-354
;swc_L130_3:
	move.l 228(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),166(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),168(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 308(a1),174(a2)	; 28
;swc_L131:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 212(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,30(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 127800
; Slice_355
	ifeq \1-355
;swc_L131_1:
	move.l 228(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 244(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 128160
; Slice_356
	ifeq \1-356
;swc_L131_2:
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 128520
; Slice_357
	ifeq \1-357
;swc_L131_3:
	move.w 204(a1),166(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),168(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 244(a1),174(a2)	; 28
;swc_L132:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 144(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,30(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 128880
; Slice_358
	ifeq \1-358
;swc_L132_1:
	move.w 204(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),64(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 244(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 129240
; Slice_359
	ifeq \1-359
;swc_L132_2:
	move.l 224(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,134(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 244(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 129600
; Slice_360
	ifeq \1-360
;swc_L132_3:
	or.l 248(a1),d0		; 20
	move.l d0,174(a2)	; 16
;swc_L133:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 208(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,30(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),64(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 129960
; Slice_361
	ifeq \1-361
;swc_L133_1:
	move.l (a0)+,a1		; 12
	move.l 244(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),126(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 130320
; Slice_362
	ifeq \1-362
;swc_L133_2:
	move.l (a0)+,a1		; 12
	move.w 204(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 244(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,174(a2)	; 16
;swc_L134:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 204(a1),16(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 130680
; Slice_363
	ifeq \1-363
;swc_L134_1:
	move.w 192(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 180(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 236(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 131040
; Slice_364
	ifeq \1-364
;swc_L134_2:
	move.l 220(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 172(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 131400
; Slice_365
	ifeq \1-365
;swc_L134_3:
	move.l 244(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,174(a2)	; 16
;swc_L135:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 136(a1),16(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 244(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 131760
; Slice_366
	ifeq \1-366
;swc_L135_1:
	move.l 232(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 132120
; Slice_367
	ifeq \1-367
;swc_L135_2:
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 172(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),134(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),136(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 248(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 236(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 132480
; Slice_368
	ifeq \1-368
;swc_L135_3:
	move.l 224(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),174(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),176(a2)	; 20
;swc_L136:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 200(a1),16(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 252(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 132840
; Slice_369
	ifeq \1-369
;swc_L136_1:
	move.l 208(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 133200
; Slice_370
	ifeq \1-370
;swc_L136_2:
	move.l 240(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 236(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 133560
; Slice_371
	ifeq \1-371
;swc_L136_3:
	move.w 204(a1),174(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),176(a2)	; 20
;swc_L137:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 196(a1),16(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 240(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 133920
; Slice_372
	ifeq \1-372
;swc_L137_1:
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 134280
; Slice_373
	ifeq \1-373
;swc_L137_2:
	move.l 152(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 196(a1),182(a2)	; 20
;swc_L138:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 134640
; Slice_374
	ifeq \1-374
;swc_L138_1:
	move.w 128(a1),16(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 248(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 248(a1),d0		; 20
	move.l d0,62(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 172(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 135000
; Slice_375
	ifeq \1-375
;swc_L138_2:
	move.l 228(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 135360
; Slice_376
	ifeq \1-376
;swc_L138_3:
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 132(a1),182(a2)	; 20
;swc_L139:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 192(a1),16(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 180(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 135720
; Slice_377
	ifeq \1-377
;swc_L139_1:
	move.l 236(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 248(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 136080
; Slice_378
	ifeq \1-378
;swc_L139_2:
	move.l 208(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 136440
; Slice_379
	ifeq \1-379
;swc_L139_3:
	move.l 176(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),182(a2)	; 20
;swc_L140:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 252(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 136800
; Slice_380
	ifeq \1-380
;swc_L140_1:
	move.l 212(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 180(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 236(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 137160
; Slice_381
	ifeq \1-381
;swc_L140_2:
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 240(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,142(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 244(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 137520
; Slice_382
	ifeq \1-382
;swc_L140_3:
	move.l 224(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),182(a2)	; 20
;swc_L141:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 184(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),54(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 137880
; Slice_383
	ifeq \1-383
;swc_L141_1:
	move.w 192(a1),56(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 180(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 236(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 138240
; Slice_384
	ifeq \1-384
;swc_L141_2:
	move.l 232(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 180(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 236(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 138600
; Slice_385
	ifeq \1-385
;swc_L141_3:
	move.l 140(a1),182(a2)	; 28
;swc_L142:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 180(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 200(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 244(a1),62(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 138960
; Slice_386
	ifeq \1-386
;swc_L142_1:
	move.l (a0)+,a1		; 12
	move.l 168(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),126(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 139320
; Slice_387
	ifeq \1-387
;swc_L142_2:
	move.l (a0)+,a1		; 12
	move.l 212(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 248(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),182(a2)	; 28
;swc_L143:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 180(a1),14(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 139680
; Slice_388
	ifeq \1-388
;swc_L143_1:
	move.l (a0)+,a1		; 12
	move.l 236(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 244(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),78(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 140040
; Slice_389
	ifeq \1-389
;swc_L143_2:
	move.l (a0)+,a1		; 12
	move.l 216(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 204(a1),142(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 140400
; Slice_390
	ifeq \1-390
;swc_L143_3:
	move.w 128(a1),144(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 240(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 212(a1),182(a2)	; 28
;swc_L144:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 176(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 140760
; Slice_391
	ifeq \1-391
;swc_L144_1:
	move.l 148(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 141120
; Slice_392
	ifeq \1-392
;swc_L144_2:
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 141480
; Slice_393
	ifeq \1-393
;swc_L144_3:
	move.l 176(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),182(a2)	; 28
;swc_L145:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 176(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 232(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),46(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 141840
; Slice_394
	ifeq \1-394
;swc_L145_1:
	move.l (a0)+,a1		; 12
	move.l 196(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 184(a1),d0		; 20
	move.l d0,54(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,102(a2)	; 16
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 142200
; Slice_395
	ifeq \1-395
;swc_L145_2:
	move.l (a0)+,a1		; 12
	move.l 176(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 216(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 244(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),166(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 142560
; Slice_396
	ifeq \1-396
;swc_L145_3:
	move.l (a0)+,a1		; 12
	move.l 160(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),182(a2)	; 28
;swc_L146:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 172(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),46(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),54(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 142920
; Slice_397
	ifeq \1-397
;swc_L146_1:
	move.l (a0)+,a1		; 12
	move.l 240(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),118(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 143280
; Slice_398
	ifeq \1-398
;swc_L146_2:
	move.l (a0)+,a1		; 12
	move.l 160(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 208(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,150(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 220(a1),182(a2)	; 28
;swc_L147:
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 143640
; Slice_399
	ifeq \1-399
;swc_L147_1:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 168(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),46(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),48(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 248(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),70(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 144000
; Slice_400
	ifeq \1-400
;swc_L147_2:
	move.l (a0)+,a1		; 12
	move.l 156(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 252(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 176(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),134(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 144360
; Slice_401
	ifeq \1-401
;swc_L147_3:
	move.l (a0)+,a1		; 12
	move.l 144(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 192(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 180(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),182(a2)	; 28
;swc_L148:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 100(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 224(a1),22(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 144720
; Slice_402
	ifeq \1-402
;swc_L148_1:
	move.l (a0)+,a1		; 12
	move.l 148(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),86(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 145080
; Slice_403
	ifeq \1-403
;swc_L148_2:
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 244(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 145440
; Slice_404
	ifeq \1-404
;swc_L148_3:
	move.w 128(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),182(a2)	; 28
;swc_L149:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 164(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 145800
; Slice_405
	ifeq \1-405
;swc_L149_1:
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,46(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 146160
; Slice_406
	ifeq \1-406
;swc_L149_2:
	or.l 188(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 228(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),150(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),152(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 146520
; Slice_407
	ifeq \1-407
;swc_L149_3:
	move.l 176(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),182(a2)	; 28
;swc_L150:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 160(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),38(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 146880
; Slice_408
	ifeq \1-408
;swc_L150_1:
	move.l 176(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 147240
; Slice_409
	ifeq \1-409
;swc_L150_2:
	move.l 172(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 147600
; Slice_410
	ifeq \1-410
;swc_L150_3:
	move.l 164(a1),182(a2)	; 28
;swc_L151:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 160(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),38(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 147960
; Slice_411
	ifeq \1-411
;swc_L151_1:
	move.l 160(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 148320
; Slice_412
	ifeq \1-412
;swc_L151_2:
	move.l 156(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,158(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),182(a2)	; 28
;swc_L152:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 156(a1),14(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 148680
; Slice_413
	ifeq \1-413
;swc_L152_1:
	move.l (a0)+,a1		; 12
	move.l 148(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),38(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),40(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 149040
; Slice_414
	ifeq \1-414
;swc_L152_2:
	move.l 144(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 149400
; Slice_415
	ifeq \1-415
;swc_L152_3:
	move.l 76(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),158(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),160(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),182(a2)	; 28
;swc_L153:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 152(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 149760
; Slice_416
	ifeq \1-416
;swc_L153_1:
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,38(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),94(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 150120
; Slice_417
	ifeq \1-417
;swc_L153_2:
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,102(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 180(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),158(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 150480
; Slice_418
	ifeq \1-418
;swc_L153_3:
	move.w 128(a1),160(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 120(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 180(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),182(a2)	; 28
;swc_L154:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 152(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),30(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 150840
; Slice_419
	ifeq \1-419
;swc_L154_1:
	move.l 180(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 151200
; Slice_420
	ifeq \1-420
;swc_L154_2:
	move.l 180(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 188(a1),d0		; 20
	move.l d0,166(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 151560
; Slice_421
	ifeq \1-421
;swc_L154_3:
	move.l 180(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),182(a2)	; 28
;swc_L155:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 148(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),30(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),32(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 184(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 151920
; Slice_422
	ifeq \1-422
;swc_L155_1:
	move.l 164(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 180(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 152280
; Slice_423
	ifeq \1-423
;swc_L155_2:
	move.l 168(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 124(a1),d0		; 20
	move.l d0,166(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 184(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),182(a2)	; 28
;swc_L156:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 152640
; Slice_424
	ifeq \1-424
;swc_L156_1:
	move.l (a0)+,a1		; 12
	move.l 80(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 124(a1),d0		; 20
	move.l d0,30(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 184(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),70(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 153000
; Slice_425
	ifeq \1-425
;swc_L156_2:
	move.l (a0)+,a1		; 12
	move.l 84(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 180(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 153360
; Slice_426
	ifeq \1-426
;swc_L156_3:
	move.l 156(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),166(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),168(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 120(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 180(a1),182(a2)	; 28
;swc_L157:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 76(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),22(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 153720
; Slice_427
	ifeq \1-427
;swc_L157_1:
	move.w 64(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 154080
; Slice_428
	ifeq \1-428
;swc_L157_2:
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 154440
; Slice_429
	ifeq \1-429
;swc_L157_3:
	move.l 144(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),166(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),168(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),182(a2)	; 28
;swc_L158:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 140(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),22(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),24(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 120(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 154800
; Slice_430
	ifeq \1-430
;swc_L158_1:
	move.l 180(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 155160
; Slice_431
	ifeq \1-431
;swc_L158_2:
	move.l 188(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 155520
; Slice_432
	ifeq \1-432
;swc_L158_3:
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 124(a1),d0		; 20
	move.l d0,174(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 184(a1),182(a2)	; 28
;swc_L159:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 72(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 124(a1),d0		; 20
	move.l d0,22(a2)	; 16
	move.l (a0)+,a1		; 12
	move.l 184(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 155880
; Slice_433
	ifeq \1-433
;swc_L159_1:
	move.l 100(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 156240
; Slice_434
	ifeq \1-434
;swc_L159_2:
	move.l 176(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),174(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),176(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 156600
; Slice_435
	ifeq \1-435
;swc_L159_3:
	move.l 120(a1),182(a2)	; 28
;swc_L160:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 68(a1),8(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),16(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 156960
; Slice_436
	ifeq \1-436
;swc_L160_1:
	move.l 88(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 188(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 157320
; Slice_437
	ifeq \1-437
;swc_L160_2:
	move.l 100(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 132(a1),d0	; 16
	move.l (a0)+,a1		; 12
	or.l 124(a1),d0		; 20
	move.l d0,182(a2)	; 16
;swc_L161:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 132(a1),8(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 157680
; Slice_438
	ifeq \1-438
;swc_L161_1:
	move.l 124(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 180(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 158040
; Slice_439
	ifeq \1-439
;swc_L161_2:
	move.l 76(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 184(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 158400
; Slice_440
	ifeq \1-440
;swc_L161_3:
	move.l 156(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 144(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),182(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 128(a1),184(a2)	; 20
;swc_L162:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 64(a1),8(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 184(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 158760
; Slice_441
	ifeq \1-441
;swc_L162_1:
	move.l 112(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 159120
; Slice_442
	ifeq \1-442
;swc_L162_2:
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 184(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 168(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 152(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 159480
; Slice_443
	ifeq \1-443
;swc_L162_3:
	move.l 80(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),182(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),184(a2)	; 20
;swc_L163:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w 128(a1),8(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 120(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 159840
; Slice_444
	ifeq \1-444
;swc_L163_1:
	move.l 100(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 156(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 136(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 160200
; Slice_445
	ifeq \1-445
;swc_L163_2:
	move.l 184(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 164(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 160560
; Slice_446
	ifeq \1-446
;swc_L163_3:
	move.l 72(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),190(a2)	; 20
;swc_L164:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 124(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 180(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 160920
; Slice_447
	ifeq \1-447
;swc_L164_1:
	move.l 88(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 184(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 161280
; Slice_448
	ifeq \1-448
;swc_L164_2:
	move.l 108(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 140(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),190(a2)	; 20
;swc_L165:
	lea (1*SWMAP_LINE_LEN)(a0),a0	; 8
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 161640
; Slice_449
	ifeq \1-449
;swc_L165_1:
	move.l (a0)+,a1		; 12
	move.l 120(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),70(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 162000
; Slice_450
	ifeq \1-450
;swc_L165_2:
	move.l (a0)+,a1		; 12
	move.l 144(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 176(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 162360
; Slice_451
	ifeq \1-451
;swc_L165_3:
	move.l 100(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),190(a2)	; 28
;swc_L166:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 116(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),14(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 162720
; Slice_452
	ifeq \1-452
;swc_L166_1:
	move.l (a0)+,a1		; 12
	move.l 108(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 148(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),86(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 163080
; Slice_453
	ifeq \1-453
;swc_L166_2:
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 172(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 163440
; Slice_454
	ifeq \1-454
;swc_L166_3:
	move.l 92(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),190(a2)	; 28
;swc_L167:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 116(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),30(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 163800
; Slice_455
	ifeq \1-455
;swc_L167_1:
	move.l (a0)+,a1		; 12
	move.l 100(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 160(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 164160
; Slice_456
	ifeq \1-456
;swc_L167_2:
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 164520
; Slice_457
	ifeq \1-457
;swc_L167_3:
	move.l 152(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),190(a2)	; 28
;swc_L168:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 112(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),46(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 164880
; Slice_458
	ifeq \1-458
;swc_L168_1:
	move.l (a0)+,a1		; 12
	move.l 88(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 165240
; Slice_459
	ifeq \1-459
;swc_L168_2:
	move.l 116(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 165600
; Slice_460
	ifeq \1-460
;swc_L168_3:
	move.l 80(a1),190(a2)	; 28
;swc_L169:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 44(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),62(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 165960
; Slice_461
	ifeq \1-461
;swc_L169_1:
	move.l (a0)+,a1		; 12
	move.l 80(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 166320
; Slice_462
	ifeq \1-462
;swc_L169_2:
	move.l 108(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 24(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),190(a2)	; 28
;swc_L170:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 108(a1),6(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 166680
; Slice_463
	ifeq \1-463
;swc_L170_1:
	move.l (a0)+,a1		; 12
	move.l 104(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 20(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),78(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 167040
; Slice_464
	ifeq \1-464
;swc_L170_2:
	move.l (a0)+,a1		; 12
	move.l 72(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 44(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 167400
; Slice_465
	ifeq \1-465
;swc_L170_3:
	move.l 104(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),190(a2)	; 28
;swc_L171:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 104(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 36(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),22(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 167760
; Slice_466
	ifeq \1-466
;swc_L171_1:
	move.l (a0)+,a1		; 12
	move.l 96(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 12(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 168120
; Slice_467
	ifeq \1-467
;swc_L171_2:
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),158(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 168480
; Slice_468
	ifeq \1-468
;swc_L171_3:
	move.l (a0)+,a1		; 12
	move.l 96(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 28(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),190(a2)	; 28
;swc_L172:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 104(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 168840
; Slice_469
	ifeq \1-469
;swc_L172_1:
	move.l 24(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 169200
; Slice_470
	ifeq \1-470
;swc_L172_2:
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 40(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 169560
; Slice_471
	ifeq \1-471
;swc_L172_3:
	move.l 96(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 24(a1),190(a2)	; 28
;swc_L173:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 100(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 28(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),46(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 169920
; Slice_472
	ifeq \1-472
;swc_L173_1:
	move.l (a0)+,a1		; 12
	move.l 16(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 124(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 170280
; Slice_473
	ifeq \1-473
;swc_L173_2:
	move.l 120(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 44(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 32(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 170640
; Slice_474
	ifeq \1-474
;swc_L173_3:
	move.l 92(a1),190(a2)	; 28
;swc_L174:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 32(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 92(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 20(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 12(a1),62(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 171000
; Slice_475
	ifeq \1-475
;swc_L174_1:
	move.l (a0)+,a1		; 12
	move.l 76(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 171360
; Slice_476
	ifeq \1-476
;swc_L174_2:
	move.l 48(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 40(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 32(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 96(a1),190(a2)	; 28
;swc_L175:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 96(a1),6(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 171720
; Slice_477
	ifeq \1-477
;swc_L175_1:
	move.l (a0)+,a1		; 12
	move.l 92(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 24(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 16(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),78(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 172080
; Slice_478
	ifeq \1-478
;swc_L175_2:
	move.l (a0)+,a1		; 12
	move.l 4(a1),86(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),94(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 172440
; Slice_479
	ifeq \1-479
;swc_L175_3:
	move.l 44(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 36(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 32(a1),190(a2)	; 28
;swc_L176:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 92(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 24(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),22(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 172800
; Slice_480
	ifeq \1-480
;swc_L176_1:
	move.l (a0)+,a1		; 12
	move.l 20(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 12(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 173160
; Slice_481
	ifeq \1-481
;swc_L176_2:
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 48(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 44(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 173520
; Slice_482
	ifeq \1-482
;swc_L176_3:
	move.l 108(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 104(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 36(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 100(a1),190(a2)	; 28
;swc_L177:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 24(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 88(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 20(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 16(a1),38(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 173880
; Slice_483
	ifeq \1-483
;swc_L177_1:
	move.l (a0)+,a1		; 12
	move.l 80(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 174240
; Slice_484
	ifeq \1-484
;swc_L177_2:
	move.l 124(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 48(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 40(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 174600
; Slice_485
	ifeq \1-485
;swc_L177_3:
	move.l 104(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 36(a1),190(a2)	; 28
;swc_L178:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 20(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 20(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 84(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 16(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 12(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),54(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 174960
; Slice_486
	ifeq \1-486
;swc_L178_1:
	move.l (a0)+,a1		; 12
	move.l 8(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 175320
; Slice_487
	ifeq \1-487
;swc_L178_2:
	move.l 120(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 48(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 44(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 40(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 40(a1),190(a2)	; 28
;swc_L179:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 175680
; Slice_488
	ifeq \1-488
;swc_L179_1:
	move.l (a0)+,a1		; 12
	move.l 84(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 16(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 16(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 12(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),70(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 176040
; Slice_489
	ifeq \1-489
;swc_L179_2:
	move.l (a0)+,a1		; 12
	move.l 4(a1),78(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),86(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 176400
; Slice_490
	ifeq \1-490
;swc_L179_3:
	move.l 52(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 48(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 44(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 44(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 108(a1),190(a2)	; 28
;swc_L180:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 16(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 80(a1),14(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 176760
; Slice_491
	ifeq \1-491
;swc_L180_1:
	move.l (a0)+,a1		; 12
	move.l 12(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 12(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),80(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 177120
; Slice_492
	ifeq \1-492
;swc_L180_2:
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 177480
; Slice_493
	ifeq \1-493
;swc_L180_3:
	move.l 116(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 48(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 48(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 112(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 44(a1),190(a2)	; 28
;swc_L181:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 12(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 12(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 12(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 76(a1),30(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 177840
; Slice_494
	ifeq \1-494
;swc_L181_1:
	move.l (a0)+,a1		; 12
	move.l 8(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),70(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),78(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),80(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 178200
; Slice_495
	ifeq \1-495
;swc_L181_2:
	move.l (a0)+,a1		; 12
	move.l 60(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),174(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 178560
; Slice_496
	ifeq \1-496
;swc_L181_3:
	move.l (a0)+,a1		; 12
	move.l 48(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 48(a1),190(a2)	; 28
;swc_L182:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 76(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 178920
; Slice_497
	ifeq \1-497
;swc_L182_1:
	move.l 4(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),62(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),70(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),72(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),80(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 179280
; Slice_498
	ifeq \1-498
;swc_L182_2:
	move.l 124(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 116(a1),190(a2)	; 28
;swc_L183:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 179640
; Slice_499
	ifeq \1-499
;swc_L183_1:
	move.l (a0)+,a1		; 12
	move.l 8(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 8(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 72(a1),22(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),46(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),54(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),62(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),64(a2)	; 16
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 180000
; Slice_500
	ifeq \1-500
;swc_L183_2:
	move.w (a1),72(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),80(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 180360
; Slice_501
	ifeq \1-501
;swc_L183_3:
	move.l 56(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 120(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 52(a1),190(a2)	; 28
;swc_L184:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 4(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),14(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),22(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 180720
; Slice_502
	ifeq \1-502
;swc_L184_1:
	move.l (a0)+,a1		; 12
	move.l 4(a1),30(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 4(a1),38(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),46(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),48(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),56(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),64(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),72(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),80(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 181080
; Slice_503
	ifeq \1-503
;swc_L184_2:
	move.l (a0)+,a1		; 12
	move.l 60(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),174(a2)	; 28
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 181440
; Slice_504
	ifeq \1-504
;swc_L184_3:
	move.l (a0)+,a1		; 12
	move.l 56(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 56(a1),190(a2)	; 28
; Align next section with slice
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 181800
; Slice_505
	ifeq \1-505
;swc_L185:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.l 4(a1),6(a2)	; 28
	move.l (a0)+,a1		; 12
	move.w 68(a1),14(a2)	; 20
	move.l (a0)+,a1		; 12
	move.w (a1),16(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),24(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),32(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),40(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),48(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),56(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),64(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),72(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),80(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 182160
; Slice_506
	ifeq \1-506
;swc_L185_1:
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),158(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 182520
; Slice_507
	ifeq \1-507
;swc_L185_2:
	move.l (a0)+,a1		; 12
	move.l 60(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 124(a1),190(a2)	; 28
;swc_L186:
	lea (1*DST_LINE_LEN)(a2),a2	; 8
	move.l (a0)+,a1		; 12
	move.w (a1),(a2)	; 12
	move.l (a0)+,a1		; 12
	move.w (a1),8(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),16(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),24(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),32(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),40(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),48(a2)	; 16
	; Fill to 360 cycles per slice
	endif
	; Total cycles for Slice:	360 / 182880
; Slice_508
	ifeq \1-508
;swc_L186_1:
	move.l (a0)+,a1		; 12
	move.w (a1),56(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),64(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),72(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),80(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w (a1),88(a2)	; 16
	move.l (a0)+,a1		; 12
	move.w 64(a1),96(a2)	; 20
	move.l (a0)+,a1		; 12
	move.l 60(a1),102(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),110(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),118(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),126(a2)	; 28
	move.l (a0)+,a1		; 12
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 183240
; Slice_509
	ifeq \1-509
;swc_L186_2:
	move.l 60(a1),134(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),142(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),150(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),158(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),166(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),174(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),182(a2)	; 28
	move.l (a0)+,a1		; 12
	move.l 60(a1),190(a2)	; 28
	; Fill to 360 cycles per slice
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	nop		; 4
	endif
	; Total cycles for Slice:	360 / 183600
	endm
; Total: 183600
