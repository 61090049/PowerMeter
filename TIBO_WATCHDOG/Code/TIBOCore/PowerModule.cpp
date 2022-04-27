#include "PowerModule.h"

#define ADC_BITS 15
#define ADC_COUNTS 32768
#define ADC_OFFSET_COUNT ADC_COUNTS/2
#define VOLTAGE_OFFSET 12750.0
#define CURRENT_OFFSET 12750.0
#define WD_TIMER 2000
#define MAX_CROSS_COUNT 20
#define MAX_CUR_SAMPLE 10
#define REF_VOLTAGE 3300
#define WDT_REL_DELAY 10
#define OUTLIER_SIG_FACTOR -50000
#define VMAX_OFFSET 17272.0

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

PowerModule::PowerModule(CTMux& MuxModule, uint8_t SelectedChannel){
    Selector = MuxModule;
    Channel = SelectedChannel;
    Voltage();
    Current();
}

void PowerModule::Voltage(double VoltageCalib, double PhaseCalib){
    CCVoltage = VoltageCalib;
    CCPhase = PhaseCalib;
    OffsetVoltage = VOLTAGE_OFFSET;
}

void PowerModule::Current(double CurrentCalib){
    CCCurrent = CurrentCalib;
    OffsetCurrent = CURRENT_OFFSET;
}

void PowerModule::processCurrent(){
    for (uint16_t n = 0; n < MAX_CUR_SAMPLE; n++)
    {
        SampleCurrent = Selector.getReading(Channel);
        OffsetCurrent += (SampleCurrent - OffsetCurrent)/ADC_COUNTS;
        FilteredCurrent = SampleCurrent - OffsetCurrent;
        SquaredCurrent = FilteredCurrent * FilteredCurrent;
        TotalCurrent += SquaredCurrent;
        delay(WDT_REL_DELAY);
    }
    CurrentRatio = CCCurrent *((REF_VOLTAGE/1000.0) / (ADC_COUNTS));
    CurrentRMS = CurrentRatio * sqrt(TotalCurrent / MAX_CUR_SAMPLE);
    TotalCurrent = 0;
    Serial.println(CurrentRMS);
}

double PowerModule::OffSetZMPT(double Val){
  //Serial.print("OFZ:");
  //Serial.println(((ADC_COUNTS-OffsetVoltage)*(Val-OffsetVoltage)/(VMAX_OFFSET-OffsetVoltage)) + OffsetVoltage);
  return ((ADC_COUNTS-OffsetVoltage)*(Val-OffsetVoltage)/(VMAX_OFFSET-OffsetVoltage)) + OffsetVoltage;
  //return Val;
}

void PowerModule::processPower(){
    uint16_t Crossed = 0;
    uint16_t Samples = 0;
    uint16_t initVoltage;
    double PhaseShiftedVoltage;
    bool PrevCrossState;
    bool CurrCrossState;

    unsigned long StartTimestamp = millis();
    while(1){
        initVoltage = Selector.getReading(0);
        if ((initVoltage < (ADC_COUNTS*0.55)) && (initVoltage > (ADC_COUNTS*0.45))){ break; }
        if ((millis() - StartTimestamp) > WD_TIMER){ break; }
        //delay(WDT_REL_DELAY);
    }

    StartTimestamp = millis();
    while ((Crossed < MAX_CROSS_COUNT) && ((millis() - StartTimestamp) < WD_TIMER)){

        SampleVoltage = OffSetZMPT(Selector.getReading(0));
        SampleCurrent = Selector.getReading(Channel);

        if(SampleVoltage <= OUTLIER_SIG_FACTOR){continue;}

        Samples++;
        PrevFilteredVoltage = FilteredVoltage;

        //TODO:Here
        /*
        Serial.print("Samples:");
        Serial.println(Samples);
        Serial.print("Sample Voltage:");
        Serial.println(SampleVoltage);
        Serial.print("Offset Voltage:");
        Serial.println(OffsetVoltage);
        */
        OffsetVoltage += (SampleVoltage - OffsetVoltage)/ADC_COUNTS;
        /*
        Serial.print("New Offset Voltage:");
        Serial.println(OffsetVoltage);
        */
        FilteredVoltage = SampleVoltage - OffsetVoltage;
        /*
        Serial.print("Filtered Voltage:");
        Serial.println(FilteredVoltage);
        Serial.println("-----------------");
        */
        /*
        Serial.print("Samples:");
        Serial.println(Samples);
        Serial.print("Sample Voltage:");
        Serial.println(SampleCurrent);
        Serial.print("Offset Voltage:");
        Serial.println(OffsetCurrent);
        */
        OffsetCurrent += (SampleCurrent - OffsetCurrent)/ADC_COUNTS;
        /*
        Serial.print("New Offset Voltage:");
        Serial.println(OffsetCurrent);
        */
        FilteredCurrent = SampleCurrent - OffsetCurrent;
        /*
        Serial.print("Filtered Voltage:");
        Serial.println(FilteredCurrent);
        */

        SquaredVoltage = pow(FilteredVoltage,2);
        TotalVoltage += SquaredVoltage;
        SquaredCurrent = pow(FilteredCurrent,2);
        TotalCurrent += SquaredCurrent;/*
        Serial.print("Sq Currnet:");
        Serial.println(TotalCurrent);
        Serial.println("-----------------");
        */

        PhaseShiftedVoltage = PrevFilteredVoltage + CCPhase * (FilteredVoltage - PrevFilteredVoltage);
        InstantaneousPower = PhaseShiftedVoltage * FilteredCurrent;
        /*
        if(InstantaneousPower<0){
        
          Serial.print(PhaseShiftedVoltage);
          Serial.print("/");
          Serial.println(FilteredCurrent);
        }
        */
        TotalPower += InstantaneousPower;

        PrevCrossState = CurrCrossState;
        if (SampleVoltage > initVoltage){CurrCrossState = true;}
        else{CurrCrossState = false;}
        if (Samples <= 1){PrevCrossState = CurrCrossState;}
        if (PrevCrossState != CurrCrossState) Crossed++;
        //delay(WDT_REL_DELAY);
    }

    VoltageRatio = CCVoltage *((REF_VOLTAGE/1000.0) / (ADC_COUNTS));
    VoltageRMS = VoltageRatio * sqrt(TotalVoltage / Samples);
    CurrentRatio = CCCurrent *((REF_VOLTAGE/1000.0) / (ADC_COUNTS));
    if(VoltageRMS<100){CurrentRatio = 0;}
    CurrentRatio += pow((rand()%19)+1, -0.9)/70;
    CurrentRMS = CurrentRatio * sqrt(TotalCurrent / Samples);
    /*
    Serial.println(CCCurrent);
    Serial.println(CurrentRMS);
    */
    RealPower = VoltageRatio * CurrentRatio * TotalPower / Samples;
    ApparentPower = VoltageRMS * CurrentRMS;
    PowerFactor = RealPower / ApparentPower;

    TotalVoltage = 0;
    TotalCurrent = 0;
    TotalPower = 0;
}
