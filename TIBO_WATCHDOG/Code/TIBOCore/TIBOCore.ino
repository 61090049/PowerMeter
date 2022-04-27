//#include "WifiHandler.h"
//#include "PowerModule.h"
#include "CTMux.h"
//#include "TemperatureSensor.h"

CTMux SelectorUnit;
//TemperatureSensor TemperatureUnit;

//WifiHandler WifiUnit;

//PowerModule PowerUnit_CH1(SelectorUnit, CH_1);
//PowerModule PowerUnit_CH2(SelectorUnit, CH_2);

void setup() {
  Serial.begin(115200);
  delay(10);
  
  //WifiUnit = WifiHandler();
  SelectorUnit = CTMux();
  //TemperatureUnit = TemperatureSensor();
  //PowerUnit_CH1.Voltage(262.5, 1.7);
  //PowerUnit_CH1.Current(16.5);
}

void unit_auto_test(){
  Serial.print(SelectorUnit.getReading(0));
  Serial.print(" ");
  Serial.print(SelectorUnit.getReading(1));
  Serial.print(" ");
  Serial.print(SelectorUnit.getReading(2));
  Serial.print(" ");
  Serial.print(SelectorUnit.getReading(3));
  Serial.print(",");
  Serial.print(SelectorUnit.getReading(4));
  Serial.print(",");
  Serial.print(SelectorUnit.getReading(5));
  Serial.print(",");
  Serial.print(SelectorUnit.getReading(6));
  Serial.print(",");
  Serial.println(SelectorUnit.getReading(7));
  
}

void loop() {
  Serial.println(SelectorUnit.getReading(4));
  
  /*
  Serial.println(WifiUnit.ConnectWifi());
  
  PowerUnit_CH1.processPower();
  if(WifiUnit.updateChannel(CH_1, PowerUnit_CH1, TemperatureUnit)){
    Serial.println(WifiUnit.pushChannel(CH_1));
  }
  WifiUnit.debugPrint(CH_1);

  PowerUnit_CH2.processPower();
  if(WifiUnit.updateChannel(CH_2, PowerUnit_CH2, TemperatureUnit)){
    WifiUnit.pushChannel(CH_2);
  }
  WifiUnit.debugPrint(CH_2);
  */
  //Serial.println("======================================================");
  //delay(10);

}
