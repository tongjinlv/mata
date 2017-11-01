   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  21                     .const:	section	.text
  22  0000               _HSIDivFactor:
  23  0000 01            	dc.b	1
  24  0001 02            	dc.b	2
  25  0002 04            	dc.b	4
  26  0003 08            	dc.b	8
  27  0004               _CLKPrescTable:
  28  0004 01            	dc.b	1
  29  0005 02            	dc.b	2
  30  0006 04            	dc.b	4
  31  0007 08            	dc.b	8
  32  0008 0a            	dc.b	10
  33  0009 10            	dc.b	16
  34  000a 14            	dc.b	20
  35  000b 28            	dc.b	40
  64                     ; 66 void CLK_DeInit(void)
  64                     ; 67 {
  66                     .text:	section	.text,new
  67  0000               _CLK_DeInit:
  71                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  73  0000 350150c0      	mov	20672,#1
  74                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  76  0004 725f50c1      	clr	20673
  77                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  79  0008 35e150c4      	mov	20676,#225
  80                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  82  000c 725f50c5      	clr	20677
  83                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  85  0010 351850c6      	mov	20678,#24
  86                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  88  0014 35ff50c7      	mov	20679,#255
  89                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  91  0018 35ff50ca      	mov	20682,#255
  92                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  94  001c 725f50c8      	clr	20680
  95                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  97  0020 725f50c9      	clr	20681
  99  0024               L52:
 100                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 102  0024 720050c9fb    	btjt	20681,#0,L52
 103                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 105  0029 725f50c9      	clr	20681
 106                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 108  002d 725f50cc      	clr	20684
 109                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 111  0031 725f50cd      	clr	20685
 112                     ; 84 }
 115  0035 81            	ret	
 172                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 172                     ; 96 {
 173                     .text:	section	.text,new
 174  0000               _CLK_FastHaltWakeUpCmd:
 176  0000 88            	push	a
 177       00000000      OFST:	set	0
 180                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 182  0001 4d            	tnz	a
 183  0002 2711          	jreq	L41
 184  0004 4a            	dec	a
 185  0005 270e          	jreq	L41
 186  0007 ae0063        	ldw	x,#99
 187  000a 89            	pushw	x
 188  000b 5f            	clrw	x
 189  000c 89            	pushw	x
 190  000d ae000c        	ldw	x,#L75
 191  0010 cd0000        	call	_assert_failed
 193  0013 5b04          	addw	sp,#4
 194  0015               L41:
 195                     ; 101     if (NewState != DISABLE)
 197  0015 7b01          	ld	a,(OFST+1,sp)
 198  0017 2706          	jreq	L16
 199                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 201  0019 721450c0      	bset	20672,#2
 203  001d 2004          	jra	L36
 204  001f               L16:
 205                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 207  001f 721550c0      	bres	20672,#2
 208  0023               L36:
 209                     ; 112 }
 212  0023 84            	pop	a
 213  0024 81            	ret	
 249                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 249                     ; 120 {
 250                     .text:	section	.text,new
 251  0000               _CLK_HSECmd:
 253  0000 88            	push	a
 254       00000000      OFST:	set	0
 257                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 259  0001 4d            	tnz	a
 260  0002 2711          	jreq	L62
 261  0004 4a            	dec	a
 262  0005 270e          	jreq	L62
 263  0007 ae007b        	ldw	x,#123
 264  000a 89            	pushw	x
 265  000b 5f            	clrw	x
 266  000c 89            	pushw	x
 267  000d ae000c        	ldw	x,#L75
 268  0010 cd0000        	call	_assert_failed
 270  0013 5b04          	addw	sp,#4
 271  0015               L62:
 272                     ; 125     if (NewState != DISABLE)
 274  0015 7b01          	ld	a,(OFST+1,sp)
 275  0017 2706          	jreq	L301
 276                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 278  0019 721050c1      	bset	20673,#0
 280  001d 2004          	jra	L501
 281  001f               L301:
 282                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 284  001f 721150c1      	bres	20673,#0
 285  0023               L501:
 286                     ; 136 }
 289  0023 84            	pop	a
 290  0024 81            	ret	
 326                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 326                     ; 144 {
 327                     .text:	section	.text,new
 328  0000               _CLK_HSICmd:
 330  0000 88            	push	a
 331       00000000      OFST:	set	0
 334                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 336  0001 4d            	tnz	a
 337  0002 2711          	jreq	L04
 338  0004 4a            	dec	a
 339  0005 270e          	jreq	L04
 340  0007 ae0093        	ldw	x,#147
 341  000a 89            	pushw	x
 342  000b 5f            	clrw	x
 343  000c 89            	pushw	x
 344  000d ae000c        	ldw	x,#L75
 345  0010 cd0000        	call	_assert_failed
 347  0013 5b04          	addw	sp,#4
 348  0015               L04:
 349                     ; 149     if (NewState != DISABLE)
 351  0015 7b01          	ld	a,(OFST+1,sp)
 352  0017 2706          	jreq	L521
 353                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 355  0019 721050c0      	bset	20672,#0
 357  001d 2004          	jra	L721
 358  001f               L521:
 359                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 361  001f 721150c0      	bres	20672,#0
 362  0023               L721:
 363                     ; 160 }
 366  0023 84            	pop	a
 367  0024 81            	ret	
 403                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 403                     ; 168 {
 404                     .text:	section	.text,new
 405  0000               _CLK_LSICmd:
 407  0000 88            	push	a
 408       00000000      OFST:	set	0
 411                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 413  0001 4d            	tnz	a
 414  0002 2711          	jreq	L25
 415  0004 4a            	dec	a
 416  0005 270e          	jreq	L25
 417  0007 ae00ab        	ldw	x,#171
 418  000a 89            	pushw	x
 419  000b 5f            	clrw	x
 420  000c 89            	pushw	x
 421  000d ae000c        	ldw	x,#L75
 422  0010 cd0000        	call	_assert_failed
 424  0013 5b04          	addw	sp,#4
 425  0015               L25:
 426                     ; 173     if (NewState != DISABLE)
 428  0015 7b01          	ld	a,(OFST+1,sp)
 429  0017 2706          	jreq	L741
 430                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 432  0019 721650c0      	bset	20672,#3
 434  001d 2004          	jra	L151
 435  001f               L741:
 436                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 438  001f 721750c0      	bres	20672,#3
 439  0023               L151:
 440                     ; 184 }
 443  0023 84            	pop	a
 444  0024 81            	ret	
 480                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 480                     ; 193 {
 481                     .text:	section	.text,new
 482  0000               _CLK_CCOCmd:
 484  0000 88            	push	a
 485       00000000      OFST:	set	0
 488                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 490  0001 4d            	tnz	a
 491  0002 2711          	jreq	L46
 492  0004 4a            	dec	a
 493  0005 270e          	jreq	L46
 494  0007 ae00c4        	ldw	x,#196
 495  000a 89            	pushw	x
 496  000b 5f            	clrw	x
 497  000c 89            	pushw	x
 498  000d ae000c        	ldw	x,#L75
 499  0010 cd0000        	call	_assert_failed
 501  0013 5b04          	addw	sp,#4
 502  0015               L46:
 503                     ; 198     if (NewState != DISABLE)
 505  0015 7b01          	ld	a,(OFST+1,sp)
 506  0017 2706          	jreq	L171
 507                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 509  0019 721050c9      	bset	20681,#0
 511  001d 2004          	jra	L371
 512  001f               L171:
 513                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 515  001f 721150c9      	bres	20681,#0
 516  0023               L371:
 517                     ; 209 }
 520  0023 84            	pop	a
 521  0024 81            	ret	
 557                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 557                     ; 219 {
 558                     .text:	section	.text,new
 559  0000               _CLK_ClockSwitchCmd:
 561  0000 88            	push	a
 562       00000000      OFST:	set	0
 565                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 567  0001 4d            	tnz	a
 568  0002 2711          	jreq	L67
 569  0004 4a            	dec	a
 570  0005 270e          	jreq	L67
 571  0007 ae00de        	ldw	x,#222
 572  000a 89            	pushw	x
 573  000b 5f            	clrw	x
 574  000c 89            	pushw	x
 575  000d ae000c        	ldw	x,#L75
 576  0010 cd0000        	call	_assert_failed
 578  0013 5b04          	addw	sp,#4
 579  0015               L67:
 580                     ; 224     if (NewState != DISABLE )
 582  0015 7b01          	ld	a,(OFST+1,sp)
 583  0017 2706          	jreq	L312
 584                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 586  0019 721250c5      	bset	20677,#1
 588  001d 2004          	jra	L512
 589  001f               L312:
 590                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 592  001f 721350c5      	bres	20677,#1
 593  0023               L512:
 594                     ; 235 }
 597  0023 84            	pop	a
 598  0024 81            	ret	
 635                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 635                     ; 246 {
 636                     .text:	section	.text,new
 637  0000               _CLK_SlowActiveHaltWakeUpCmd:
 639  0000 88            	push	a
 640       00000000      OFST:	set	0
 643                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 645  0001 4d            	tnz	a
 646  0002 2711          	jreq	L011
 647  0004 4a            	dec	a
 648  0005 270e          	jreq	L011
 649  0007 ae00f9        	ldw	x,#249
 650  000a 89            	pushw	x
 651  000b 5f            	clrw	x
 652  000c 89            	pushw	x
 653  000d ae000c        	ldw	x,#L75
 654  0010 cd0000        	call	_assert_failed
 656  0013 5b04          	addw	sp,#4
 657  0015               L011:
 658                     ; 251     if (NewState != DISABLE)
 660  0015 7b01          	ld	a,(OFST+1,sp)
 661  0017 2706          	jreq	L532
 662                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 664  0019 721a50c0      	bset	20672,#5
 666  001d 2004          	jra	L732
 667  001f               L532:
 668                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 670  001f 721b50c0      	bres	20672,#5
 671  0023               L732:
 672                     ; 262 }
 675  0023 84            	pop	a
 676  0024 81            	ret	
 836                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 836                     ; 273 {
 837                     .text:	section	.text,new
 838  0000               _CLK_PeripheralClockConfig:
 840  0000 89            	pushw	x
 841       00000000      OFST:	set	0
 844                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 846  0001 9f            	ld	a,xl
 847  0002 4d            	tnz	a
 848  0003 270a          	jreq	L221
 849  0005 9f            	ld	a,xl
 850  0006 4a            	dec	a
 851  0007 2706          	jreq	L221
 852  0009 ae0114        	ldw	x,#276
 853  000c cd0092        	call	LC004
 854  000f               L221:
 855                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 857  000f 7b01          	ld	a,(OFST+1,sp)
 858  0011 272f          	jreq	L231
 859  0013 a101          	cp	a,#1
 860  0015 272b          	jreq	L231
 861  0017 a103          	cp	a,#3
 862  0019 2727          	jreq	L231
 863  001b a104          	cp	a,#4
 864  001d 2723          	jreq	L231
 865  001f a105          	cp	a,#5
 866  0021 271f          	jreq	L231
 867  0023 a104          	cp	a,#4
 868  0025 271b          	jreq	L231
 869  0027 a106          	cp	a,#6
 870  0029 2717          	jreq	L231
 871  002b a107          	cp	a,#7
 872  002d 2713          	jreq	L231
 873  002f a117          	cp	a,#23
 874  0031 270f          	jreq	L231
 875  0033 a113          	cp	a,#19
 876  0035 270b          	jreq	L231
 877  0037 a112          	cp	a,#18
 878  0039 2707          	jreq	L231
 879  003b ae0115        	ldw	x,#277
 880  003e ad52          	call	LC004
 881  0040 7b01          	ld	a,(OFST+1,sp)
 882  0042               L231:
 883                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 885  0042 a510          	bcp	a,#16
 886  0044 2622          	jrne	L323
 887                     ; 281         if (NewState != DISABLE)
 889  0046 0d02          	tnz	(OFST+2,sp)
 890  0048 270d          	jreq	L523
 891                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 893  004a ad3e          	call	LC003
 894  004c 2704          	jreq	L631
 895  004e               L041:
 896  004e 48            	sll	a
 897  004f 5a            	decw	x
 898  0050 26fc          	jrne	L041
 899  0052               L631:
 900  0052 ca50c7        	or	a,20679
 902  0055 200c          	jp	LC002
 903  0057               L523:
 904                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 906  0057 ad31          	call	LC003
 907  0059 2704          	jreq	L241
 908  005b               L441:
 909  005b 48            	sll	a
 910  005c 5a            	decw	x
 911  005d 26fc          	jrne	L441
 912  005f               L241:
 913  005f 43            	cpl	a
 914  0060 c450c7        	and	a,20679
 915  0063               LC002:
 916  0063 c750c7        	ld	20679,a
 917  0066 2020          	jra	L133
 918  0068               L323:
 919                     ; 294         if (NewState != DISABLE)
 921  0068 0d02          	tnz	(OFST+2,sp)
 922  006a 270d          	jreq	L333
 923                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 925  006c ad1c          	call	LC003
 926  006e 2704          	jreq	L641
 927  0070               L051:
 928  0070 48            	sll	a
 929  0071 5a            	decw	x
 930  0072 26fc          	jrne	L051
 931  0074               L641:
 932  0074 ca50ca        	or	a,20682
 934  0077 200c          	jp	LC001
 935  0079               L333:
 936                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 938  0079 ad0f          	call	LC003
 939  007b 2704          	jreq	L251
 940  007d               L451:
 941  007d 48            	sll	a
 942  007e 5a            	decw	x
 943  007f 26fc          	jrne	L451
 944  0081               L251:
 945  0081 43            	cpl	a
 946  0082 c450ca        	and	a,20682
 947  0085               LC001:
 948  0085 c750ca        	ld	20682,a
 949  0088               L133:
 950                     ; 306 }
 953  0088 85            	popw	x
 954  0089 81            	ret	
 955  008a               LC003:
 956  008a a40f          	and	a,#15
 957  008c 5f            	clrw	x
 958  008d 97            	ld	xl,a
 959  008e a601          	ld	a,#1
 960  0090 5d            	tnzw	x
 961  0091 81            	ret	
 962  0092               LC004:
 963  0092 89            	pushw	x
 964  0093 5f            	clrw	x
 965  0094 89            	pushw	x
 966  0095 ae000c        	ldw	x,#L75
 967  0098 cd0000        	call	_assert_failed
 969  009b 5b04          	addw	sp,#4
 970  009d 81            	ret	
