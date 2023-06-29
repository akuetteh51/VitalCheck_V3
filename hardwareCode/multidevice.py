
from time import sleep as sl
from hx711 import HX711
from  hcsr04 import HCSR04
from max30102 import MAX30102, MAX30105_PULSE_AMP_MEDIUM
from machine import sleep, SoftI2C, Pin, Timer 
from utime import ticks_diff, ticks_us
import urequests as request
import ujson

led = Pin(2, Pin.OUT)

#Connecting to network




import os
import ujson
import time
import network




ssid="V2026"
passcode="askme1234"
wlan = network.WLAN(network.STA_IF)
wlan.active(True)
if not wlan.isconnected():
    wlan.connect(ssid, passcode)
    print("Waiting for Wi-Fi connection", end="...")
    while not wlan.isconnected():
        print(".", end="")
        time.sleep(1)
    print('network config:', wlan.ifconfig())


#####################################################################



# Api Endpoint#


# def api_GET():
#     try:
#         req=request.get("https://compellingly-sunny-velocity-vacuum-dev.wayscript.cloud/api/sensorData")
#         req.close()

#     #     print(req.json(),print(req.status_code))
#         return req.json(),req.status_code
#     except:
#         return "error connecting to api"
    
def api_POST(Sensor_data={}):
    headers = {
  'Content-Type': 'application/json',
  'Cookie': 'AWSALB=PdEpC2x0cvbX2wzBd0QtheoBSoDF/1x5KfJn0b3OH8OaiY9tealXtkzwcX8WXBPz90nsFDIYIEER53QVk7jpH7ZTmnTqqHqqSKDBXg9+A0UdNGzB3IDimbNZlaa5; AWSALBAPP-0=AAAAAAAAAAD9NdiLwsYd3p/m9qLDtIDS+GKRX2XqsF7vIOY4Gntro4ImQDEaa8lUv4CYrx6dH/lPrPwYRBI3JVHZRnaMmdQ6HA37siQ/iTQfCvMe+mNbWp381z2M5yguGG+MQUlOXXCkyVI=; AWSALBAPP-1=_remove_; AWSALBAPP-2=_remove_; AWSALBAPP-3=_remove_; AWSALBCORS=PdEpC2x0cvbX2wzBd0QtheoBSoDF/1x5KfJn0b3OH8OaiY9tealXtkzwcX8WXBPz90nsFDIYIEER53QVk7jpH7ZTmnTqqHqqSKDBXg9+A0UdNGzB3IDimbNZlaa5; _wayscript_session=711dc1de-206a-4b76-9a11-bbf909277248.2zuETP5NJ4_7BFKJkjOaAAN_oSw'
}

    sensor_data=ujson.dumps(Sensor_data)
    try:
        req=request.post("https://compellingly-sunny-velocity-vacuum-dev.wayscript.cloud/api/sensor_data",headers=headers,data=sensor_data)
        req.close()

        print(req.status_code)
        return req.json(),req.status_code
    except:
        return "error connecting to api"









###################################
MAX_HISTORY = 32
history = []
beats_history = []
beat = False
beats = 0
    
i2c = SoftI2C(sda=Pin(21),scl=Pin(22),freq=400000)
sensor = MAX30102(i2c=i2c)  # An I2C instance is required

# Scan I2C bus to ensure that the sensor is connected
if sensor.i2c_address not in i2c.scan():
    print("Sensor not found.")
    
elif not (sensor.check_part_id()):
    # Check that the targeted sensor is compatible
    print("I2C device ID not corresponding to MAX30102 or MAX30105.")
    
else:
    print("Sensor connected and recognized.")


sensor.setup_sensor()
sensor.set_sample_rate(400)
sensor.set_fifo_average(8)
sensor.set_active_leds_amplitude(MAX30105_PULSE_AMP_MEDIUM)
sensor.set_led_mode(2)
sleep(1)

t_start = ticks_us()  # Starting time of the acquisition  


def get_max30102_values():
   
    global history
    global beats_history
    global beat
    global beats
    global t_start

    sensor.check()
    
    # Check if the storage contains available samples
    if sensor.available():
        # Access the storage FIFO and gather the readings (integers)
        red_reading = sensor.pop_red_from_storage()
        ir_reading = sensor.pop_ir_from_storage()
        
        value = red_reading
        history.append(value)
        # Get the tail, up to MAX_HISTORY length
        history = history[-MAX_HISTORY:]
        minima = 0
        maxima = 0
        threshold_on = 0
        threshold_off = 0

        minima, maxima = min(history), max(history)

        threshold_on = (minima + maxima * 3) // 4   # 3/4
        threshold_off = (minima + maxima) // 2      # 1/2
        
        
        if value > 1000:
            if not beat and value > threshold_on:
                beat = True 
                                
                led.on()
                
                t_us = ticks_diff(ticks_us(), t_start)
                t_s = t_us/1000000
                f = 1/t_s
            
                bpm = f * 60
                
                if bpm < 500:
                    t_start = ticks_us()
                    beats_history.append(bpm)                    
                    beats_history = beats_history[-MAX_HISTORY:] 
                    beats = round(sum(beats_history)/len(beats_history) ,2) 
                    print(api_POST(Sensor_data={"bmp": beats,
            "height": controller.height(),
            "temperature": round(sensor.read_temperature(),2),
            "weight": controller.weight(),
            "sensor_id":1}))
                    controller.led()
                    print(controller.weight())
                    print(controller.height()) 
                                                    
            if beat and value< threshold_off:
                beat = False
                led.off()
            
        else:
            led.off()
            controller.led_off()
            print('No finger')
            beats = 0.00
    return str(beats),str(round(sensor.read_temperature(),2))



class control(object):
    def __init__(self,scl=22,sda=21,dout=27,pd_sck=25,pin_rx=0,pin_tx=0,pin_led=18,pin_buzzer=33,trig=18,echo=19):
        self.scl=Pin(scl)
        self.sda=Pin(sda)
        self.dout=dout
        self.pd_sck=pd_sck
        self.pin_rx=Pin(pin_rx)
        self.pin_tx=Pin(pin_tx)
        self.pin_led=Pin(pin_led,Pin.OUT)
        self.pin_buzzer=Pin(pin_buzzer,Pin.OUT)
        self.trig =trig
        self.echo =echo
        self.hx = HX711(self.dout,self.pd_sck)
        self.xvar=0
        self.ultrasonic=HCSR04(trigger_pin=self.trig,echo_pin=self.echo,echo_timeout_us=1000000)
    
    
        
    def led(self):
        self.pin_buzzer.on()
        print("On")
    def led_off(self):
        self.pin_buzzer.off()
        print("Off")



    


#hx.set_scale(48.36)

    def weight(self):   
        self.hx.tare()
        self.hx.set_scale(48.36)
        read=self.hx.read()
        average=self.hx.read_average()
        value=self.hx.get_units(3)
        
        if self.xvar ==0:
            self.xvar=value
        # output=float(value) -float(self.xvar)
        # print('loop 5: ',read)
        # print('loop 40: ',average)
        # print('kg :',value,'->',output)
        
        
        print('-----------------------------')
        return round(value,2)
    #     val = hx.get_units(5)
    #     print(val)

    def height(self):
        distance=self.ultrasonic.distance_cm()
        distance_feet=distance*0.03280840

        return round(distance_feet,2)


controller=control()
while True:
    
     print(get_max30102_values())
#     print(controller.height())
