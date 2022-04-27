#ifndef POWER_MODULE
#define POWER_MODULE

#include <inttypes.h>
#include "CTMux.h"

class PowerModule{
    private:
        CTMux Selector;
        uint8_t Channel;
        
        double CCVoltage;
        double CCCurrent;
        double CCPhase;

        double OffsetVoltage;
        double OffsetCurrent;

        double FilteredVoltage;
        double PrevFilteredVoltage;
        double FilteredCurrent;
        uint16_t SampleVoltage;
        uint16_t SampleCurrent;

        double InstantaneousPower;
        double TotalPower;

        double SquaredCurrent;
        double TotalCurrent;
        double CurrentRMS;
        double CurrentRatio;

        double SquaredVoltage;
        double TotalVoltage;
        double VoltageRMS;
        double VoltageRatio;

        double RealPower;
        double ApparentPower;
        double PowerFactor;

    public:
        PowerModule(CTMux& MuxModule, uint8_t SelectedChannel);
        void Voltage(double VoltageCalib = 1.0, double PhaseCalib = 1.0);
        void Current(double CurrentCalib = 1.0);
        void processCurrent();
        double OffSetZMPT(double Val);
        void processPower();
        double getVoltageRMS(){return VoltageRMS;}
        double getCurrentRMS(){return CurrentRMS;}
        double getApparentPower(){return ApparentPower;}
        double getRealPower(){return RealPower;}
        double getPowerFactor(){return PowerFactor;}
};
#endif
