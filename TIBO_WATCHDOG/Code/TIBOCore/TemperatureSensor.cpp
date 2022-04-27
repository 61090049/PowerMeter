#include "TemperatureSensor.h"
#define MUST_SLEEP_PERIOD 2000

AHT10 Sensor(AHT10_ADDRESS_0X38);
float currentTemperature;
float currentHumidity;
unsigned long lastWake = 0;
bool isReadTempBefore = false;

TemperatureSensor::TemperatureSensor(){
  /*
    while(Sensor.begin()!= true){
        delay(1000);
        Serial.println("Waiting for temperature sensor.");
    }
    */
    delay(100);
}

float TemperatureSensor::getTemperature(){
    if(isEnoughSleep() || !isReadTempBefore){currentTemperature = Sensor.readTemperature();}
    isReadTempBefore = true;
    return currentTemperature;
}

float TemperatureSensor::getHumidity(){
    if(isEnoughSleep() || isReadTempBefore){currentHumidity = Sensor.readHumidity();}
    isReadTempBefore = false;
    return currentHumidity;
}

bool TemperatureSensor::isEnoughSleep(){
    unsigned long _callTS = millis();
    if(_callTS - lastWake >= MUST_SLEEP_PERIOD){
        lastWake = _callTS;
        return true;
    }
    else{return false;}
}
