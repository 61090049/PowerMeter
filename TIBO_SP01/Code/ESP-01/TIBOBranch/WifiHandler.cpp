#include "WifiHandler.h"

#define WFI_RETRY_COUNT 5
#define WFI_RETRY_DELAY 500
#define REQ_RETRY_COUNT 5
#define REQ_RETRY_DELAY 500

char HostSSID[33];
char HostPWD[64];

const char* UrlQuery = "/update?api_key=";
const char* UrlDomain = "api.thingspeak.com";
char WriteAPIKey[17];
char ReadAPIKey[17];

WiFiClient ClientHandler;

WifiHandler::WifiHandler(char Ssid[33],
 char Password[64], char WKey[17], char RKey[17]){
    setHostSSID(Ssid);
    setHostPWD(Password);
    setWriteAPIKey(WKey);
    setReadAPIKey(RKey);

    ThingSpeak.begin(ClientHandler);
    ConnectWifi();
}

int WifiHandler::ConnectWifi(){
    int _wfi_retry = 0;
    while((WiFi.status() != WL_CONNECTED) &&
     (_wfi_retry <= WFI_RETRY_COUNT)){
        WiFi.begin(HostSSID, HostPWD);
        delay(WFI_RETRY_DELAY);
        _wfi_retry++;
     }
    if(WiFi.status() != WL_CONNECTED){
        return -1;
    }
    return 0;
}

void WifiHandler::setHostSSID(char NewSSID[33]){
    strcpy(HostSSID, NewSSID);
}

void WifiHandler::setHostPWD(char NewPWD[64]){
    strcpy(HostPWD, NewPWD);
}

void WifiHandler::setWriteAPIKey(char NewWriteAPIKey[17]){
    strcpy(WriteAPIKey, NewWriteAPIKey);
}

void WifiHandler::setReadAPIKey(char NewReadAPIKey[17]){
    strcpy(ReadAPIKey, NewReadAPIKey);
}

float WifiHandler::getFloatData(long Channel, unsigned int Field){
    ConnectWifi();
    float _read_float = ThingSpeak.readFloatField(Channel, Field, ReadAPIKey);
    if(!isReadError()){return _read_float;}
}

long WifiHandler::getLongData(long Channel, unsigned int Field){
    ConnectWifi();
    float _read_long = ThingSpeak.readLongField(Channel, Field, ReadAPIKey);
    if(!isReadError()){return _read_long;}
}

int WifiHandler::getIntData(long Channel, unsigned int Field){
    ConnectWifi();
    float _read_int = ThingSpeak.readIntField(Channel, Field, ReadAPIKey);
    if(!isReadError()){return _read_int;}
}

int WifiHandler::isReadError(){
    int _error_code = 0;
    _error_code = ThingSpeak.getLastReadStatus();
    if(_error_code == 200){return 0;}
    else{return -1;}
}

int WifiHandler::isWriteError(int err){
    if(err == 200){return 0;}
    else{return -1;}
}

int WifiHandler::setData(long Channel, unsigned int Field, float Data){
    ConnectWifi();
    if(isWriteError(ThingSpeak.writeField(Channel, Field, Data, WriteAPIKey))){
        return -1;
    }
    else {return 0;}
}

int WifiHandler::setDataList(long Channel,
                unsigned int Fd_1, float Dt_1, 
                unsigned int Fd_2, float Dt_2){
    ConnectWifi();
    ThingSpeak.setField(Fd_1, Dt_1);
    ThingSpeak.setField(Fd_1, Dt_2);
    if(isWriteError(ThingSpeak.writeFields(Channel, WriteAPIKey))){
        return 0;
    }
    else {return -1;}
}
