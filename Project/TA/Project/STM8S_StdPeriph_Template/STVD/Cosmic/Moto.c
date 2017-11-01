#include "stm8s.h"
extern uint16_t MotoA_Count,MotoB_Count;
short PA,PB;
static uint16_t CountWrite=0;
extern uint8_t RxBuffer[10],RxCount;
void Moto_ConfigCheck()
{
  if(PB>4090)PA=1000;
  if(PB>4090)PB=1000;
  if(PA<400)PA=400;
  if(PB<400)PB=400;
}
void Moto_LoadConfig()
{
  EP_Read(0,&PA,&PB);
  Moto_ConfigCheck();
}
void Moto_SaveConfig()
{
  EP_Write(0,&PA,&PB);
}

void Run_Step(uint16_t Time,uint16_t Stp,uint8_t Mode)
{
  
  short MA,MB;
  switch(Mode)
  {
    case 1:Moto_Run(PA,0-PB);break;
    case 2:Moto_Run(0-PA,0-PB);break;
    case 3:Moto_Run(PA,PB);break;
    case 4:Moto_Run(0-PA,PB);break;
    case 5:Moto_Run(PA,0-PB);break;
  }
 
  Delay_Ms(Time);
  if(Mode==5)
  {
    MA=MotoA_Count;
    MotoA_Count=0;
    MB=MotoB_Count;
    MotoB_Count=0;
    PB-=(MB-Stp);
    PA-=(MA-Stp);
    Printf(PA);
    Printf(PB);
    Printf((short)MA);
    Printf((short)MB);
    if(MA==MB)
    {
    CountWrite++;
    }else CountWrite=0;
  }
  Moto_Run(0,0);
}
void main3(void)
{
  uint8_t i,v;
  //for(i=0;i<15;i++)Run_Step(30,30,1);
  MotoA_Count=0;
  MotoB_Count=0;
  while(1)
  {
    /*Delay_Ms(500);
    Run_Step(60,1);
    Delay_Ms(500);
    Run_Step(16,2);
    Delay_Ms(500);
    Run_Step(60,1);
    Delay_Ms(500);*/    
    if(RxCount>=6)
    {
     UART1_ITConfig(UART1_IT_RXNE_OR, DISABLE);
     if(RxBuffer[0]==0xbb)
     {
       v=0x00;
       for(i=0;i<5;i++)v^=RxBuffer[i];
       if(v==RxBuffer[5])
       {
         for(i=0;i<RxBuffer[3];i++)Run_Step(RxBuffer[1],RxBuffer[2],RxBuffer[4]);
       if(RxBuffer[4]==5)
      if(CountWrite>0) 
      {
        Moto_SaveConfig();
       CountWrite=0;
      }
     }
     }
     for(i=0;i<10;i++)RxBuffer[i]=0x00;
     RxCount=0;
     UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
    }
  }
}
