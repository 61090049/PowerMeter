#ifndef WIFI_HANDLER
#define WIFI_HANDLER

/*
Channels are handled via number 0->6.   (Hardware ports, thingspeak free package offers 4.)
Fields are handled via number 1->8.     (Total of 8 data fields, thingspeak's limit.)
*/

#include <inttypes.h>
#include <WiFi.h>
#include <ThingSpeak.h>
#include "Channel.h"
#include "Credential.h"
#include "PowerModule.h"
#include "TemperatureSensor.h"

#define MAX_CHANNEL_COUNT 7
#define CHANNEL_COUNT 2
#define MAX_SSID_LEN 34
#define MAX_PWD_LEN 65
#define MAX_API_KEY_LEN

class WifiHandler{
    private:
        char HostSSID[MAX_SSID_LEN];
        char HostPWD[MAX_PWD_LEN];

        const char* ssid;
        const char* pass;
        const char* UrlQuery;
        const char* UrlDomain;
        //char WriteAPIKey[MAX_API_KEY_LEN];
        //char ReadAPIKey[MAX_API_KEY_LEN];
        Channel Channels[MAX_CHANNEL_COUNT];

    public:
        WifiHandler();
        int ConnectWifi();
        void setHostSSID(char NewSSID[MAX_SSID_LEN]);
        void setHostPWD(char NewPWD[MAX_PWD_LEN]);
        float getFloatData(long Channel, unsigned int Field);
        long getLongData(long Channel, unsigned int Field);
        int getIntData(long Channel, unsigned int Field);
        int isReadError();
        int isWriteError(int err);
        int pushData(long Channel, unsigned int Field, float Data); //Upload data from manual input.
        int pushField(long Channel, unsigned int Field); //Upload data from specific internal records.
        int pushChannel(long Channel);
        int updateField(long Channel, unsigned int Field, PowerModule& PowRecord, TemperatureSensor& TempRecord);
        int updateChannel(long Channel, PowerModule& PowRecord, TemperatureSensor& TempRecord);
        
        void debugPrint(long Channel);
        double debugGetChannelField(long Channel, unsigned int Field){return Channels[Channel].getFieldData(Field);}
};
#endif
