#include "stm8s.h"
uint16_t MotoA_Count,MotoB_Count;
void GPIO_Config(void)
{
  GPIO_Init(GPIOD, (GPIO_Pin_TypeDef)(GPIO_PIN_2),GPIO_MODE_IN_FL_IT);
  GPIO_Init(GPIOA, (GPIO_Pin_TypeDef)(GPIO_PIN_3),GPIO_MODE_IN_FL_IT);
}
void Exit_Init(void)
{
  GPIO_Config();
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD, EXTI_SENSITIVITY_RISE_FALL);
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_RISE_FALL);
  EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
  enableInterrupts();
}
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  //if(!GPIO_ReadInputPin(GPIOD,GPIO_PIN_2))
    MotoB_Count++;
}
INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{
 //if(!GPIO_ReadInputPin(GPIOA,GPIO_PIN_3))
   MotoA_Count++;
}