#include "stm8s.h"
extern uint32_t MotoA_Count,MotoB_Count;
extern short PA,PB;
uint16_t FlowPoolFilter(uint32_t *Pool,uint16_t Data,uint8_t *PoolIndex,uint8_t PoolSize)
{
	uint16_t Old_Filter=0;
	if(*PoolIndex)Old_Filter=((*Pool)/(*PoolIndex));
	(*Pool)+=Data;
	if((*PoolIndex)<PoolSize)(*PoolIndex)++;
	else (*Pool)-=Old_Filter; 
	return (*Pool)/(*PoolIndex);
}

void Run_Step1(uint16_t Time,uint16_t stp,uint8_t Mode)
{
  static uint16_t CountWrite=0;
  static uint32_t Pool1,Pool2;
  static uint8_t Index1,Index2;
  uint16_t MA,MB;
  MotoA_Count=0;
  MotoB_Count=0;
  switch(Mode)
  {
    case 0:Moto_Run(0,0);break;
    case 1:Moto_Run(PA,0-PB);break;
    case 2:Moto_Run(0-PA,0-PB);break;
    case 3:Moto_Run(PA,PB);break;
    case 4:Moto_Run(0-PA,PB);break;
  }
  Delay_Ms(Time);
  MA=MotoA_Count;
  MB=MotoB_Count;

  Moto_Run(0,0);
}
void main4(void)
{
  uint8_t i,v;
  for(i=0;i<15;i++)Run_Step(30,30,1);
  MotoA_Count=0;
  MotoB_Count=0;
  while(1)
  {
    Run_Step(2000,200,1);
  }
}
