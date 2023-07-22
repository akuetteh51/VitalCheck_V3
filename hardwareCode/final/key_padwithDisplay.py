import machine
import time

import gfx
from ili9341 import Display, color565
from xglcd_font import XglcdFont

# TFT display constants
TFTWIDTH = 240
TFTHEIGHT = 320

# SPI constants
SPI_BAUDRATE = 20000000
SPI_SCK = 18
SPI_MOSI = 23
SPI_MISO = 19
SPI_CS = 5
SPI_DC = 16
SPI_RST = 17

# Color constants
BLACK = 0x000000
WHITE = 0xFFFFFF
RED = 0xFF0000
GREEN = 0x00FF00
BLUE = 0x0000FF
# Initialize SPI bus and TFT display
spi = machine.SPI(2, baudrate=SPI_BAUDRATE, polarity=0, phase=0, bits=8,
                  firstbit=machine.SPI.MSB, sck=machine.Pin(SPI_SCK),
                  mosi=machine.Pin(SPI_MOSI), miso=machine.Pin(SPI_MISO))

display = Display(spi, cs=machine.Pin(SPI_CS), dc=machine.Pin(SPI_DC),
                  rst=machine.Pin(SPI_RST), width=TFTHEIGHT, height=TFTWIDTH, rotation=90)

graphics = gfx.GFX(320, 240, display.draw_pixel)
unispace = XglcdFont('fonts/Unispace12x24.c', 12, 24)

# Function to draw a filled rectangle
def fill_rect(x, y, width, height, color):
    display.fill_rectangle(x, y, x + width - 1, y + height - 1, color)

# Function to fill the screen with a color
def fill_screen(color):
    fill_rect(0, 0, TFTWIDTH, TFTHEIGHT, color)

# Function to show a message on the screen
def message(text, color=0x3E64FF):
    fill_rect(30, 50, 80, 200, color)
    display.draw_text(90, 70, text, unispace, WHITE, color)

# Function to show a message box on the screen and get user input
def message_box(text="Enter Number", color=0x3E64FF):
    fill_rect(30, 50, 80, 200, color)
    display.draw_text(80, 70, text, unispace, WHITE, color)
    display.draw_rectangle(75, 105, 170, 40, WHITE)
    display.draw_text(80, 112, input_text, unispace, WHITE, color)  # Display the current input text
    time.sleep(0.2)  # Delay to avoid capturing multiple key presses

keypad_rows = [machine.Pin(pin, machine.Pin.IN, machine.Pin.PULL_UP) for pin in (13, 12, 14, 27)]
keypad_cols = [machine.Pin(pin, machine.Pin.OUT) for pin in (26, 25, 33, 32)]

# Define the labels for each button on the keypad
keypad_labels = [
    "1", "2", "3", "A",
    "4", "5", "6", "B",
    "7", "8", "9", "C",
    "*", "0", "#", "D"
]

input_text = ""  # Initialize the input_text variable

def read_keypad(rows, cols, labels):
    for col in cols:
        col.value(0)
        for i, row in enumerate(rows):
            if row.value() == 0:
                col.value(1)
                return labels[i * 4 + cols.index(col)]
        col.value(1)
    return None

def key_value():
    global input_text
    key = read_keypad(keypad_rows, keypad_cols, keypad_labels)
    if key is not None and key != "#" and len(input_text) < 20:  # Limit input_text length to 20 characters
        if key == "*":
            input_text = ""
        elif key == "A":
            input_text = input_text[:-1]
        elif key in keypad_labels:
            input_text += key

if __name__ == "__main__":
    # Main loop
    fill_screen(WHITE)
    while True:
        message_box()
        key_value()
