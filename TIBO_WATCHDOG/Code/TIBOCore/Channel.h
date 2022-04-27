#ifndef THINGSP_CHANNEL
#define THINGSP_CHANNEL

#define KEY_LEN 17
#define FIELD_COUNT 8

#include <stdlib.h>

class Channel{
    private:
        char ChannelID[KEY_LEN];
        char WriteAPIKey[KEY_LEN];
        char ReadAPIKey[KEY_LEN];
        float Fields[FIELD_COUNT];
    public:
        Channel(char ID[KEY_LEN] = "", char WriteKey[KEY_LEN] = "", char ReadKey[KEY_LEN] = "");

        void setChannelID(char NewChannelID[17]);
        void setWriteAPIKey(char NewWriteAPIKey[17]);
        void setReadAPIKey(char NewReadAPIKey[17]);
        void setFieldData(int FieldID, float Data);

        unsigned long getChannelID(){return atol(ChannelID);}
        const char* getWriteAPIKey(){return WriteAPIKey;}
        const char* getReadAPIKey(){return ReadAPIKey;}
        float getFieldData(int FieldID){return Fields[FieldID - 1];}
};
#endif
