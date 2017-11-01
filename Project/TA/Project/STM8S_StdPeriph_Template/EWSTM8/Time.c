#include "stm8s.h" 
#define TIM4_PERIOD       124
__IO uint32_t TimingDelay = 0;
INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
 if (TimingDelay != 0x00)
  {
    TimingDelay--;
  }
  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
}

void Delay(__IO uint32_t nTime)
{
  TimingDelay = nTime;

  while (TimingDelay != 0);
}
