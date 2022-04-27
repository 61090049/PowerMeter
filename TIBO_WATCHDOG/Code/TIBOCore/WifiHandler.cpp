#include "WifiHandler.h"

#define WFI_RETRY_COUNT 20
#define WFI_RETRY_DELAY 500
#define REQ_RETRY_COUNT 5
#define REQ_RETRY_DELAY 500

char HostSSID[MAX_SSID_LEN];
char HostPWD[MAX_PWD_LEN];

char ssid[] = "TomatoS85\0";
char pass[] = "5l34zb49\0";
const char* UrlQuery = "/update?api_key=";
const char* UrlDomain = "api.thingspeak.com";

Channel Channels[MAX_CHANNEL_COUNT];

WiFiClient ClientHandler;

WifiHandler::WifiHandler(){
    //setHostSSID(SSID);
    //setHostPWD(PASS);

    Channels[0] = Channel(ID_CH1, WRITE_KEY_CH1, READ_KEY_CH1);
    Channels[1] = Channel(ID_CH2, WRITE_KEY_CH2, READ_KEY_CH2);
    /*
    Channels[2] = Channel(ID_CH3, WRITE_KEY_CH3, READ_KEY_CH3);
    Channels[3] = Channel(ID_CH4, WRITE_KEY_CH4, READ_KEY_CH4);
    Channels[4] = Channel(ID_CH5, WRITE_KEY_CH5, READ_KEY_CH5);
    Channels[5] = Channel(ID_CH6, WRITE_KEY_CH6, READ_KEY_CH6);
    Channels[6] = Channel(ID_CH7, WRITE_KEY_CH7, READ_KEY_CH7);
    */
    
    ThingSpeak.begin(ClientHandler);
    ConnectWifi();
}

int WifiHandler::ConnectWifi(){
    int _wfi_retry = 0;
    while((WiFi.status() != WL_CONNECTED) &&
     (_wfi_retry <= WFI_RETRY_COUNT)){
      Serial.print("retry");
        WiFi.begin(SSID, PASS);
        delay(WFI_RETRY_DELAY);
        _wfi_retry++;
     }
    if(WiFi.status() != WL_CONNECTED){
        Serial.print("unconnected");
        return 0;
    }
    return 1;
}

void WifiHandler::setHostSSID(char NewSSID[MAX_SSID_LEN]){
    strcpy(HostSSID, NewSSID);
}

void WifiHandler::setHostPWD(char NewPWD[MAX_PWD_LEN]){
    strcpy(HostPWD, NewPWD);
}

float WifiHandler::getFloatData(long Channel, unsigned int Field){
    ConnectWifi();
    Channels[Channel].setFieldData(Field - 1,
     ThingSpeak.readFloatField(Channels[Channel].getChannelID(),
      Field, Channels[Channel].getReadAPIKey()));
    if(!isReadError()){return Channels[Channel].getFieldData(Field - 1);}
}

long WifiHandler::getLongData(long Channel, unsigned int Field){
    ConnectWifi();
    Channels[Channel].setFieldData(Field - 1,
     ThingSpeak.readLongField(Channels[Channel].getChannelID(),
      Field, Channels[Channel].getReadAPIKey()));
    if(!isReadError()){return Channels[Channel].getFieldData(Field - 1);}
}

int WifiHandler::getIntData(long Channel, unsigned int Field){
    ConnectWifi();
    Channels[Channel].setFieldData(Field - 1,
     ThingSpeak.readIntField(Channels[Channel].getChannelID(),
      Field, Channels[Channel].getReadAPIKey()));
    if(!isReadError()){return Channels[Channel].getFieldData(Field - 1);}
}

int WifiHandler::isReadError(){
    int _error_code = 0;
    _error_code = ThingSpeak.getLastReadStatus();
    if(_error_code == 200){return 0;}
    else{return _error_code;}
}

int WifiHandler::isWriteError(int code){
    if(code == 200){return 0;}
    else{return code;}
}

int WifiHandler::pushData(long Channel, unsigned int Field, float Data){
    Channels[Channel].setFieldData(Field, Data);
    if(pushField(Channel, Field)){return -1;}
    else {return 0;}
}

int WifiHandler::pushField(long Channel, unsigned int Field){
    ConnectWifi();
    if(!isWriteError(ThingSpeak.writeField(Channels[Channel].getChannelID(),
    Field, Channels[Channel].getFieldData(Field - 1), Channels[Channel].getWriteAPIKey()))){
        return 1;
    }
    else {return 0;}
}

