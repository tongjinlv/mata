#include "stm8s.h"
#define CCR1_Val  ((uint16_t)2047)
#define CCR2_Val  ((uint16_t)2047)
#define CCR3_Val  ((uint16_t)2047)
#define CCR4_Val  ((uint16_t)2047)

void Delay_Us(uint16_t i)
{
  uint16_t n;
  for(n=0;n<i;n++);
}
void Delay_Ms(uint16_t i)
{
  while(i--)Delay_Us(600);
}
void Moto_SetA(short Value)
{
  if(Value==0)
  {
    GPIO_WriteLow(GPIOC,GPIO_PIN_3);
    GPIO_WriteLow(GPIOC,GPIO_PIN_4);
  }
  else if(Value>0)
  {
    GPIO_WriteLow(GPIOC,GPIO_PIN_4);
      TIM1_OC3Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
               Value, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
               TIM1_OCNIDLESTATE_RESET);
  }else
  {
    Value=0-Value;
    GPIO_WriteLow(GPIOC,GPIO_PIN_3);
    TIM1_OC4Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, Value, TIM1_OCPOLARITY_LOW,TIM1_OCIDLESTATE_SET);
  }
}
void Moto_SetSA(short Value)
{
  if(Value==0)
  {
    GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
    GPIO_WriteHigh(GPIOC,GPIO_PIN_4);
  }
  else if(Value>0)
  {
    GPIO_WriteLow(GPIOC,GPIO_PIN_4);
      TIM1_OC3Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
               Value, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
               TIM1_OCNIDLESTATE_RESET);
  }else
  {
    Value=0-Value;
    GPIO_WriteLow(GPIOC,GPIO_PIN_3);
    TIM1_OC4Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, Value, TIM1_OCPOLARITY_LOW,TIM1_OCIDLESTATE_SET);
  }
}
void Moto_SetB(short Value)
{
  if(Value==0)
  {
    GPIO_WriteLow(GPIOC,GPIO_PIN_6);
    GPIO_WriteLow(GPIOC,GPIO_PIN_7);
  }
  else if(Value>0)
  {
    
    GPIO_WriteLow(GPIOC,GPIO_PIN_7);
      TIM1_OC1Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
               Value, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
               TIM1_OCNIDLESTATE_RESET); 
  }else
  {
    Value=0-Value;
    GPIO_WriteLow(GPIOC,GPIO_PIN_6);
    TIM1_OC2Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, Value,
               TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, 
               TIM1_OCNIDLESTATE_RESET);
    
  }
}
void Moto_SetSB(short Value)
{
  if(Value==0)
  {
    GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
    GPIO_WriteHigh(GPIOC,GPIO_PIN_7);
  }
  else if(Value>0)
  {
    
    GPIO_WriteLow(GPIOC,GPIO_PIN_7);
      TIM1_OC1Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
               Value, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
               TIM1_OCNIDLESTATE_RESET); 
  }else
  {
    Value=0-Value;
    GPIO_WriteLow(GPIOC,GPIO_PIN_6);
    TIM1_OC2Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, Value,
               TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, 
               TIM1_OCNIDLESTATE_RESET);
    
  }
}
void Moto_Run(short Value,short Value2)
{
  TIM1_CtrlPWMOutputs(DISABLE);
 /* GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_4);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_7);*/
  TIM1_DeInit();
 /* GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_4);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_7);*/
  TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 4095, 0);
  GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_7|GPIO_PIN_6), GPIO_MODE_OUT_PP_LOW_FAST);
  Moto_SetA(Value);
  Moto_SetB(Value2);
  TIM1_Cmd(ENABLE); 
  TIM1_CtrlPWMOutputs(ENABLE);
}
void Moto_RunS(short Value,short Value2)
{
  TIM1_CtrlPWMOutputs(DISABLE);
 /* GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_4);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_7);*/
  TIM1_DeInit();
 /* GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_4);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_7);*/
  TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 4095, 0);
  GPIO_Init(GPIOC, (GPIO_Pin_TypeDef)(GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_7|GPIO_PIN_6), GPIO_MODE_OUT_PP_LOW_FAST);
  Moto_SetSA(Value);
  Moto_SetSB(Value2);
  TIM1_Cmd(ENABLE); 
  TIM1_CtrlPWMOutputs(ENABLE);
}
