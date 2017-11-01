   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  50                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  50                     ; 48 {
  51                     .text:	section	.text,new
  52  0000               f_NonHandledInterrupt:
  56                     ; 52 }
  59  0000 80            	iret	
  81                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  81                     ; 61 {
  82                     .text:	section	.text,new
  83  0000               f_TRAP_IRQHandler:
  87                     ; 65 }
  90  0000 80            	iret	
 112                     ; 72 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 112                     ; 73 
 112                     ; 74 {
 113                     .text:	section	.text,new
 114  0000               f_TLI_IRQHandler:
 118                     ; 78 }
 121  0000 80            	iret	
 143                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 143                     ; 86 {
 144                     .text:	section	.text,new
 145  0000               f_AWU_IRQHandler:
 149                     ; 90 }
 152  0000 80            	iret	
 174                     ; 97 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 174                     ; 98 {
 175                     .text:	section	.text,new
 176  0000               f_CLK_IRQHandler:
 180                     ; 102 }
 183  0000 80            	iret	
 206                     ; 116 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 206                     ; 117 {
 207                     .text:	section	.text,new
 208  0000               f_EXTI_PORTB_IRQHandler:
 212                     ; 121 }
 215  0000 80            	iret	
 238                     ; 128 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 238                     ; 129 {
 239                     .text:	section	.text,new
 240  0000               f_EXTI_PORTC_IRQHandler:
 244                     ; 133 }
 247  0000 80            	iret	
 270                     ; 146 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 270                     ; 147 {
 271                     .text:	section	.text,new
 272  0000               f_EXTI_PORTE_IRQHandler:
 276                     ; 151 }
 279  0000 80            	iret	
 301                     ; 198 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 301                     ; 199 {
 302                     .text:	section	.text,new
 303  0000               f_SPI_IRQHandler:
 307                     ; 203 }
 310  0000 80            	iret	
 333                     ; 210 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 333                     ; 211 {
 334                     .text:	section	.text,new
 335  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 339                     ; 215 }
 342  0000 80            	iret	
 365                     ; 222 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 365                     ; 223 {
 366                     .text:	section	.text,new
 367  0000               f_TIM1_CAP_COM_IRQHandler:
 371                     ; 227 }
 374  0000 80            	iret	
 398                     ; 260  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 398                     ; 261  {
 399                     .text:	section	.text,new
 400  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 402  0000 3b0002        	push	c_x+2
 403  0003 be00          	ldw	x,c_x
 404  0005 89            	pushw	x
 405  0006 3b0002        	push	c_y+2
 406  0009 be00          	ldw	x,c_y
 407  000b 89            	pushw	x
 410                     ; 262   TIM2_ClearFlag(TIM2_FLAG_UPDATE); 
 412  000c ae0001        	ldw	x,#1
 413  000f cd0000        	call	_TIM2_ClearFlag
 415                     ; 263  }
 418  0012 85            	popw	x
 419  0013 bf00          	ldw	c_y,x
 420  0015 320002        	pop	c_y+2
 421  0018 85            	popw	x
 422  0019 bf00          	ldw	c_x,x
 423  001b 320002        	pop	c_x+2
 424  001e 80            	iret	
 447                     ; 270  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 447                     ; 271  {
 448                     .text:	section	.text,new
 449  0000               f_TIM2_CAP_COM_IRQHandler:
 453                     ; 275  }
 456  0000 80            	iret	
 479                     ; 312  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 479                     ; 313  {
 480                     .text:	section	.text,new
 481  0000               f_UART1_TX_IRQHandler:
 485                     ; 317  }
 488  0000 80            	iret	
 510                     ; 327 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 510                     ; 328 {
 511                     .text:	section	.text,new
 512  0000               f_I2C_IRQHandler:
 516                     ; 332 }
 519  0000 80            	iret	
 541                     ; 406  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 541                     ; 407  {
 542                     .text:	section	.text,new
 543  0000               f_ADC1_IRQHandler:
 547                     ; 411  }
 550  0000 80            	iret	
 573                     ; 440 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 573                     ; 441 {
 574                     .text:	section	.text,new
 575  0000               f_EEPROM_EEC_IRQHandler:
 579                     ; 445 }
 582  0000 80            	iret	
 594                     	xdef	f_EEPROM_EEC_IRQHandler
 595                     	xdef	f_ADC1_IRQHandler
 596                     	xdef	f_I2C_IRQHandler
 597                     	xdef	f_UART1_TX_IRQHandler
 598                     	xdef	f_TIM2_CAP_COM_IRQHandler
 599                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 600                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 601                     	xdef	f_TIM1_CAP_COM_IRQHandler
 602                     	xdef	f_SPI_IRQHandler
 603                     	xdef	f_EXTI_PORTE_IRQHandler
 604                     	xdef	f_EXTI_PORTC_IRQHandler
 605                     	xdef	f_EXTI_PORTB_IRQHandler
 606                     	xdef	f_CLK_IRQHandler
 607                     	xdef	f_AWU_IRQHandler
 608                     	xdef	f_TLI_IRQHandler
 609                     	xdef	f_TRAP_IRQHandler
 610                     	xdef	f_NonHandledInterrupt
 611                     	xref	_TIM2_ClearFlag
 612                     	xref.b	c_x
 613                     	xref.b	c_y
 632                     	end
