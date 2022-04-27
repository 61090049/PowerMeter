#include "PowerModule.h"
#include "CTMux.h"

CTMux SelectorUnit;
//PowerModule PowerUnit_CH1(SelectorUnit, CH_1);
//PowerModule PowerUnit_CH2(SelectorUnit, CH_2);

void setup() {
  Serial.begin(115200);
  delay(10);
  
  SelectorUnit = CTMux();
  //ADC_2.setDataRate(RATE_ADS1115_860SPS);
  //ADC_2.begin(0x48);
  //PowerUnit_CH1.Voltage(262.5, 1.7);
  //PowerUnit_CH1.Current(16.5);
}

void loop() {
  Serial.println(SelectorUnit.getReading(0));
  
  //PowerUnit_CH2.processCurrent();
  //Serial.println("======================================================");
  delay(10);

}
