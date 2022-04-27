#ifndef RELAY_CONTROL
#define RELAY_CONTROL

#include <inttypes.h>

class RelayControl{
    private:
        uint8_t RelayPin;

    public:
        RelayControl(uint8_t Pin);
        void SetPin(uint8_t Pin);
        void SetStateOn();
        void SetStateOff();
        void SetStateToggle();
        uint8_t getState();
};
#endif