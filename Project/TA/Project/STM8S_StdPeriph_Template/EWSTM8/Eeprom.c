#include "stm8s.h"
extern short PA,PB;
uint32_t EEPROM_Read(uint16_t Addr)
{
  uint32_t start_add = 0x4100+Addr,P;
  P=*(uint32_t *)(uint16_t)start_add;
  return P;
}
void EEPEOM_Write(uint16_t Addr,uint32_t Data)
{
  uint32_t start_add = 0x4100+Addr;
  FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
  FLASH_Unlock(FLASH_MEMTYPE_DATA);
  FLASH_ProgramWord(start_add, Data);
}
void EEPEOM_Test()
{
  
  PA=EEPROM_Read(8);
  PB=EEPROM_Read(12);
}
void EEPROM_Save()
{
  while(1)
  {
    EEPEOM_Write(8,PA);
    if(EEPROM_Read(8)==PA)break;
  }
  while(1)
  {
    EEPEOM_Write(12,PB);
    if(EEPROM_Read(12)==PB)break;
  }
}
void EP_Read(uint8_t Index,short *A,short *B)
{
  uint32_t T;
  T=EEPROM_Read(Index*4);
  *A=T>>16;
  *B=T&0xffff;
}
void EP_Write(uint8_t Index,short *A,short *B)
{
  uint32_t T=0;
  T=*A;
  T<<=16;
  T|=*B;
  EEPEOM_Write(Index*4,T);
}
