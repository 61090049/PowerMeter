#include "CTMux.h"

/*
From A0 -> A3
ADC_1 = {U6,J3,J2,J1}
ADC_2 = {J4,J5,J6,J7}
*/

//Adafruit_ADS1115 ADC_1;
Adafruit_ADS1115 ADC_2;

CTMux::CTMux(){
    //ADC_1.setDataRate(RATE_ADS1115_860SPS);
    ADC_2.setDataRate(RATE_ADS1115_860SPS);
    //ADC_1.setGain(GAIN_ONE);
    //ADC_2.setGain(GAIN_ONE);
    //ADC_1.begin(0x4a);
    ADC_2.begin(0x48);
}

int16_t CTMux::getReading(int Channel){
    //return ADC_2.readADC_Differential_0_1();
    return ADC_2.readADC_SingleEnded(Channel);

}
