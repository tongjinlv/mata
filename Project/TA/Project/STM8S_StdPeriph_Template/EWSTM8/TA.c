#include "stm8s.h"

void Power_ON()
{
  
  GPIO_WriteHigh(GPIOC,GPIO_PIN_4); 
}
void Power_OFF()
{
  GPIO_WriteLow(GPIOC,GPIO_PIN_4); 
}
void Power_In()
{
  
}
uint8_t Power_Get()
{
  return GPIO_ReadInputPin(GPIOC,GPIO_PIN_3);
}
void LEDA_ON()
{
  GPIO_WriteHigh(GPIOB,GPIO_PIN_4); 
}
void LEDB_ON()
{
  GPIO_WriteHigh(GPIOB,GPIO_PIN_5); 
}
void LEDA_OFF()
{
  GPIO_WriteLow(GPIOB,GPIO_PIN_4); 
}
void LEDB_OFF()
{
  GPIO_WriteLow(GPIOB,GPIO_PIN_5); 
}
void BSP_GPIO_Init()
{
   GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);//LEDA
   GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);//LEDB
   GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);//POWOUT
   GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);//POWIN
}
void LED_Start()
{
  uint8_t i=3;
  while(i--)
  {
    Delay_Ms(100);
    LEDA_ON();
    Delay_Ms(100);
    LEDA_OFF();
  } 
}
void LED_Stop()
{
  uint8_t i=3;
  while(i--)
  {
    Delay_Ms(100);
    LEDA_ON();
    LEDB_ON();
    Delay_Ms(100);
    LEDA_OFF();
    LEDB_OFF();
  } 
}
void TA_main(void)
{
  BSP_GPIO_Init();
  Power_ON();
  LED_Start();
  LEDA_ON();
  LEDB_ON();
  while(1){
  
    if(Power_Get())
    {
      LED_Stop();
      Power_OFF();
      while(1);
    }
  }
}