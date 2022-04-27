#ifndef TEMPERATURE_SENSOR
#define TEMPERATURE_SENSOR
#include "AHT10.h"

class TemperatureSensor{
    private:
        AHT10 Sensor;
        float currentTemperature;
        float currentHumidity;
        unsigned long lastWake;
        bool isReadTempBefore;
    public:
        TemperatureSensor();
        float getTemperature();
        float getHumidity();
        bool isEnoughSleep();
};
#endif