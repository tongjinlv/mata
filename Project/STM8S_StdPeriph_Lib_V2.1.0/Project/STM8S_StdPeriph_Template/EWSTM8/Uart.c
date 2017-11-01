#include "stm8s.h" 

uint8_t RxBuffer[10],RxCount=0;
INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
{
  uint8_t Data;
  if( UART1_GetITStatus(UART1_IT_RXNE) == SET)
  {
    Data=UART1_ReceiveData8();
    if(Data==0xbb)RxCount=0;
    if(RxCount<9)RxBuffer[RxCount++]=Data;
  }
}
void UART_Config(void)
{
 //  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 // CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
  GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_5), GPIO_MODE_OUT_PP_LOW_FAST);
  GPIO_Init(GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
  UART1_DeInit();
  UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D,UART1_STOPBITS_1, UART1_PARITY_NO,
  UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  UART1_Cmd(DISABLE);
  UART1_Cmd(ENABLE);
  UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
  enableInterrupts();   
}

void Printf_Byte(uint8_t c)
{
  UART1_SendData8(c);
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
}
void Printf(short d)
{
  Printf_Byte(d%100000/10000+'0');
  Printf_Byte(d%10000/1000+'0');
  Printf_Byte(d%1000/100+'0');
  Printf_Byte(d%100/10+'0');
  Printf_Byte(d%10+'0');
  Printf_Byte('\r');
  Printf_Byte('\n');
}