#include "stm8s.h"
extern uint16_t MotoA_Count,MotoB_Count,All_CountA,All_CountB;
short PA,PB,CA,CB;
static uint16_t CountWrite=0;
extern uint8_t RxBuffer[10],RxCount;
uint8_t Action;
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
    PB-=10*(MB-Stp);
    PA-=10*(MA-Stp);
    Printf(PA);
    Printf(PB);
    Printf((short)MA);
    Printf((short)MB);
    if(MA==MB)
    {
    CountWrite++;
    }else CountWrite=0;
  }else
  {
    MA=MotoA_Count;
    MotoA_Count=0;
    MB=MotoB_Count;
    MotoB_Count=0;
    CB-=50*(MB-Stp);
    CA-=50*(MA-Stp);
  }
  Moto_Run(0,0);
}
void Steps(short s,uint16_t t,uint8_t Mode)
{
  short Speed=s;
  uint16_t od=t;
  while(t--)
  {
    MotoA_Count=0;
    MotoB_Count=0;
    Speed=s;
    if(t<5)Speed=500;
    if((od-t)<5)Speed=500;
    switch(Mode)
    {
      case 1:
        PA=Speed;PB=0-Speed;
        break;
      case 2:
        PA=0-Speed;PB=0-Speed;
        break;
      case 3:
        PA=Speed;PB=Speed;
        break;
      case 4:
        PA=0-Speed;PB=Speed;
        break;
    }
    Moto_Run(PA,PB);
    while(1)
    {
      if(Action)
      {
        Moto_Run(PA,PB);
        Action=0;
      }
      if(PA==0)if(PB==0)
      {
        Moto_Run(PA,PB);
        break;
      }
    }
  }
}
void main3(void)
{
   uint8_t i,v;
  uint16_t Count;
  Moto_Run(3000,3000);
  while(1)
  {
   
    if(RxCount>=6)
    {
     UART1_ITConfig(UART1_IT_RXNE_OR, DISABLE);
     if(RxBuffer[0]==0xbb)
     {
       v=0x00;
       for(i=0;i<5;i++)v^=RxBuffer[i];
       if(v==RxBuffer[5])
       {
         All_CountA=0;All_CountB=0;
         Count=(uint16_t)RxBuffer[1]*0xff+RxBuffer[2];
         Steps(590,Count,RxBuffer[4]);
         Delay_Ms(100);
           All_CountA+=All_CountB;
           All_CountA/=2;
         switch(RxBuffer[4])
         {
            case 1: 
              if(All_CountA>Count)Steps(590,All_CountA-Count,4);
              break;
            case 2:
              if(All_CountA>Count)Steps(590,All_CountA-Count,3);
              break;
            case 3:
              if(All_CountA>Count)Steps(590,All_CountA-Count,2);
              break;
            case 4:
              if(All_CountA>Count)Steps(590,All_CountA-Count,1);
              break;
         }
       }
     }
     for(i=0;i<10;i++)RxBuffer[i]=0x00;
     RxCount=0;
     UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);
    }
  }
}
void mainold3(void)
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
         CA=PA;CB=PB;
         
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
