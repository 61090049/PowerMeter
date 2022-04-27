#include <WiFi.h>

// Replace with your SSID and Password
const char* ssid     = "TomatoS85";
const char* password = "5l34zb49";

// Replace with your unique Thing Speak WRITE API KEY
const char* apiKey = "1QUZAWHXA71D5CKC";

const char* resource = "/update?api_key=";

// Thing Speak API server 
const char* server = "api.thingspeak.com";

unsigned long global_tim;

void setup() {
  // Initializing serial port for debugging purposes
  Serial.begin(115200);
  delay(10);

  initWifi();
}

void loop() {
  makeHTTPRequest();
  delay(10000);
}

// Establish a Wi-Fi connection with your router
void initWifi() {
  Serial.print("New Connecting to: "); 
  Serial.print(ssid);
  WiFi.begin(ssid, password);  

  int timeout = 10 * 4; // 10 seconds
  while(WiFi.status() != WL_CONNECTED  && (timeout-- > 0)) {
    delay(250);
    Serial.print(".");
  }
  Serial.println("");

  if(WiFi.status() != WL_CONNECTED) {
     Serial.println("Failed to connect, going back to sleep");
  }

  Serial.print("WiFi connected in: "); 
  Serial.print(millis());
  Serial.print(", IP address: "); 
  Serial.println(WiFi.localIP());
}

// Make an HTTP request to Thing Speak
void makeHTTPRequest() {
  global_tim = millis();
  // Sensor readings may also be up to 2 seconds 'old' (its a very slow sensor)
  int data_int = global_tim;
  // Read temperature as Celsius (the default)
  float data_float = global_tim/100;

  // Comment the next line, if you prefer to use Fahrenheit   
  static char str_int[7];
  static char str_float[7];
     
  dtostrf(data_int, 6, 2, str_int);
  dtostrf(data_float, 6, 2, str_float);
  
  Serial.print("Connecting to "); 
  Serial.print(server);
  
  static WiFiClient client;
  int retries = 5;
  while(!!!client.connect(server, 80) && (retries-- > 0)) {
    Serial.print(".");
  }
  Serial.println();
  if(!!!client.connected()) {
     Serial.println("Failed to connect.");
  }
  
  Serial.print("Request resource: "); 
  Serial.println(resource);
  client.print(String("GET ") + resource + apiKey + "&field1=" + str_int + "&field2=" + str_float +
                  " HTTP/1.1\r\n" +
                  "Host: " + server + "\r\n" + 
                  "Connection: close\r\n\r\n");
                  
  int timeout = 5 * 10; // 5 seconds             
  while(!!!client.available() && (timeout-- > 0)){
    delay(100);
  }
  if(!!!client.available()) {
     Serial.println("No response, going back to sleep");
  }
  while(client.available()){
    Serial.write(client.read());
  }
  
  Serial.println("\nclosing connection");
  client.stop();
}
