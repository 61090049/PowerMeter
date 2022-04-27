from machine import Pin, Timer, ADC
import utime, math

# Set _VOLTAGE_CONSTANT manually for each country, default is 220.
# The function get_record() returns a list[n] of list[3]; timestamp, Irms, apparent power.

class CurrentSensor5A:

    _FETCH_ADC_MS = 200
    _SAMPLE_CONSTANT = 50
    _VOLTAGE_CONSTANT = 220

    _ct_1 = None
    _timer = None
    _record = []
    _rec_raw_i = []

    def __init__(self, ct_1):
        self._ct_1 = ADC(ct_1)
        
    def _flush_temp_rec(self):
        self._rec_raw_i.clear()
    
    def get_record(self) -> []:
        return self._record 

    def get_raw_current(self):
        return utime.time(), self._ct_1.read_u16()
    
    def _populate_temp_rec(self):
        self._rec_raw_i.append(self.get_raw_current())
    
    def _calc_rms(self):
        current_sum = 0
        for item in self._rec_raw_i:
            current_sum += item[1]**2
        return self._rec_raw_i[int((self._SAMPLE_CONSTANT-1)/2)][0], math.sqrt(current_sum/self._SAMPLE_CONSTANT)
    
    def readable(self, raw):
        return (raw/65536 - 0.5)*5
    
    def _update_readings(self, timer):
        if len(self._rec_raw_i) < self._SAMPLE_CONSTANT:
            self._populate_temp_rec()
        else:
            irms_now = self._calc_rms()
            self._record.append([utime.localtime(irms_now[0])[0:-2], self.readable(irms_now[1]), self.readable(irms_now[1]) * self._VOLTAGE_CONSTANT])
            self._flush_temp_rec()

    def start_fetcher(self):
        self._timer = Timer(mode = Timer.PERIODIC,
         callback = self._update_readings,
         period = self._FETCH_ADC_MS)

    def stop_fetcher(self):
        self._timer.deinit()

    
