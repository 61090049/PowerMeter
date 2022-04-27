#include "CTMux.h"

/*
From A0 -> A3
ADC_1 = {U6,J3,J2,J1}
ADC_2 = {J4,J5,J6,J7}
*/

Adafruit_ADS1115 ADC_1;
Adafruit_ADS1115 ADC_2;

CTMux::CTMux(){
    ADC_1.setDataRate(RATE_ADS1115_860SPS);
    ADC_2.setDataRate(RATE_ADS1115_860SPS);
    ADC_1.setGain(GAIN_ONE);
    ADC_2.setGain(GAIN_ONE);
    ADC_1.begin(0x4A);
    ADC_2.begin(0x48);
}

uint16_t CTMux::getReading(int Channel){
    if(Channel <= 3){
        return ADC_1.readADC_SingleEnded(Channel);
    }
    else if(Channel <= 7){
        return ADC_2.readADC_SingleEnded(Channel % 4);
    }
    return 0;
}

int16_t CTMux::getReadingDiff(int Channel1, int Channel2){
  if((Channel1 == 7 && Channel2 == 6)||(Channel1 == 6 && Channel2 ==7))
    return ADC_2.readADC_Differential_0_1();
   else if((Channel1 == 5 && Channel2 == 4)||(Channel1 == 4 && Channel2 == 5))
    return ADC_2.readADC_Differential_2_3();
}
