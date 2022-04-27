#include "WifiHandler.h"
#include "Credential.h"

#define DELAY_THINGSPEAK 5000
#define DELAY_DEBUG 1000
#define SMALL_MESSAGE_LEN 8
#define LARGE_MESSAGE_LEN 24

WifiHandler WifiUnit(SSID,PASS,WRITE_KEY,READ_KEY);
char current[SMALL_MESSAGE_LEN]={0};
char power[SMALL_MESSAGE_LEN]={0};
int relay_state=0;

void setup() {
  Serial.begin(115200);
  delay(10);
}

void read_from_pico(){
  char _byt;
  char* _target;

  while(Serial.available()>0){
    _byt = Serial.read();
    if (_byt == 'X' || _byt == 'P'){
      _target = (_byt == 'X') ? power : current;
      for(int i = 0; i<SMALL_MESSAGE_LEN-1;i++){
        _byt = Serial.read();
        if(_byt == 'x' || _byt == 'p'){break;}
        _target[i] = _byt;
      }
      _target[SMALL_MESSAGE_LEN - 1] = '\0';
      break;
    }
    delay(1);
  }
  /*
  Serial.print("\n->");
  Serial.print(Serial.available());
  Serial.print("\n->");
  Serial.print(current);
  Serial.print("\n->");
  Serial.print(power);
  Serial.print("\nX-");
  */
}

void send_to_pico(){
  char _value = relay_state+'0';
  Serial.print(relay_state);
}

void loop(){
  //Serial.print("A");
  
  relay_state = WifiUnit.getIntData(atoi(CHANNEL), 3);
  //Serial.print("B");
  if(relay_state<0 || relay_state >1){
    relay_state = 0;
  }
  //Serial.print("C");
  send_to_pico();
  
  //Serial.print("D");
  
  read_from_pico();
  //Serial.print("E");

  WifiUnit.setData(atoi(CHANNEL),1,atof(current)); //current
  //Serial.print("F");
  WifiUnit.setData(atoi(CHANNEL),2,atof(power)); //power

  //Serial.print("G");
  
  delay(DELAY_DEBUG);
  //Serial.print("H");
  
}
