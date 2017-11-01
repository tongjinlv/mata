   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  82                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  82                     ; 82 {
  84                     .text:	section	.text,new
  85  0000               _FLASH_Unlock:
  87  0000 88            	push	a
  88       00000000      OFST:	set	0
  91                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  93  0001 a1fd          	cp	a,#253
  94  0003 2712          	jreq	L21
  95  0005 a1f7          	cp	a,#247
  96  0007 270e          	jreq	L21
  97  0009 ae0054        	ldw	x,#84
  98  000c 89            	pushw	x
  99  000d 5f            	clrw	x
 100  000e 89            	pushw	x
 101  000f ae0010        	ldw	x,#L73
 102  0012 cd0000        	call	_assert_failed
 104  0015 5b04          	addw	sp,#4
 105  0017               L21:
 106                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
 108  0017 7b01          	ld	a,(OFST+1,sp)
 109  0019 a1fd          	cp	a,#253
 110  001b 260a          	jrne	L14
 111                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
 113  001d 35565062      	mov	20578,#86
 114                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 116  0021 35ae5062      	mov	20578,#174
 118  0025 2008          	jra	L34
 119  0027               L14:
 120                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 122  0027 35ae5064      	mov	20580,#174
 123                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 125  002b 35565064      	mov	20580,#86
 126  002f               L34:
 127                     ; 98 }
 130  002f 84            	pop	a
 131  0030 81            	ret	
 167                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 167                     ; 107 {
 168                     .text:	section	.text,new
 169  0000               _FLASH_Lock:
 171  0000 88            	push	a
 172       00000000      OFST:	set	0
 175                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 177  0001 a1fd          	cp	a,#253
 178  0003 2712          	jreq	L42
 179  0005 a1f7          	cp	a,#247
 180  0007 270e          	jreq	L42
 181  0009 ae006d        	ldw	x,#109
 182  000c 89            	pushw	x
 183  000d 5f            	clrw	x
 184  000e 89            	pushw	x
 185  000f ae0010        	ldw	x,#L73
 186  0012 cd0000        	call	_assert_failed
 188  0015 5b04          	addw	sp,#4
 189  0017               L42:
 190                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 192  0017 c6505f        	ld	a,20575
 193  001a 1401          	and	a,(OFST+1,sp)
 194  001c c7505f        	ld	20575,a
 195                     ; 113 }
 198  001f 84            	pop	a
 199  0020 81            	ret	
 222                     ; 120 void FLASH_DeInit(void)
 222                     ; 121 {
 223                     .text:	section	.text,new
 224  0000               _FLASH_DeInit:
 228                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 230  0000 725f505a      	clr	20570
 231                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 233  0004 725f505b      	clr	20571
 234                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 236  0008 35ff505c      	mov	20572,#255
 237                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 239  000c 7217505f      	bres	20575,#3
 240                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 242  0010 7213505f      	bres	20575,#1
 243                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 245  0014 c6505f        	ld	a,20575
 246                     ; 128 }
 249  0017 81            	ret	
 305                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 305                     ; 137 {
 306                     .text:	section	.text,new
 307  0000               _FLASH_ITConfig:
 309  0000 88            	push	a
 310       00000000      OFST:	set	0
 313                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 315  0001 4d            	tnz	a
 316  0002 2711          	jreq	L04
 317  0004 4a            	dec	a
 318  0005 270e          	jreq	L04
 319  0007 ae008b        	ldw	x,#139
 320  000a 89            	pushw	x
 321  000b 5f            	clrw	x
 322  000c 89            	pushw	x
 323  000d ae0010        	ldw	x,#L73
 324  0010 cd0000        	call	_assert_failed
 326  0013 5b04          	addw	sp,#4
 327  0015               L04:
 328                     ; 141     if (NewState != DISABLE)
 330  0015 7b01          	ld	a,(OFST+1,sp)
 331  0017 2706          	jreq	L121
 332                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 334  0019 7212505a      	bset	20570,#1
 336  001d 2004          	jra	L321
 337  001f               L121:
 338                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 340  001f 7213505a      	bres	20570,#1
 341  0023               L321:
 342                     ; 149 }
 345  0023 84            	pop	a
 346  0024 81            	ret	
 381                     .const:	section	.text
 382  0000               L45:
 383  0000 00008000      	dc.l	32768
 384  0004               L65:
 385  0004 0000a000      	dc.l	40960
 386  0008               L06:
 387  0008 00004000      	dc.l	16384
 388  000c               L26:
 389  000c 00004280      	dc.l	17024
 390                     ; 158 void FLASH_EraseByte(uint32_t Address)
 390                     ; 159 {
 391                     .text:	section	.text,new
 392  0000               _FLASH_EraseByte:
 394       00000000      OFST:	set	0
 397                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 399  0000 96            	ldw	x,sp
 400  0001 1c0003        	addw	x,#OFST+3
 401  0004 cd0000        	call	c_ltor
 403  0007 ae0000        	ldw	x,#L45
 404  000a cd0000        	call	c_lcmp
 406  000d 250f          	jrult	L25
 407  000f 96            	ldw	x,sp
 408  0010 1c0003        	addw	x,#OFST+3
 409  0013 cd0000        	call	c_ltor
 411  0016 ae0004        	ldw	x,#L65
 412  0019 cd0000        	call	c_lcmp
 414  001c 252c          	jrult	L46
 415  001e               L25:
 416  001e 96            	ldw	x,sp
 417  001f 1c0003        	addw	x,#OFST+3
 418  0022 cd0000        	call	c_ltor
 420  0025 ae0008        	ldw	x,#L06
 421  0028 cd0000        	call	c_lcmp
 423  002b 250f          	jrult	L64
 424  002d 96            	ldw	x,sp
 425  002e 1c0003        	addw	x,#OFST+3
 426  0031 cd0000        	call	c_ltor
 428  0034 ae000c        	ldw	x,#L26
 429  0037 cd0000        	call	c_lcmp
 431  003a 250e          	jrult	L46
 432  003c               L64:
 433  003c ae00a1        	ldw	x,#161
 434  003f 89            	pushw	x
 435  0040 5f            	clrw	x
 436  0041 89            	pushw	x
 437  0042 ae0010        	ldw	x,#L73
 438  0045 cd0000        	call	_assert_failed
 440  0048 5b04          	addw	sp,#4
 441  004a               L46:
 442                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 444  004a 1e05          	ldw	x,(OFST+5,sp)
 445  004c 7f            	clr	(x)
 446                     ; 166 }
 449  004d 81            	ret	
 493                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 493                     ; 177 {
 494                     .text:	section	.text,new
 495  0000               _FLASH_ProgramByte:
 497       00000000      OFST:	set	0
 500                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 502  0000 96            	ldw	x,sp
 503  0001 1c0003        	addw	x,#OFST+3
 504  0004 cd0000        	call	c_ltor
 506  0007 ae0000        	ldw	x,#L45
 507  000a cd0000        	call	c_lcmp
 509  000d 250f          	jrult	L67
 510  000f 96            	ldw	x,sp
 511  0010 1c0003        	addw	x,#OFST+3
 512  0013 cd0000        	call	c_ltor
 514  0016 ae0004        	ldw	x,#L65
 515  0019 cd0000        	call	c_lcmp
 517  001c 252c          	jrult	L001
 518  001e               L67:
 519  001e 96            	ldw	x,sp
 520  001f 1c0003        	addw	x,#OFST+3
 521  0022 cd0000        	call	c_ltor
 523  0025 ae0008        	ldw	x,#L06
 524  0028 cd0000        	call	c_lcmp
 526  002b 250f          	jrult	L27
 527  002d 96            	ldw	x,sp
 528  002e 1c0003        	addw	x,#OFST+3
 529  0031 cd0000        	call	c_ltor
 531  0034 ae000c        	ldw	x,#L26
 532  0037 cd0000        	call	c_lcmp
 534  003a 250e          	jrult	L001
 535  003c               L27:
 536  003c ae00b3        	ldw	x,#179
 537  003f 89            	pushw	x
 538  0040 5f            	clrw	x
 539  0041 89            	pushw	x
 540  0042 ae0010        	ldw	x,#L73
 541  0045 cd0000        	call	_assert_failed
 543  0048 5b04          	addw	sp,#4
 544  004a               L001:
 545                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 547  004a 1e05          	ldw	x,(OFST+5,sp)
 548  004c 7b07          	ld	a,(OFST+7,sp)
 549  004e f7            	ld	(x),a
 550                     ; 181 }
 553  004f 81            	ret	
 588                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 588                     ; 191 {
 589                     .text:	section	.text,new
 590  0000               _FLASH_ReadByte:
 592       00000000      OFST:	set	0
 595                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 597  0000 96            	ldw	x,sp
 598  0001 1c0003        	addw	x,#OFST+3
 599  0004 cd0000        	call	c_ltor
 601  0007 ae0000        	ldw	x,#L45
 602  000a cd0000        	call	c_lcmp
 604  000d 250f          	jrult	L211
 605  000f 96            	ldw	x,sp
 606  0010 1c0003        	addw	x,#OFST+3
 607  0013 cd0000        	call	c_ltor
 609  0016 ae0004        	ldw	x,#L65
 610  0019 cd0000        	call	c_lcmp
 612  001c 252c          	jrult	L411
 613  001e               L211:
 614  001e 96            	ldw	x,sp
 615  001f 1c0003        	addw	x,#OFST+3
 616  0022 cd0000        	call	c_ltor
 618  0025 ae0008        	ldw	x,#L06
 619  0028 cd0000        	call	c_lcmp
 621  002b 250f          	jrult	L601
 622  002d 96            	ldw	x,sp
 623  002e 1c0003        	addw	x,#OFST+3
 624  0031 cd0000        	call	c_ltor
 626  0034 ae000c        	ldw	x,#L26
 627  0037 cd0000        	call	c_lcmp
 629  003a 250e          	jrult	L411
 630  003c               L601:
 631  003c ae00c1        	ldw	x,#193
 632  003f 89            	pushw	x
 633  0040 5f            	clrw	x
 634  0041 89            	pushw	x
 635  0042 ae0010        	ldw	x,#L73
 636  0045 cd0000        	call	_assert_failed
 638  0048 5b04          	addw	sp,#4
 639  004a               L411:
 640                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 642  004a 1e05          	ldw	x,(OFST+5,sp)
 643  004c f6            	ld	a,(x)
 646  004d 81            	ret	
 690                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 690                     ; 208 {
 691                     .text:	section	.text,new
 692  0000               _FLASH_ProgramWord:
 694       00000000      OFST:	set	0
 697                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 699  0000 96            	ldw	x,sp
 700  0001 1c0003        	addw	x,#OFST+3
 701  0004 cd0000        	call	c_ltor
 703  0007 ae0000        	ldw	x,#L45
 704  000a cd0000        	call	c_lcmp
 706  000d 250f          	jrult	L621
 707  000f 96            	ldw	x,sp
 708  0010 1c0003        	addw	x,#OFST+3
 709  0013 cd0000        	call	c_ltor
 711  0016 ae0004        	ldw	x,#L65
 712  0019 cd0000        	call	c_lcmp
 714  001c 252c          	jrult	L031
 715  001e               L621:
 716  001e 96            	ldw	x,sp
 717  001f 1c0003        	addw	x,#OFST+3
 718  0022 cd0000        	call	c_ltor
 720  0025 ae0008        	ldw	x,#L06
 721  0028 cd0000        	call	c_lcmp
 723  002b 250f          	jrult	L221
 724  002d 96            	ldw	x,sp
 725  002e 1c0003        	addw	x,#OFST+3
 726  0031 cd0000        	call	c_ltor
 728  0034 ae000c        	ldw	x,#L26
 729  0037 cd0000        	call	c_lcmp
 731  003a 250e          	jrult	L031
 732  003c               L221:
 733  003c ae00d2        	ldw	x,#210
 734  003f 89            	pushw	x
 735  0040 5f            	clrw	x
 736  0041 89            	pushw	x
 737  0042 ae0010        	ldw	x,#L73
 738  0045 cd0000        	call	_assert_failed
 740  0048 5b04          	addw	sp,#4
 741  004a               L031:
 742                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 744  004a 721c505b      	bset	20571,#6
 745                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 747  004e 721d505c      	bres	20572,#6
 748                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 750  0052 1e05          	ldw	x,(OFST+5,sp)
 751  0054 7b07          	ld	a,(OFST+7,sp)
 752  0056 f7            	ld	(x),a
 753                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 755  0057 7b08          	ld	a,(OFST+8,sp)
 756  0059 e701          	ld	(1,x),a
 757                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 759  005b 7b09          	ld	a,(OFST+9,sp)
 760  005d e702          	ld	(2,x),a
 761                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 763  005f 7b0a          	ld	a,(OFST+10,sp)
 764  0061 e703          	ld	(3,x),a
 765                     ; 224 }
 768  0063 81            	ret	
 814                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 814                     ; 233 {
 815                     .text:	section	.text,new
 816  0000               _FLASH_ProgramOptionByte:
 818  0000 89            	pushw	x
 819       00000000      OFST:	set	0
 822                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 824  0001 a34800        	cpw	x,#18432
 825  0004 2505          	jrult	L631
 826  0006 a34880        	cpw	x,#18560
 827  0009 250e          	jrult	L041
 828  000b               L631:
 829  000b ae00eb        	ldw	x,#235
 830  000e 89            	pushw	x
 831  000f 5f            	clrw	x
 832  0010 89            	pushw	x
 833  0011 ae0010        	ldw	x,#L73
 834  0014 cd0000        	call	_assert_failed
 836  0017 5b04          	addw	sp,#4
 837  0019               L041:
 838                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 840  0019 721e505b      	bset	20571,#7
 841                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 843  001d 721f505c      	bres	20572,#7
 844                     ; 242     if (Address == 0x4800)
 846  0021 1e01          	ldw	x,(OFST+1,sp)
 847  0023 a34800        	cpw	x,#18432
 848  0026 2605          	jrne	L742
 849                     ; 245        *((NEAR uint8_t*)Address) = Data;
 851  0028 7b05          	ld	a,(OFST+5,sp)
 852  002a f7            	ld	(x),a
 854  002b 2006          	jra	L152
 855  002d               L742:
 856                     ; 250        *((NEAR uint8_t*)Address) = Data;
 858  002d 7b05          	ld	a,(OFST+5,sp)
 859  002f f7            	ld	(x),a
 860                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 862  0030 43            	cpl	a
 863  0031 e701          	ld	(1,x),a
 864  0033               L152:
 865                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 867  0033 a6fd          	ld	a,#253
 868  0035 cd0000        	call	_FLASH_WaitForLastOperation
 870                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 872  0038 721f505b      	bres	20571,#7
 873                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 875                     ; 258 }
 878  003c 85            	popw	x
 879  003d 721e505c      	bset	20572,#7
 880  0041 81            	ret	
 917                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 917                     ; 266 {
 918                     .text:	section	.text,new
 919  0000               _FLASH_EraseOptionByte:
 921  0000 89            	pushw	x
 922       00000000      OFST:	set	0
 925                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 927  0001 a34800        	cpw	x,#18432
 928  0004 2505          	jrult	L051
 929  0006 a34880        	cpw	x,#18560
 930  0009 250e          	jrult	L251
 931  000b               L051:
 932  000b ae010c        	ldw	x,#268
 933  000e 89            	pushw	x
 934  000f 5f            	clrw	x
 935  0010 89            	pushw	x
 936  0011 ae0010        	ldw	x,#L73
 937  0014 cd0000        	call	_assert_failed
 939  0017 5b04          	addw	sp,#4
 940  0019               L251:
 941                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 943  0019 721e505b      	bset	20571,#7
 944                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 946  001d 721f505c      	bres	20572,#7
 947                     ; 275      if (Address == 0x4800)
 949  0021 1e01          	ldw	x,(OFST+1,sp)
 950  0023 a34800        	cpw	x,#18432
 951  0026 2603          	jrne	L172
 952                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 954  0028 7f            	clr	(x)
 956  0029 2005          	jra	L372
 957  002b               L172:
 958                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 960  002b 7f            	clr	(x)
 961                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 963  002c a6ff          	ld	a,#255
 964  002e e701          	ld	(1,x),a
 965  0030               L372:
 966                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 968  0030 a6fd          	ld	a,#253
 969  0032 cd0000        	call	_FLASH_WaitForLastOperation
 971                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 973  0035 721f505b      	bres	20571,#7
 974                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 976                     ; 291 }
 979  0039 85            	popw	x
 980  003a 721e505c      	bset	20572,#7
 981  003e 81            	ret	
1045                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1045                     ; 298 {
1046                     .text:	section	.text,new
1047  0000               _FLASH_ReadOptionByte:
1049  0000 89            	pushw	x
1050  0001 5204          	subw	sp,#4
1051       00000004      OFST:	set	4
1054                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
1056                     ; 300     uint16_t res_value = 0;
1058                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1060  0003 a34800        	cpw	x,#18432
1061  0006 2505          	jrult	L261
1062  0008 a34880        	cpw	x,#18560
1063  000b 250e          	jrult	L461
1064  000d               L261:
1065  000d ae012f        	ldw	x,#303
1066  0010 89            	pushw	x
1067  0011 5f            	clrw	x
1068  0012 89            	pushw	x
1069  0013 ae0010        	ldw	x,#L73
1070  0016 cd0000        	call	_assert_failed
1072  0019 5b04          	addw	sp,#4
1073  001b               L461:
1074                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1076  001b 1e05          	ldw	x,(OFST+1,sp)
1077  001d f6            	ld	a,(x)
1078  001e 6b02          	ld	(OFST-2,sp),a
1079                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1081  0020 e601          	ld	a,(1,x)
1082  0022 6b01          	ld	(OFST-3,sp),a
1083                     ; 310     if (Address == 0x4800)	 
1085  0024 a34800        	cpw	x,#18432
1086  0027 2606          	jrne	L723
1087                     ; 312         res_value =	 value_optbyte;
1089  0029 7b02          	ld	a,(OFST-2,sp)
1090  002b 5f            	clrw	x
1091  002c 97            	ld	xl,a
1093  002d 201c          	jra	L133
1094  002f               L723:
1095                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
1097  002f 43            	cpl	a
1098  0030 1102          	cp	a,(OFST-2,sp)
1099  0032 2614          	jrne	L333
1100                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1102  0034 7b02          	ld	a,(OFST-2,sp)
1103  0036 97            	ld	xl,a
1104  0037 4f            	clr	a
1105  0038 02            	rlwa	x,a
1106  0039 1f03          	ldw	(OFST-1,sp),x
1107                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
1109  003b 5f            	clrw	x
1110  003c 7b01          	ld	a,(OFST-3,sp)
1111  003e 97            	ld	xl,a
1112  003f 01            	rrwa	x,a
1113  0040 1a04          	or	a,(OFST+0,sp)
1114  0042 01            	rrwa	x,a
1115  0043 1a03          	or	a,(OFST-1,sp)
1116  0045 01            	rrwa	x,a
1118  0046 2003          	jra	L133
1119  0048               L333:
1120                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
1122  0048 ae5555        	ldw	x,#21845
1123  004b               L133:
1124                     ; 326     return(res_value);
1128  004b 5b06          	addw	sp,#6
1129  004d 81            	ret	
1204                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1204                     ; 336 {
1205                     .text:	section	.text,new
1206  0000               _FLASH_SetLowPowerMode:
1208  0000 88            	push	a
1209       00000000      OFST:	set	0
1212                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1214  0001 a104          	cp	a,#4
1215  0003 2719          	jreq	L671
1216  0005 a108          	cp	a,#8
1217  0007 2715          	jreq	L671
1218  0009 4d            	tnz	a
1219  000a 2712          	jreq	L671
1220  000c a10c          	cp	a,#12
1221  000e 270e          	jreq	L671
1222  0010 ae0152        	ldw	x,#338
1223  0013 89            	pushw	x
1224  0014 5f            	clrw	x
1225  0015 89            	pushw	x
1226  0016 ae0010        	ldw	x,#L73
1227  0019 cd0000        	call	_assert_failed
1229  001c 5b04          	addw	sp,#4
1230  001e               L671:
1231                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1233  001e c6505a        	ld	a,20570
1234  0021 a4f3          	and	a,#243
1235  0023 c7505a        	ld	20570,a
1236                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1238  0026 c6505a        	ld	a,20570
1239  0029 1a01          	or	a,(OFST+1,sp)
1240  002b c7505a        	ld	20570,a
1241                     ; 345 }
1244  002e 84            	pop	a
1245  002f 81            	ret	
1304                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1304                     ; 354 {
1305                     .text:	section	.text,new
1306  0000               _FLASH_SetProgrammingTime:
1308  0000 88            	push	a
1309       00000000      OFST:	set	0
1312                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1314  0001 4d            	tnz	a
1315  0002 2711          	jreq	L012
1316  0004 4a            	dec	a
1317  0005 270e          	jreq	L012
1318  0007 ae0164        	ldw	x,#356
1319  000a 89            	pushw	x
1320  000b 5f            	clrw	x
1321  000c 89            	pushw	x
1322  000d ae0010        	ldw	x,#L73
1323  0010 cd0000        	call	_assert_failed
1325  0013 5b04          	addw	sp,#4
1326  0015               L012:
1327                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1329  0015 7211505a      	bres	20570,#0
1330                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1332  0019 c6505a        	ld	a,20570
1333  001c 1a01          	or	a,(OFST+1,sp)
1334  001e c7505a        	ld	20570,a
1335                     ; 360 }
1338  0021 84            	pop	a
1339  0022 81            	ret	
1364                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1364                     ; 368 {
1365                     .text:	section	.text,new
1366  0000               _FLASH_GetLowPowerMode:
1370                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1372  0000 c6505a        	ld	a,20570
1373  0003 a40c          	and	a,#12
1376  0005 81            	ret	
1401                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1401                     ; 378 {
1402                     .text:	section	.text,new
1403  0000               _FLASH_GetProgrammingTime:
1407                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1409  0000 c6505a        	ld	a,20570
1410  0003 a401          	and	a,#1
1413  0005 81            	ret	
1447                     ; 387 uint32_t FLASH_GetBootSize(void)
1447                     ; 388 {
1448                     .text:	section	.text,new
1449  0000               _FLASH_GetBootSize:
1451  0000 5204          	subw	sp,#4
1452       00000004      OFST:	set	4
1455                     ; 389     uint32_t temp = 0;
1457                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1459  0002 c6505d        	ld	a,20573
1460  0005 5f            	clrw	x
1461  0006 97            	ld	xl,a
1462  0007 90ae0200      	ldw	y,#512
1463  000b cd0000        	call	c_umul
1465  000e 96            	ldw	x,sp
1466  000f 5c            	incw	x
1467  0010 cd0000        	call	c_rtol
1469                     ; 395     if (FLASH->FPR == 0xFF)
1471  0013 c6505d        	ld	a,20573
1472  0016 4c            	inc	a
1473  0017 260d          	jrne	L554
1474                     ; 397         temp += 512;
1476  0019 ae0200        	ldw	x,#512
1477  001c bf02          	ldw	c_lreg+2,x
1478  001e 5f            	clrw	x
1479  001f bf00          	ldw	c_lreg,x
1480  0021 96            	ldw	x,sp
1481  0022 5c            	incw	x
1482  0023 cd0000        	call	c_lgadd
1484  0026               L554:
1485                     ; 401     return(temp);
1487  0026 96            	ldw	x,sp
1488  0027 5c            	incw	x
1489  0028 cd0000        	call	c_ltor
1493  002b 5b04          	addw	sp,#4
1494  002d 81            	ret	
1597                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1597                     ; 413 {
1598                     .text:	section	.text,new
1599  0000               _FLASH_GetFlagStatus:
1601  0000 88            	push	a
1602  0001 88            	push	a
1603       00000001      OFST:	set	1
1606                     ; 414     FlagStatus status = RESET;
1608                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1610  0002 a108          	cp	a,#8
1611  0004 2719          	jreq	L032
1612  0006 a104          	cp	a,#4
1613  0008 2715          	jreq	L032
1614  000a a102          	cp	a,#2
1615  000c 2711          	jreq	L032
1616  000e 4a            	dec	a
1617  000f 270e          	jreq	L032
1618  0011 ae01a0        	ldw	x,#416
1619  0014 89            	pushw	x
1620  0015 5f            	clrw	x
1621  0016 89            	pushw	x
1622  0017 ae0010        	ldw	x,#L73
1623  001a cd0000        	call	_assert_failed
1625  001d 5b04          	addw	sp,#4
1626  001f               L032:
1627                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1629  001f c6505f        	ld	a,20575
1630  0022 1502          	bcp	a,(OFST+1,sp)
1631  0024 2704          	jreq	L525
1632                     ; 421         status = SET; /* FLASH_FLAG is set */
1634  0026 a601          	ld	a,#1
1636  0028 2001          	jra	L725
1637  002a               L525:
1638                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1640  002a 4f            	clr	a
1641  002b               L725:
1642                     ; 429     return status;
1646  002b 85            	popw	x
1647  002c 81            	ret	
1732                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1732                     ; 532 {
1733                     .text:	section	.text,new
1734  0000               _FLASH_WaitForLastOperation:
1736  0000 5205          	subw	sp,#5
1737       00000005      OFST:	set	5
1740                     ; 533     uint8_t flagstatus = 0x00;
1742  0002 0f05          	clr	(OFST+0,sp)
1743                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1745  0004 aeffff        	ldw	x,#65535
1746  0007 1f03          	ldw	(OFST-2,sp),x
1747  0009 ae000f        	ldw	x,#15
1748  000c 1f01          	ldw	(OFST-4,sp),x
1750  000e 200e          	jra	L575
1751  0010               L175:
1752                     ; 560         flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1754  0010 c6505f        	ld	a,20575
1755  0013 a405          	and	a,#5
1756  0015 6b05          	ld	(OFST+0,sp),a
1757                     ; 561         timeout--;
1759  0017 96            	ldw	x,sp
1760  0018 5c            	incw	x
1761  0019 a601          	ld	a,#1
1762  001b cd0000        	call	c_lgsbc
1764  001e               L575:
1765                     ; 558     while ((flagstatus == 0x00) && (timeout != 0x00))
1767  001e 7b05          	ld	a,(OFST+0,sp)
1768  0020 2607          	jrne	L106
1770  0022 96            	ldw	x,sp
1771  0023 5c            	incw	x
1772  0024 cd0000        	call	c_lzmp
1774  0027 26e7          	jrne	L175
1775  0029               L106:
1776                     ; 566     if (timeout == 0x00 )
1778  0029 96            	ldw	x,sp
1779  002a 5c            	incw	x
1780  002b cd0000        	call	c_lzmp
1782  002e 2604          	jrne	L306
1783                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1785  0030 a602          	ld	a,#2
1786  0032 6b05          	ld	(OFST+0,sp),a
1787  0034               L306:
1788                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1790  0034 7b05          	ld	a,(OFST+0,sp)
1793  0036 5b05          	addw	sp,#5
1794  0038 81            	ret	
1858                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1858                     ; 582 {
1859                     .text:	section	.text,new
1860  0000               _FLASH_EraseBlock:
1862  0000 89            	pushw	x
1863  0001 5206          	subw	sp,#6
1864       00000006      OFST:	set	6
1867                     ; 583   uint32_t startaddress = 0;
1869                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1871  0003 7b0b          	ld	a,(OFST+5,sp)
1872  0005 a1fd          	cp	a,#253
1873  0007 270b          	jreq	L442
1874  0009 a1f7          	cp	a,#247
1875  000b 2707          	jreq	L442
1876  000d ae0251        	ldw	x,#593
1877  0010 ad50          	call	LC001
1878  0012 7b0b          	ld	a,(OFST+5,sp)
1879  0014               L442:
1880                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1882  0014 a1fd          	cp	a,#253
1883  0016 2611          	jrne	L736
1884                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1886  0018 1e07          	ldw	x,(OFST+1,sp)
1887  001a a30080        	cpw	x,#128
1888  001d 2505          	jrult	L252
1889  001f ae0254        	ldw	x,#596
1890  0022 ad3e          	call	LC001
1891  0024               L252:
1892                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1894  0024 ae8000        	ldw	x,#32768
1896  0027 200f          	jra	L146
1897  0029               L736:
1898                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1900  0029 1e07          	ldw	x,(OFST+1,sp)
1901  002b a3000a        	cpw	x,#10
1902  002e 2505          	jrult	L062
1903  0030 ae0259        	ldw	x,#601
1904  0033 ad2d          	call	LC001
1905  0035               L062:
1906                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1908  0035 ae4000        	ldw	x,#16384
1909  0038               L146:
1910  0038 1f05          	ldw	(OFST-1,sp),x
1911  003a 5f            	clrw	x
1912  003b 1f03          	ldw	(OFST-3,sp),x
1913                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1915  003d a640          	ld	a,#64
1916  003f 1e07          	ldw	x,(OFST+1,sp)
1917  0041 cd0000        	call	c_cmulx
1919  0044 96            	ldw	x,sp
1920  0045 1c0003        	addw	x,#OFST-3
1921  0048 cd0000        	call	c_ladd
1923  004b be02          	ldw	x,c_lreg+2
1924  004d 1f01          	ldw	(OFST-5,sp),x
1925                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1927  004f 721a505b      	bset	20571,#5
1928                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1930                     ; 619     *pwFlash = (uint32_t)0;
1932  0053 4f            	clr	a
1933  0054 721b505c      	bres	20572,#5
1934  0058 e703          	ld	(3,x),a
1935  005a e702          	ld	(2,x),a
1936  005c e701          	ld	(1,x),a
1937  005e f7            	ld	(x),a
1938                     ; 627 }
1941  005f 5b08          	addw	sp,#8
1942  0061 81            	ret	
1943  0062               LC001:
1944  0062 89            	pushw	x
1945  0063 5f            	clrw	x
1946  0064 89            	pushw	x
1947  0065 ae0010        	ldw	x,#L73
1948  0068 cd0000        	call	_assert_failed
1950  006b 5b04          	addw	sp,#4
1951  006d 81            	ret	
2056                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2056                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2056                     ; 640 {
2057                     .text:	section	.text,new
2058  0000               _FLASH_ProgramBlock:
2060  0000 89            	pushw	x
2061  0001 5206          	subw	sp,#6
2062       00000006      OFST:	set	6
2065                     ; 641     uint16_t Count = 0;
2067                     ; 642     uint32_t startaddress = 0;
2069                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2071  0003 7b0b          	ld	a,(OFST+5,sp)
2072  0005 a1fd          	cp	a,#253
2073  0007 2709          	jreq	L272
2074  0009 a1f7          	cp	a,#247
2075  000b 2705          	jreq	L272
2076  000d ae0285        	ldw	x,#645
2077  0010 ad76          	call	LC002
2078  0012               L272:
2079                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2081  0012 7b0c          	ld	a,(OFST+6,sp)
2082  0014 2709          	jreq	L203
2083  0016 a110          	cp	a,#16
2084  0018 2705          	jreq	L203
2085  001a ae0286        	ldw	x,#646
2086  001d ad69          	call	LC002
2087  001f               L203:
2088                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2090  001f 7b0b          	ld	a,(OFST+5,sp)
2091  0021 a1fd          	cp	a,#253
2092  0023 2611          	jrne	L517
2093                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2095  0025 1e07          	ldw	x,(OFST+1,sp)
2096  0027 a30080        	cpw	x,#128
2097  002a 2505          	jrult	L013
2098  002c ae0289        	ldw	x,#649
2099  002f ad57          	call	LC002
2100  0031               L013:
2101                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2103  0031 ae8000        	ldw	x,#32768
2105  0034 200f          	jra	L717
2106  0036               L517:
2107                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2109  0036 1e07          	ldw	x,(OFST+1,sp)
2110  0038 a3000a        	cpw	x,#10
2111  003b 2505          	jrult	L613
2112  003d ae028e        	ldw	x,#654
2113  0040 ad46          	call	LC002
2114  0042               L613:
2115                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2117  0042 ae4000        	ldw	x,#16384
2118  0045               L717:
2119  0045 1f03          	ldw	(OFST-3,sp),x
2120  0047 5f            	clrw	x
2121  0048 1f01          	ldw	(OFST-5,sp),x
2122                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2124  004a a640          	ld	a,#64
2125  004c 1e07          	ldw	x,(OFST+1,sp)
2126  004e cd0000        	call	c_cmulx
2128  0051 96            	ldw	x,sp
2129  0052 5c            	incw	x
2130  0053 cd0000        	call	c_lgadd
2132                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2134  0056 7b0c          	ld	a,(OFST+6,sp)
2135  0058 260a          	jrne	L127
2136                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
2138  005a 7210505b      	bset	20571,#0
2139                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2141  005e 7211505c      	bres	20572,#0
2143  0062 2008          	jra	L327
2144  0064               L127:
2145                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
2147  0064 7218505b      	bset	20571,#4
2148                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2150  0068 7219505c      	bres	20572,#4
2151  006c               L327:
2152                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2154  006c 5f            	clrw	x
2155  006d 1f05          	ldw	(OFST-1,sp),x
2156  006f               L527:
2157                     ; 682   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2159  006f 1e0d          	ldw	x,(OFST+7,sp)
2160  0071 72fb05        	addw	x,(OFST-1,sp)
2161  0074 f6            	ld	a,(x)
2162  0075 1e03          	ldw	x,(OFST-3,sp)
2163  0077 72fb05        	addw	x,(OFST-1,sp)
2164  007a f7            	ld	(x),a
2165                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2167  007b 1e05          	ldw	x,(OFST-1,sp)
2168  007d 5c            	incw	x
2169  007e 1f05          	ldw	(OFST-1,sp),x
2172  0080 a30040        	cpw	x,#64
2173  0083 25ea          	jrult	L527
2174                     ; 685 }
2177  0085 5b08          	addw	sp,#8
2178  0087 81            	ret	
2179  0088               LC002:
2180  0088 89            	pushw	x
2181  0089 5f            	clrw	x
2182  008a 89            	pushw	x
2183  008b ae0010        	ldw	x,#L73
2184  008e cd0000        	call	_assert_failed
2186  0091 5b04          	addw	sp,#4
2187  0093 81            	ret	
2200                     	xdef	_FLASH_WaitForLastOperation
2201                     	xdef	_FLASH_ProgramBlock
2202                     	xdef	_FLASH_EraseBlock
2203                     	xdef	_FLASH_GetFlagStatus
2204                     	xdef	_FLASH_GetBootSize
2205                     	xdef	_FLASH_GetProgrammingTime
2206                     	xdef	_FLASH_GetLowPowerMode
2207                     	xdef	_FLASH_SetProgrammingTime
2208                     	xdef	_FLASH_SetLowPowerMode
2209                     	xdef	_FLASH_EraseOptionByte
2210                     	xdef	_FLASH_ProgramOptionByte
2211                     	xdef	_FLASH_ReadOptionByte
2212                     	xdef	_FLASH_ProgramWord
2213                     	xdef	_FLASH_ReadByte
2214                     	xdef	_FLASH_ProgramByte
2215                     	xdef	_FLASH_EraseByte
2216                     	xdef	_FLASH_ITConfig
2217                     	xdef	_FLASH_DeInit
2218                     	xdef	_FLASH_Lock
2219                     	xdef	_FLASH_Unlock
2220                     	xref	_assert_failed
2221                     	switch	.const
2222  0010               L73:
2223  0010 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
2224  0022 6965735c7374  	dc.b	"ies\stm8s_stdperip"
2225  0034 685f64726976  	dc.b	"h_driver\src\stm8s"
2226  0046 5f666c617368  	dc.b	"_flash.c",0
2227                     	xref.b	c_lreg
2228                     	xref.b	c_x
2229                     	xref.b	c_y
2249                     	xref	c_ladd
2250                     	xref	c_cmulx
2251                     	xref	c_lzmp
2252                     	xref	c_lgsbc
2253                     	xref	c_lgadd
2254                     	xref	c_rtol
2255                     	xref	c_umul
2256                     	xref	c_lcmp
2257                     	xref	c_ltor
2258                     	end