1159                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1159                     ; 320 {
1160                     .text:	section	.text,new
1161  0000               _CLK_ClockSwitchConfig:
1163  0000 89            	pushw	x
1164  0001 5204          	subw	sp,#4
1165       00000004      OFST:	set	4
1168                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1170  0003 ae0491        	ldw	x,#1169
1171  0006 1f03          	ldw	(OFST-1,sp),x
1172                     ; 324     ErrorStatus Swif = ERROR;
1174                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1176  0008 7b06          	ld	a,(OFST+2,sp)
1177  000a a1e1          	cp	a,#225
1178  000c 270e          	jreq	L461
1179  000e a1d2          	cp	a,#210
1180  0010 270a          	jreq	L461
1181  0012 a1b4          	cp	a,#180
1182  0014 2706          	jreq	L461
1183  0016 ae0147        	ldw	x,#327
1184  0019 cd00c4        	call	LC006
1185  001c               L461:
1186                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1188  001c 7b05          	ld	a,(OFST+1,sp)
1189  001e 2709          	jreq	L471
1190  0020 4a            	dec	a
1191  0021 2706          	jreq	L471
1192  0023 ae0148        	ldw	x,#328
1193  0026 cd00c4        	call	LC006
1194  0029               L471:
1195                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1197  0029 7b09          	ld	a,(OFST+5,sp)
1198  002b 2709          	jreq	L402
1199  002d 4a            	dec	a
1200  002e 2706          	jreq	L402
1201  0030 ae0149        	ldw	x,#329
1202  0033 cd00c4        	call	LC006
1203  0036               L402:
1204                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1206  0036 7b0a          	ld	a,(OFST+6,sp)
1207  0038 2709          	jreq	L412
1208  003a 4a            	dec	a
1209  003b 2706          	jreq	L412
1210  003d ae014a        	ldw	x,#330
1211  0040 cd00c4        	call	LC006
1212  0043               L412:
1213                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1215  0043 c650c3        	ld	a,20675
1216  0046 6b01          	ld	(OFST-3,sp),a
1217                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1219  0048 7b05          	ld	a,(OFST+1,sp)
1220  004a 4a            	dec	a
1221  004b 262d          	jrne	L744
1222                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1224  004d 721250c5      	bset	20677,#1
1225                     ; 343         if (ITState != DISABLE)
1227  0051 7b09          	ld	a,(OFST+5,sp)
1228  0053 2706          	jreq	L154
1229                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1231  0055 721450c5      	bset	20677,#2
1233  0059 2004          	jra	L354
1234  005b               L154:
1235                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1237  005b 721550c5      	bres	20677,#2
1238  005f               L354:
1239                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1241  005f 7b06          	ld	a,(OFST+2,sp)
1242  0061 c750c4        	ld	20676,a
1244  0064 2003          	jra	L164
1245  0066               L554:
1246                     ; 357             DownCounter--;
1248  0066 5a            	decw	x
1249  0067 1f03          	ldw	(OFST-1,sp),x
1250  0069               L164:
1251                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1253  0069 720150c504    	btjf	20677,#0,L564
1255  006e 1e03          	ldw	x,(OFST-1,sp)
1256  0070 26f4          	jrne	L554
1257  0072               L564:
1258                     ; 360         if (DownCounter != 0)
1260  0072 1e03          	ldw	x,(OFST-1,sp)
1261                     ; 362             Swif = SUCCESS;
1263  0074 2617          	jrne	LC005
1264                     ; 366             Swif = ERROR;
1266  0076 0f02          	clr	(OFST-2,sp)
1267  0078 2017          	jra	L374
1268  007a               L744:
1269                     ; 374         if (ITState != DISABLE)
1271  007a 7b09          	ld	a,(OFST+5,sp)
1272  007c 2706          	jreq	L574
1273                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1275  007e 721450c5      	bset	20677,#2
1277  0082 2004          	jra	L774
1278  0084               L574:
1279                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1281  0084 721550c5      	bres	20677,#2
1282  0088               L774:
1283                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1285  0088 7b06          	ld	a,(OFST+2,sp)
1286  008a c750c4        	ld	20676,a
1287                     ; 388         Swif = SUCCESS;
1289  008d               LC005:
1291  008d a601          	ld	a,#1
1292  008f 6b02          	ld	(OFST-2,sp),a
1293  0091               L374:
1294                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1296  0091 7b0a          	ld	a,(OFST+6,sp)
1297  0093 260c          	jrne	L105
1299  0095 7b01          	ld	a,(OFST-3,sp)
1300  0097 a1e1          	cp	a,#225
1301  0099 2606          	jrne	L105
1302                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1304  009b 721150c0      	bres	20672,#0
1306  009f 201e          	jra	L305
1307  00a1               L105:
1308                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1310  00a1 7b0a          	ld	a,(OFST+6,sp)
1311  00a3 260c          	jrne	L505
1313  00a5 7b01          	ld	a,(OFST-3,sp)
1314  00a7 a1d2          	cp	a,#210
1315  00a9 2606          	jrne	L505
1316                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1318  00ab 721750c0      	bres	20672,#3
1320  00af 200e          	jra	L305
1321  00b1               L505:
1322                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1324  00b1 7b0a          	ld	a,(OFST+6,sp)
1325  00b3 260a          	jrne	L305
1327  00b5 7b01          	ld	a,(OFST-3,sp)
1328  00b7 a1b4          	cp	a,#180
1329  00b9 2604          	jrne	L305
1330                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1332  00bb 721150c1      	bres	20673,#0
1333  00bf               L305:
1334                     ; 406     return(Swif);
1336  00bf 7b02          	ld	a,(OFST-2,sp)
1339  00c1 5b06          	addw	sp,#6
1340  00c3 81            	ret	
1341  00c4               LC006:
1342  00c4 89            	pushw	x
1343  00c5 5f            	clrw	x
1344  00c6 89            	pushw	x
1345  00c7 ae000c        	ldw	x,#L75
1346  00ca cd0000        	call	_assert_failed
1348  00cd 5b04          	addw	sp,#4
1349  00cf 81            	ret	
1488                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1488                     ; 417 {
1489                     .text:	section	.text,new
1490  0000               _CLK_HSIPrescalerConfig:
1492  0000 88            	push	a
1493       00000000      OFST:	set	0
1496                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1498  0001 4d            	tnz	a
1499  0002 271a          	jreq	L622
1500  0004 a108          	cp	a,#8
1501  0006 2716          	jreq	L622
1502  0008 a110          	cp	a,#16
1503  000a 2712          	jreq	L622
1504  000c a118          	cp	a,#24
1505  000e 270e          	jreq	L622
1506  0010 ae01a4        	ldw	x,#420
1507  0013 89            	pushw	x
1508  0014 5f            	clrw	x
1509  0015 89            	pushw	x
1510  0016 ae000c        	ldw	x,#L75
1511  0019 cd0000        	call	_assert_failed
1513  001c 5b04          	addw	sp,#4
1514  001e               L622:
1515                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1517  001e c650c6        	ld	a,20678
1518  0021 a4e7          	and	a,#231
1519  0023 c750c6        	ld	20678,a
1520                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1522  0026 c650c6        	ld	a,20678
1523  0029 1a01          	or	a,(OFST+1,sp)
1524  002b c750c6        	ld	20678,a
1525                     ; 428 }
1528  002e 84            	pop	a
1529  002f 81            	ret	
1665                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1665                     ; 440 {
1666                     .text:	section	.text,new
1667  0000               _CLK_CCOConfig:
1669  0000 88            	push	a
1670       00000000      OFST:	set	0
1673                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1675  0001 4d            	tnz	a
1676  0002 273e          	jreq	L042
1677  0004 a104          	cp	a,#4
1678  0006 273a          	jreq	L042
1679  0008 a102          	cp	a,#2
1680  000a 2736          	jreq	L042
1681  000c a108          	cp	a,#8
1682  000e 2732          	jreq	L042
1683  0010 a10a          	cp	a,#10
1684  0012 272e          	jreq	L042
1685  0014 a10c          	cp	a,#12
1686  0016 272a          	jreq	L042
1687  0018 a10e          	cp	a,#14
1688  001a 2726          	jreq	L042
1689  001c a110          	cp	a,#16
1690  001e 2722          	jreq	L042
1691  0020 a112          	cp	a,#18
1692  0022 271e          	jreq	L042
1693  0024 a114          	cp	a,#20
1694  0026 271a          	jreq	L042
1695  0028 a116          	cp	a,#22
1696  002a 2716          	jreq	L042
1697  002c a118          	cp	a,#24
1698  002e 2712          	jreq	L042
1699  0030 a11a          	cp	a,#26
1700  0032 270e          	jreq	L042
1701  0034 ae01bb        	ldw	x,#443
1702  0037 89            	pushw	x
1703  0038 5f            	clrw	x
1704  0039 89            	pushw	x
1705  003a ae000c        	ldw	x,#L75
1706  003d cd0000        	call	_assert_failed
1708  0040 5b04          	addw	sp,#4
1709  0042               L042:
1710                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1712  0042 c650c9        	ld	a,20681
1713  0045 a4e1          	and	a,#225
1714  0047 c750c9        	ld	20681,a
1715                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1717  004a c650c9        	ld	a,20681
1718  004d 1a01          	or	a,(OFST+1,sp)
1719  004f c750c9        	ld	20681,a
1720                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1722                     ; 454 }
1725  0052 84            	pop	a
1726  0053 721050c9      	bset	20681,#0
1727  0057 81            	ret	
1793                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1793                     ; 465 {
1794                     .text:	section	.text,new
1795  0000               _CLK_ITConfig:
1797  0000 89            	pushw	x
1798       00000000      OFST:	set	0
1801                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1803  0001 9f            	ld	a,xl
1804  0002 4d            	tnz	a
1805  0003 2709          	jreq	L252
1806  0005 9f            	ld	a,xl
1807  0006 4a            	dec	a
1808  0007 2705          	jreq	L252
1809  0009 ae01d4        	ldw	x,#468
1810  000c ad3f          	call	LC007
1811  000e               L252:
1812                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1814  000e 7b01          	ld	a,(OFST+1,sp)
1815  0010 a10c          	cp	a,#12
1816  0012 2709          	jreq	L262
1817  0014 a11c          	cp	a,#28
1818  0016 2705          	jreq	L262
1819  0018 ae01d5        	ldw	x,#469
1820  001b ad30          	call	LC007
1821  001d               L262:
1822                     ; 471     if (NewState != DISABLE)
1824  001d 7b02          	ld	a,(OFST+2,sp)
1825  001f 2716          	jreq	L707
1826                     ; 473         switch (CLK_IT)
1828  0021 7b01          	ld	a,(OFST+1,sp)
1830                     ; 481         default:
1830                     ; 482             break;
1831  0023 a00c          	sub	a,#12
1832  0025 270a          	jreq	L346
1833  0027 a010          	sub	a,#16
1834  0029 2620          	jrne	L517
1835                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1835                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1837  002b 721450c5      	bset	20677,#2
1838                     ; 477             break;
1840  002f 201a          	jra	L517
1841  0031               L346:
1842                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1842                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1844  0031 721450c8      	bset	20680,#2
1845                     ; 480             break;
1847  0035 2014          	jra	L517
1848                     ; 481         default:
1848                     ; 482             break;
1851  0037               L707:
1852                     ; 487         switch (CLK_IT)
1854  0037 7b01          	ld	a,(OFST+1,sp)
1856                     ; 495         default:
1856                     ; 496             break;
1857  0039 a00c          	sub	a,#12
1858  003b 270a          	jreq	L156
1859  003d a010          	sub	a,#16
1860  003f 260a          	jrne	L517
1861                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1861                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1863  0041 721550c5      	bres	20677,#2
1864                     ; 491             break;
1866  0045 2004          	jra	L517
1867  0047               L156:
1868                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1868                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1870  0047 721550c8      	bres	20680,#2
1871                     ; 494             break;
1872  004b               L517:
1873                     ; 500 }
1876  004b 85            	popw	x
1877  004c 81            	ret	
1878                     ; 495         default:
1878                     ; 496             break;
1880  004d               LC007:
1881  004d 89            	pushw	x
1882  004e 5f            	clrw	x
1883  004f 89            	pushw	x
1884  0050 ae000c        	ldw	x,#L75
1885  0053 cd0000        	call	_assert_failed
1887  0056 5b04          	addw	sp,#4
1888  0058 81            	ret	
1924                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1924                     ; 508 {
1925                     .text:	section	.text,new
1926  0000               _CLK_SYSCLKConfig:
1928  0000 88            	push	a
1929       00000000      OFST:	set	0
1932                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1934  0001 4d            	tnz	a
1935  0002 273a          	jreq	L472
1936  0004 a108          	cp	a,#8
1937  0006 2736          	jreq	L472
1938  0008 a110          	cp	a,#16
1939  000a 2732          	jreq	L472
1940  000c a118          	cp	a,#24
1941  000e 272e          	jreq	L472
1942  0010 a180          	cp	a,#128
1943  0012 272a          	jreq	L472
1944  0014 a181          	cp	a,#129
1945  0016 2726          	jreq	L472
1946  0018 a182          	cp	a,#130
1947  001a 2722          	jreq	L472
1948  001c a183          	cp	a,#131
1949  001e 271e          	jreq	L472
1950  0020 a184          	cp	a,#132
1951  0022 271a          	jreq	L472
1952  0024 a185          	cp	a,#133
1953  0026 2716          	jreq	L472
1954  0028 a186          	cp	a,#134
1955  002a 2712          	jreq	L472
1956  002c a187          	cp	a,#135
1957  002e 270e          	jreq	L472
1958  0030 ae01ff        	ldw	x,#511
1959  0033 89            	pushw	x
1960  0034 5f            	clrw	x
1961  0035 89            	pushw	x
1962  0036 ae000c        	ldw	x,#L75
1963  0039 cd0000        	call	_assert_failed
1965  003c 5b04          	addw	sp,#4
1966  003e               L472:
1967                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1969  003e 7b01          	ld	a,(OFST+1,sp)
1970  0040 2b0e          	jrmi	L147
1971                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1973  0042 c650c6        	ld	a,20678
1974  0045 a4e7          	and	a,#231
1975  0047 c750c6        	ld	20678,a
1976                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1978  004a 7b01          	ld	a,(OFST+1,sp)
1979  004c a418          	and	a,#24
1981  004e 200c          	jra	L347
1982  0050               L147:
1983                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1985  0050 c650c6        	ld	a,20678
1986  0053 a4f8          	and	a,#248
1987  0055 c750c6        	ld	20678,a
1988                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1990  0058 7b01          	ld	a,(OFST+1,sp)
1991  005a a407          	and	a,#7
1992  005c               L347:
1993  005c ca50c6        	or	a,20678
1994  005f c750c6        	ld	20678,a
1995                     ; 524 }
1998  0062 84            	pop	a
1999  0063 81            	ret	
2056                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2056                     ; 532 {
2057                     .text:	section	.text,new
2058  0000               _CLK_SWIMConfig:
2060  0000 88            	push	a
2061       00000000      OFST:	set	0
2064                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2066  0001 4d            	tnz	a
2067  0002 2711          	jreq	L603
2068  0004 4a            	dec	a
2069  0005 270e          	jreq	L603
2070  0007 ae0217        	ldw	x,#535
2071  000a 89            	pushw	x
2072  000b 5f            	clrw	x
2073  000c 89            	pushw	x
2074  000d ae000c        	ldw	x,#L75
2075  0010 cd0000        	call	_assert_failed
2077  0013 5b04          	addw	sp,#4
2078  0015               L603:
2079                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2081  0015 7b01          	ld	a,(OFST+1,sp)
2082  0017 2706          	jreq	L377
2083                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2085  0019 721050cd      	bset	20685,#0
2087  001d 2004          	jra	L577
2088  001f               L377:
2089                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2091  001f 721150cd      	bres	20685,#0
2092  0023               L577:
2093                     ; 548 }
2096  0023 84            	pop	a
2097  0024 81            	ret	
2121                     ; 557 void CLK_ClockSecuritySystemEnable(void)
2121                     ; 558 {
2122                     .text:	section	.text,new
2123  0000               _CLK_ClockSecuritySystemEnable:
2127                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
2129  0000 721050c8      	bset	20680,#0
2130                     ; 561 }
2133  0004 81            	ret	
2158                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2158                     ; 570 {
2159                     .text:	section	.text,new
2160  0000               _CLK_GetSYSCLKSource:
2164                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
2166  0000 c650c3        	ld	a,20675
2169  0003 81            	ret	
2232                     ; 579 uint32_t CLK_GetClockFreq(void)
2232                     ; 580 {
2233                     .text:	section	.text,new
2234  0000               _CLK_GetClockFreq:
2236  0000 5209          	subw	sp,#9
2237       00000009      OFST:	set	9
2240                     ; 582     uint32_t clockfrequency = 0;
2242                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2244                     ; 584     uint8_t tmp = 0, presc = 0;
2248                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2250  0002 c650c3        	ld	a,20675
2251  0005 6b09          	ld	(OFST+0,sp),a
2252                     ; 589     if (clocksource == CLK_SOURCE_HSI)
2254  0007 a1e1          	cp	a,#225
2255  0009 2634          	jrne	L1501
2256                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2258  000b c650c6        	ld	a,20678
2259  000e a418          	and	a,#24
2260  0010 44            	srl	a
2261  0011 44            	srl	a
2262  0012 44            	srl	a
2263                     ; 592         tmp = (uint8_t)(tmp >> 3);
2265                     ; 593         presc = HSIDivFactor[tmp];
2267  0013 5f            	clrw	x
2268  0014 97            	ld	xl,a
2269  0015 d60000        	ld	a,(_HSIDivFactor,x)
2270  0018 6b09          	ld	(OFST+0,sp),a
2271                     ; 594         clockfrequency = HSI_VALUE / presc;
2273  001a b703          	ld	c_lreg+3,a
2274  001c 3f02          	clr	c_lreg+2
2275  001e 3f01          	clr	c_lreg+1
2276  0020 3f00          	clr	c_lreg
2277  0022 96            	ldw	x,sp
2278  0023 5c            	incw	x
2279  0024 cd0000        	call	c_rtol
2281  0027 ae2400        	ldw	x,#9216
2282  002a bf02          	ldw	c_lreg+2,x
2283  002c ae00f4        	ldw	x,#244
2284  002f bf00          	ldw	c_lreg,x
2285  0031 96            	ldw	x,sp
2286  0032 5c            	incw	x
2287  0033 cd0000        	call	c_ludv
2289  0036 96            	ldw	x,sp
2290  0037 1c0005        	addw	x,#OFST-4
2291  003a cd0000        	call	c_rtol
2294  003d 2018          	jra	L3501
2295  003f               L1501:
2296                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
2298  003f a1d2          	cp	a,#210
2299  0041 260a          	jrne	L5501
2300                     ; 598         clockfrequency = LSI_VALUE;
2302  0043 aef400        	ldw	x,#62464
2303  0046 1f07          	ldw	(OFST-2,sp),x
2304  0048 ae0001        	ldw	x,#1
2306  004b 2008          	jp	LC008
2307  004d               L5501:
2308                     ; 602         clockfrequency = HSE_VALUE;
2310  004d ae2400        	ldw	x,#9216
2311  0050 1f07          	ldw	(OFST-2,sp),x
2312  0052 ae00f4        	ldw	x,#244
2313  0055               LC008:
2314  0055 1f05          	ldw	(OFST-4,sp),x
2315  0057               L3501:
2316                     ; 605     return((uint32_t)clockfrequency);
2318  0057 96            	ldw	x,sp
2319  0058 1c0005        	addw	x,#OFST-4
2320  005b cd0000        	call	c_ltor
2324  005e 5b09          	addw	sp,#9
2325  0060 81            	ret	
2425                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2425                     ; 617 {
2426                     .text:	section	.text,new
2427  0000               _CLK_AdjustHSICalibrationValue:
2429  0000 88            	push	a
2430       00000000      OFST:	set	0
2433                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2435  0001 4d            	tnz	a
2436  0002 272a          	jreq	L623
2437  0004 a101          	cp	a,#1
2438  0006 2726          	jreq	L623
2439  0008 a102          	cp	a,#2
2440  000a 2722          	jreq	L623
2441  000c a103          	cp	a,#3
2442  000e 271e          	jreq	L623
2443  0010 a104          	cp	a,#4
2444  0012 271a          	jreq	L623
2445  0014 a105          	cp	a,#5
2446  0016 2716          	jreq	L623
2447  0018 a106          	cp	a,#6
2448  001a 2712          	jreq	L623
2449  001c a107          	cp	a,#7
2450  001e 270e          	jreq	L623
2451  0020 ae026c        	ldw	x,#620
2452  0023 89            	pushw	x
2453  0024 5f            	clrw	x
2454  0025 89            	pushw	x
2455  0026 ae000c        	ldw	x,#L75
2456  0029 cd0000        	call	_assert_failed
2458  002c 5b04          	addw	sp,#4
2459  002e               L623:
2460                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2462  002e c650cc        	ld	a,20684
2463  0031 a4f8          	and	a,#248
2464  0033 1a01          	or	a,(OFST+1,sp)
2465  0035 c750cc        	ld	20684,a
2466                     ; 625 }
2469  0038 84            	pop	a
2470  0039 81            	ret	
2494                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2494                     ; 637 {
2495                     .text:	section	.text,new
2496  0000               _CLK_SYSCLKEmergencyClear:
2500                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2502  0000 721150c5      	bres	20677,#0
2503                     ; 639 }
2506  0004 81            	ret	
2660                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2660                     ; 649 {
2661                     .text:	section	.text,new
2662  0000               _CLK_GetFlagStatus:
2664  0000 89            	pushw	x
2665  0001 5203          	subw	sp,#3
2666       00000003      OFST:	set	3
2669                     ; 651     uint16_t statusreg = 0;
2671                     ; 652     uint8_t tmpreg = 0;
2673                     ; 653     FlagStatus bitstatus = RESET;
2675                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2677  0003 a30110        	cpw	x,#272
2678  0006 2736          	jreq	L243
2679  0008 a30102        	cpw	x,#258
2680  000b 2731          	jreq	L243
2681  000d a30202        	cpw	x,#514
2682  0010 272c          	jreq	L243
2683  0012 a30308        	cpw	x,#776
2684  0015 2727          	jreq	L243
2685  0017 a30301        	cpw	x,#769
2686  001a 2722          	jreq	L243
2687  001c a30408        	cpw	x,#1032
2688  001f 271d          	jreq	L243
2689  0021 a30402        	cpw	x,#1026
2690  0024 2718          	jreq	L243
2691  0026 a30504        	cpw	x,#1284
2692  0029 2713          	jreq	L243
2693  002b a30502        	cpw	x,#1282
2694  002e 270e          	jreq	L243
2695  0030 ae0290        	ldw	x,#656
2696  0033 89            	pushw	x
2697  0034 5f            	clrw	x
2698  0035 89            	pushw	x
2699  0036 ae000c        	ldw	x,#L75
2700  0039 cd0000        	call	_assert_failed
2702  003c 5b04          	addw	sp,#4
2703  003e               L243:
2704                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2706  003e 7b04          	ld	a,(OFST+1,sp)
2707  0040 97            	ld	xl,a
2708  0041 4f            	clr	a
2709  0042 02            	rlwa	x,a
2710  0043 1f01          	ldw	(OFST-2,sp),x
2711                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2713  0045 a30100        	cpw	x,#256
2714  0048 2605          	jrne	L3221
2715                     ; 664         tmpreg = CLK->ICKR;
2717  004a c650c0        	ld	a,20672
2719  004d 2021          	jra	L5221
2720  004f               L3221:
2721                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2723  004f a30200        	cpw	x,#512
2724  0052 2605          	jrne	L7221
2725                     ; 668         tmpreg = CLK->ECKR;
2727  0054 c650c1        	ld	a,20673
2729  0057 2017          	jra	L5221
2730  0059               L7221:
2731                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2733  0059 a30300        	cpw	x,#768
2734  005c 2605          	jrne	L3321
2735                     ; 672         tmpreg = CLK->SWCR;
2737  005e c650c5        	ld	a,20677
2739  0061 200d          	jra	L5221
2740  0063               L3321:
2741                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2743  0063 a30400        	cpw	x,#1024
2744  0066 2605          	jrne	L7321
2745                     ; 676         tmpreg = CLK->CSSR;
2747  0068 c650c8        	ld	a,20680
2749  006b 2003          	jra	L5221
2750  006d               L7321:
2751                     ; 680         tmpreg = CLK->CCOR;
2753  006d c650c9        	ld	a,20681
2754  0070               L5221:
2755  0070 6b03          	ld	(OFST+0,sp),a
2756                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2758  0072 7b05          	ld	a,(OFST+2,sp)
2759  0074 1503          	bcp	a,(OFST+0,sp)
2760  0076 2704          	jreq	L3421
2761                     ; 685         bitstatus = SET;
2763  0078 a601          	ld	a,#1
2765  007a 2001          	jra	L5421
2766  007c               L3421:
2767                     ; 689         bitstatus = RESET;
2769  007c 4f            	clr	a
2770  007d               L5421:
2771                     ; 693     return((FlagStatus)bitstatus);
2775  007d 5b05          	addw	sp,#5
2776  007f 81            	ret	
2823                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2823                     ; 704 {
2824                     .text:	section	.text,new
2825  0000               _CLK_GetITStatus:
2827  0000 88            	push	a
2828  0001 88            	push	a
2829       00000001      OFST:	set	1
2832                     ; 706     ITStatus bitstatus = RESET;
2834                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2836  0002 a10c          	cp	a,#12
2837  0004 2712          	jreq	L453
2838  0006 a11c          	cp	a,#28
2839  0008 270e          	jreq	L453
2840  000a ae02c5        	ldw	x,#709
2841  000d 89            	pushw	x
2842  000e 5f            	clrw	x
2843  000f 89            	pushw	x
2844  0010 ae000c        	ldw	x,#L75
2845  0013 cd0000        	call	_assert_failed
2847  0016 5b04          	addw	sp,#4
2848  0018               L453:
2849                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2851  0018 7b02          	ld	a,(OFST+1,sp)
2852  001a a11c          	cp	a,#28
2853  001c 260b          	jrne	L1721
2854                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2856  001e c650c5        	ld	a,20677
2857  0021 1402          	and	a,(OFST+1,sp)
2858  0023 a10c          	cp	a,#12
2859  0025 260f          	jrne	L1031
2860                     ; 716             bitstatus = SET;
2862  0027 2009          	jp	LC010
2863                     ; 720             bitstatus = RESET;
2864  0029               L1721:
2865                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2867  0029 c650c8        	ld	a,20680
2868  002c 1402          	and	a,(OFST+1,sp)
2869  002e a10c          	cp	a,#12
2870  0030 2604          	jrne	L1031
2871                     ; 728             bitstatus = SET;
2873  0032               LC010:
2875  0032 a601          	ld	a,#1
2877  0034 2001          	jra	L7721
2878  0036               L1031:
2879                     ; 732             bitstatus = RESET;
2882  0036 4f            	clr	a
2883  0037               L7721:
2884                     ; 737     return bitstatus;
2888  0037 85            	popw	x
2889  0038 81            	ret	
2926                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2926                     ; 748 {
2927                     .text:	section	.text,new
2928  0000               _CLK_ClearITPendingBit:
2930  0000 88            	push	a
2931       00000000      OFST:	set	0
2934                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2936  0001 a10c          	cp	a,#12
2937  0003 2712          	jreq	L663
2938  0005 a11c          	cp	a,#28
2939  0007 270e          	jreq	L663
2940  0009 ae02ef        	ldw	x,#751
2941  000c 89            	pushw	x
2942  000d 5f            	clrw	x
2943  000e 89            	pushw	x
2944  000f ae000c        	ldw	x,#L75
2945  0012 cd0000        	call	_assert_failed
2947  0015 5b04          	addw	sp,#4
2948  0017               L663:
2949                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2951  0017 7b01          	ld	a,(OFST+1,sp)
2952  0019 a10c          	cp	a,#12
2953  001b 2606          	jrne	L3231
2954                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2956  001d 721750c8      	bres	20680,#3
2958  0021 2004          	jra	L5231
2959  0023               L3231:
2960                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2962  0023 721750c5      	bres	20677,#3
2963  0027               L5231:
2964                     ; 764 }
2967  0027 84            	pop	a
2968  0028 81            	ret	
3003                     	xdef	_CLKPrescTable
3004                     	xdef	_HSIDivFactor
3005                     	xdef	_CLK_ClearITPendingBit
3006                     	xdef	_CLK_GetITStatus
3007                     	xdef	_CLK_GetFlagStatus
3008                     	xdef	_CLK_GetSYSCLKSource
3009                     	xdef	_CLK_GetClockFreq
3010                     	xdef	_CLK_AdjustHSICalibrationValue
3011                     	xdef	_CLK_SYSCLKEmergencyClear
3012                     	xdef	_CLK_ClockSecuritySystemEnable
3013                     	xdef	_CLK_SWIMConfig
3014                     	xdef	_CLK_SYSCLKConfig
3015                     	xdef	_CLK_ITConfig
3016                     	xdef	_CLK_CCOConfig
3017                     	xdef	_CLK_HSIPrescalerConfig
3018                     	xdef	_CLK_ClockSwitchConfig
3019                     	xdef	_CLK_PeripheralClockConfig
3020                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3021                     	xdef	_CLK_FastHaltWakeUpCmd
3022                     	xdef	_CLK_ClockSwitchCmd
3023                     	xdef	_CLK_CCOCmd
3024                     	xdef	_CLK_LSICmd
3025                     	xdef	_CLK_HSICmd
3026                     	xdef	_CLK_HSECmd
3027                     	xdef	_CLK_DeInit
3028                     	xref	_assert_failed
3029                     	switch	.const
3030  000c               L75:
3031  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
3032  001e 6965735c7374  	dc.b	"ies\stm8s_stdperip"
3033  0030 685f64726976  	dc.b	"h_driver\src\stm8s"
3034  0042 5f636c6b2e63  	dc.b	"_clk.c",0
3035                     	xref.b	c_lreg
3036                     	xref.b	c_x
3056                     	xref	c_ltor
3057                     	xref	c_ludv
3058                     	xref	c_rtol
3059                     	end
