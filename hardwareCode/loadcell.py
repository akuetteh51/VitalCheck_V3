# Library for straight bar load cell

from machine import ADC
import time

class StraightBarLoadCell:
    def __init__(self, pin):
        self.adc = ADC(pin)
        self.calibration_factor = 1

    def get_raw_value(self):
        return self.adc.read()

    def get_weight(self):
        raw_value = self.get_raw_value()
        weight = raw_value / 1023 * 5 / self.calibration_factor
        return weight

    def set_calibration_factor(self, factor):
        self.calibration_factor = factor

# Sample code to test the library

load_cell = StraightBarLoadCell(0)  # initialize the load cell on ADC pin 0
load_cell.set_calibration_factor(0.75)  # set the calibration factor to 0.75

while True:
    weight = load_cell.get_weight()  # get the weight reading
    print("Weight: ", weight, "kg")  # print the weight to the console
    time.sleep(1)  # wait for 1 second before taking the next reading

    #The StraightBarLoadCell class initializes an ADC object with the specified pin, and provides methods to get the raw value and the weight in kilograms, based on the calibration factor. Th