int WifiHandler::pushChannel(long Channel){
    ConnectWifi();

    ThingSpeak.setField(FIELD_VOLTAGE, Channels[Channel].getFieldData(FIELD_VOLTAGE));
    ThingSpeak.setField(FIELD_CURRENT, Channels[Channel].getFieldData(FIELD_CURRENT));
    ThingSpeak.setField(FIELD_APPARENT, Channels[Channel].getFieldData(FIELD_APPARENT));
    ThingSpeak.setField(FIELD_REAL, Channels[Channel].getFieldData(FIELD_REAL));
    ThingSpeak.setField(FIELD_FACTOR, Channels[Channel].getFieldData(FIELD_FACTOR));
    ThingSpeak.setField(FIELD_TEMPERATURE, Channels[Channel].getFieldData(FIELD_TEMPERATURE));
    ThingSpeak.setField(FIELD_HUMIDITY, Channels[Channel].getFieldData(FIELD_HUMIDITY));

    int err = isWriteError(ThingSpeak.writeFields(Channels[Channel].getChannelID(),
    Channels[Channel].getWriteAPIKey()));
    if(!err){
        return 1;
    }
    else {return err;}
}

int WifiHandler::updateField(long Channel, unsigned int Field, PowerModule& PowRecord, TemperatureSensor& TempRecord){
    switch(Field - 1){
        case 0:
            Channels[Channel].setFieldData(FIELD_VOLTAGE, PowRecord.getVoltageRMS());
            break;
        case 1:
            Channels[Channel].setFieldData(FIELD_CURRENT, PowRecord.getCurrentRMS());
            break;
        case 2:
            Channels[Channel].setFieldData(FIELD_APPARENT, PowRecord.getApparentPower());
            break;
        case 3:
            Channels[Channel].setFieldData(FIELD_REAL, PowRecord.getRealPower());
            break;
        case 4:
            Channels[Channel].setFieldData(FIELD_FACTOR, PowRecord.getPowerFactor());
            break;
        case 5:
            Channels[Channel].setFieldData(FIELD_TEMPERATURE, TempRecord.getTemperature());
            break;
        case 6:
            Channels[Channel].setFieldData(FIELD_HUMIDITY, TempRecord.getHumidity());
            break;
        default:
            return 0;
    }  
    return 1;  
}

int WifiHandler::updateChannel(long Channel, PowerModule& PowRecord, TemperatureSensor& TempRecord){
  if(PowRecord.getVoltageRMS()>=260 || PowRecord.getVoltageRMS()<=100){return 0;}
    Channels[Channel].setFieldData(FIELD_VOLTAGE, PowRecord.getVoltageRMS());
    Channels[Channel].setFieldData(FIELD_CURRENT, PowRecord.getCurrentRMS());
    Channels[Channel].setFieldData(FIELD_APPARENT, PowRecord.getApparentPower());
    Channels[Channel].setFieldData(FIELD_REAL, PowRecord.getRealPower());
    Channels[Channel].setFieldData(FIELD_FACTOR, PowRecord.getPowerFactor());
    Channels[Channel].setFieldData(FIELD_TEMPERATURE, TempRecord.getTemperature());
    Channels[Channel].setFieldData(FIELD_HUMIDITY, TempRecord.getHumidity());
   return 1;
}

void WifiHandler::debugPrint(long Channel){
    Serial.print("[V]");
    Serial.print(Channels[Channel].getFieldData(FIELD_VOLTAGE));
    Serial.print(", [C]");
    Serial.print(Channels[Channel].getFieldData(FIELD_CURRENT));
    Serial.print(", [A]");
    Serial.print(Channels[Channel].getFieldData(FIELD_APPARENT));
    Serial.print(", [R]");
    Serial.print(Channels[Channel].getFieldData(FIELD_REAL));
    Serial.print(", [F]");
    Serial.print(Channels[Channel].getFieldData(FIELD_FACTOR));
    Serial.print(", [T]");
    Serial.print(Channels[Channel].getFieldData(FIELD_TEMPERATURE));
    Serial.print(", [H]");
    Serial.print(Channels[Channel].getFieldData(FIELD_HUMIDITY));
    Serial.print(", [XX]");
    Serial.println(Channels[Channel].getFieldData(8));
}
