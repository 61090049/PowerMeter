#include "Channel.h"
#include <cstring>

Channel::Channel(char ID[KEY_LEN], char WriteKey[KEY_LEN], char ReadKey[KEY_LEN]){
    setChannelID(ID);
    setWriteAPIKey(WriteKey);
    setReadAPIKey(ReadKey);
}

void Channel::setChannelID(char NewChannelID[KEY_LEN]){
    strcpy(ChannelID, NewChannelID);
}

void Channel::setWriteAPIKey(char NewWriteAPIKey[KEY_LEN]){
    strcpy(WriteAPIKey, NewWriteAPIKey);
}

void Channel::setReadAPIKey(char NewReadAPIKey[KEY_LEN]){
    strcpy(ReadAPIKey, NewReadAPIKey);
}

void Channel::setFieldData(int FieldID, float Data){
    if(FieldID <= 8 && FieldID >=1){
        Fields[FieldID - 1] = Data;
    }
}