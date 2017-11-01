   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 124                     ; 48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 124                     ; 49 {
 126                     .text:	section	.text,new
 127  0000               _RST_GetFlagStatus:
 129  0000 88            	push	a
 130       00000000      OFST:	set	0
 133                     ; 51     assert_param(IS_RST_FLAG_OK(RST_Flag));
 135  0001 a110          	cp	a,#16
 136  0003 271d          	jreq	L21
 137  0005 a108          	cp	a,#8
 138  0007 2719          	jreq	L21
 139  0009 a104          	cp	a,#4
 140  000b 2715          	jreq	L21
 141  000d a102          	cp	a,#2
 142  000f 2711          	jreq	L21
 143  0011 4a            	dec	a
 144  0012 270e          	jreq	L21
 145  0014 ae0033        	ldw	x,#51
 146  0017 89            	pushw	x
 147  0018 5f            	clrw	x
 148  0019 89            	pushw	x
 149  001a ae0000        	ldw	x,#L55
 150  001d cd0000        	call	_assert_failed
 152  0020 5b04          	addw	sp,#4
 153  0022               L21:
 154                     ; 55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 156  0022 c650b3        	ld	a,20659
 157  0025 1401          	and	a,(OFST+1,sp)
 160  0027 5b01          	addw	sp,#1
 161  0029 81            	ret	
 197                     ; 64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 197                     ; 65 {
 198                     .text:	section	.text,new
 199  0000               _RST_ClearFlag:
 201  0000 88            	push	a
 202       00000000      OFST:	set	0
 205                     ; 67     assert_param(IS_RST_FLAG_OK(RST_Flag));
 207  0001 a110          	cp	a,#16
 208  0003 271d          	jreq	L42
 209  0005 a108          	cp	a,#8
 210  0007 2719          	jreq	L42
 211  0009 a104          	cp	a,#4
 212  000b 2715          	jreq	L42
 213  000d a102          	cp	a,#2
 214  000f 2711          	jreq	L42
 215  0011 4a            	dec	a
 216  0012 270e          	jreq	L42
 217  0014 ae0043        	ldw	x,#67
 218  0017 89            	pushw	x
 219  0018 5f            	clrw	x
 220  0019 89            	pushw	x
 221  001a ae0000        	ldw	x,#L55
 222  001d cd0000        	call	_assert_failed
 224  0020 5b04          	addw	sp,#4
 225  0022               L42:
 226                     ; 69     RST->SR = (uint8_t)RST_Flag;
 228  0022 7b01          	ld	a,(OFST+1,sp)
 229  0024 c750b3        	ld	20659,a
 230                     ; 70 }
 233  0027 84            	pop	a
 234  0028 81            	ret	
 247                     	xdef	_RST_ClearFlag
 248                     	xdef	_RST_GetFlagStatus
 249                     	xref	_assert_failed
 250                     .const:	section	.text
 251  0000               L55:
 252  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 253  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 254  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 255  0036 5f7273742e63  	dc.b	"_rst.c",0
 275                     	end
