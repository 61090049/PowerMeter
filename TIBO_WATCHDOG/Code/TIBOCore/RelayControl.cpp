#include "RelayControl.h"
#include "Arduino.h"

uint8_t RelayPin; 
RelayControl::RelayControl(uint8_t Pin){
    RelayPin = Pin;
    SetPin(RelayPin);
}

void RelayControl::SetPin(uint8_t Pin){
    pinMode(Pin, OUTPUT);
}

void RelayControl::SetStateOn(){
    digitalWrite(RelayPin, HIGH);
}

void RelayControl::SetStateOff(){
    digitalWrite(RelayPin, LOW);
}

void RelayControl::SetStateToggle(){
    digitalWrite(RelayPin, !digitalRead(RelayPin));
}

uint8_t RelayControl::getState(){
    uint8_t CurrentPinState = digitalRead(RelayPin);
    return CurrentPinState;
}
