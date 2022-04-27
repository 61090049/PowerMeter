#ifndef WIFI_HANDLER
#define WIFI_HANDLER

#include <inttypes.h>
#include <ESP8266WiFi.h>
#include <ThingSpeak.h>
#include "Credential.h"

class WifiHandler{
    private:
        char HostSSID[33];
        char HostPWD[64];

        const char* UrlQuery;
        const char* UrlDomain;
        char WriteAPIKey[17];
        char ReadAPIKey[17];

    public:
        WifiHandler(char Ssid[33], char Password[64], char WKey[17], char RKey[17] = "");
        int ConnectWifi();
        void setHostSSID(char NewSSID[33]);
        void setHostPWD(char NewPWD[64]);
        void setWriteAPIKey(char NewWriteAPIKey[17]);
        void setReadAPIKey(char NewReadAPIKey[17]);
        float getFloatData(long Channel, unsigned int Field);
        long getLongData(long Channel, unsigned int Field);
        int getIntData(long Channel, unsigned int Field);
        int isReadError();
        int isWriteError(int err);
        int setData(long Channel, unsigned int Field, float Data);
        int setDataList(long Channel,
                unsigned int Fd_1, float Dt_1, 
                unsigned int Fd_2, float Dt_2);
};
#endif
