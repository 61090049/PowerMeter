from machine import Pin, Timer
import utime

# Initialize with at least one GPIO pin for the relay control.
# Toggle the relay on and off with [target = P] line, P being the channel (0/1).
# Set the alarm in P, seconds, and event to call.

class  RelayModule2CH:
    
    _OP_DELAY_MS = 1000

    _channel = []
    _timer = None
    _current_sel = None

    def __init__(self, relay_1, relay_2 = None):
        self._channel.append(Pin(relay_1, Pin.OUT))
        if relay_2 != None:
            self._channel.append(Pin(relay_2, Pin.OUT))
    
    def turn_off(self, target):
        if type(target) == int and self._is_active(target):
            self._channel[target].value(0)
        elif type(target) == Timer and self._is_active(self._current_sel):
            self._channel[self._current_sel].value(0)
            self.unset_alarm()
        utime.sleep_ms(self._OP_DELAY_MS)

    def turn_on(self, target):
        if type(target) == int and self._is_active(target):
            self._channel[target].value(1)
        elif type(target) == Timer and self._is_active(self._current_sel):
            self._channel[self._current_sel].value(1)
            self.unset_alarm()
        utime.sleep_ms(self._OP_DELAY_MS)

    def toggle_pin(self, target):
        if type(target) == int and self._is_active(target):
            self._channel[target].toggle()
        elif type(target) == Timer and self._is_active(self._current_sel):
            self._channel[self._current_sel].toggle()
            self.unset_alarm()
        utime.sleep_ms(self._OP_DELAY_MS)

    def set_alarm(self, target, duration, event_alarm):
        self._current_sel = target
        self._timer = Timer(mode = Timer.ONE_SHOT,
         callback = event_alarm,
         period = duration*1000)
    
    def unset_alarm(self):
        self._timer.deinit()

    def _is_active(self, target):
        if target != None:
            if self._channel[target] != None:
                return True
        return False
        


