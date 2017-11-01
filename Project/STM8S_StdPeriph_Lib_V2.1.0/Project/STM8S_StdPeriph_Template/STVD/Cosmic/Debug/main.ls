   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
  54                     ; 30 void main(void)
  54                     ; 31 {
  56                     .text:	section	.text,new
  57  0000               _main:
  61                     ; 32   Exit_Init();
  63  0000 cd0000        	call	_Exit_Init
  65                     ; 33   UART_Config();
  67  0003 cd0000        	call	_UART_Config
  69                     ; 34   Moto_LoadConfig();
  71  0006 cd0000        	call	_Moto_LoadConfig
  73                     ; 35   TIM4_Config();
  75  0009 cd0000        	call	_TIM4_Config
  77                     ; 36   main3();
  80                     ; 39 }
  83  000c cc0000        	jp	_main3
 118                     ; 50 void assert_failed(u8* file, u32 line)
 118                     ; 51 { 
 119                     .text:	section	.text,new
 120  0000               _assert_failed:
 124  0000               L73:
 125  0000 20fe          	jra	L73
 138                     	xdef	_main
 139                     	xref	_TIM4_Config
 140                     	xref	_main3
 141                     	xref	_Moto_LoadConfig
 142                     	xref	_UART_Config
 143                     	xref	_Exit_Init
 144                     	xdef	_assert_failed
 163                     	end
