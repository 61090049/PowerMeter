from machine import Pin, Timer, UART
import utime, _thread

class WifiModule:

    FETCH_RX_MS = 500
    MAX_RECORD_COUNT = 100
    
    _timer = None
    _record = []

    def __init__(self, tx, rx):
        self._uart_1 = UART(1, baudrate = 115200, rx= Pin(rx), tx = Pin(tx), timeout = 2000)
        self._start_rx()

    def _start_rx(self):
        '''
        self._timer = Timer(mode = Timer.PERIODIC,
        callback = self._uart_rx_fetch,
        period = self._FETCH_RX_MS)
        '''
        _thread.start_new_thread(self._uart_rx_fetch, ())

    def _uart_rx_fetch(self):
        while True:
            self.depopulation()
            byte_s = self._uart_1.read(1)
            if byte_s != None:
                self._record.append(byte_s.decode("utf-8"))
    
    def send_tx(self, message):
        self._uart_1.write(message + "\r\n")
        
    def is_overpopulate(self):
        if len(self._record) >= self.MAX_RECORD_COUNT: return True
        else: return False
    
    def depopulation(self):
        if self.is_overpopulate():
            last_msg = self.get_latest_message()
            self._record = []
            self._record.append(last_msg)
    
    def get_latest_message(self):
        if self._record:
            return self._record[-1]
        else: return None

