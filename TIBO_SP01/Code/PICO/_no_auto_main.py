from machine import Pin
import utime
from RelayModule import RelayModule2CH
from CTModule import CurrentSensor5A
from WirelessModule import WifiModule

def auto_test():
    Relay_Control = RelayModule2CH(2)
    Relay_Control.toggle_pin(0)
    duration = int(input("Relay Alarm Duration >> "))
    Relay_Control.set_alarm(0, duration, Relay_Control.toggle_pin)
    utime.sleep(duration+1)
    print("End Relay Test")

    Current_Sensor = CurrentSensor5A(26)
    Current_Sensor.start_fetcher()
    utime.sleep(12)
    Current_Sensor.stop_fetcher()
    print("------ Power Usage History ---------")
    print(Current_Sensor.get_record())
    print("End Current Sensor Test")

    Comm_Device = WifiModule(4, 5)
    Comm_Device.send_tx("AT")
    while True:
        Comm_Device.send_tx(input())
    print("exit successfully")
    
def main_function():
    RELAY_CHANNEL = 0
    GLOBAL_DELAY = 1000
    
    Relay_Control = RelayModule2CH(2)
    Current_Sensor = CurrentSensor5A(26)
    Current_Sensor.start_fetcher()
    Comm_Device = WifiModule(4, 5)
    Status_LED = Pin(25, Pin.OUT)
    
    Last_Comm_Message = ''
    
    utime.sleep_ms(2000)
    
    while True:
        Status_LED.toggle()
        message = Comm_Device.get_latest_message()
        
        if message != Last_Comm_Message:
            if message == '0':
                print("turn off")
                Relay_Control.turn_off(RELAY_CHANNEL)
                
            elif message == '1':
                print("turn on")
                Relay_Control.turn_on(RELAY_CHANNEL)
                
            Last_Comm_Message = message
            
        if Current_Sensor.get_record():
            latest_data = Current_Sensor.get_record()[-1]
            print(latest_data[1], end = 'A, ')
            print(latest_data[2], end = 'W\n')
            Comm_Device.send_tx('X'+str(latest_data[1])+'x')
            Comm_Device.send_tx('P'+str(latest_data[2])+'p')
        
        Status_LED.toggle()
        utime.sleep_ms(GLOBAL_DELAY)
        
main_function()