#ifndef CT_MUX
#define CT_MUX

#include <inttypes.h>
#include <Adafruit_ADS1X15.h>

class CTMux{
    private:
        Adafruit_ADS1115 ADC_1;
        Adafruit_ADS1115 ADC_2;
    public:
        CTMux();
        uint16_t getReading(int Channel);
        int16_t getReadingDiff(int Channel1, int Channel2);
};
#endif
