import machine
import time

# ... (existing code for SPI, TFT display, and other constants) ...

# Initialize SPI bus and TFT display
spi = machine.SPI(2, baudrate=SPI_BAUDRATE, polarity=0, phase=0, bits=8,
                  firstbit=machine.SPI.MSB, sck=machine.Pin(SPI_SCK),
                  mosi=machine.Pin(SPI_MOSI), miso=machine.Pin(SPI_MISO))

display = Display(spi, cs=machine.Pin(SPI_CS), dc=machine.Pin(SPI_DC),
                  rst=machine.Pin(SPI_RST), width=TFTHEIGHT, height=TFTWIDTH, rotation=90)

graphics = gfx.GFX(320, 240, display.draw_pixel)
unispace = XglcdFont('fonts/Unispace12x24.c', 12, 24)


def fill_rect(x, y, width, height, color):
    display.fill_rectangle(x, y, x + width - 1, y + height - 1, color)

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
    input_text = key_value()  # Get user input from the keypad
    display.draw_text(80, 112, input_text, unispace, WHITE, color)
    time.sleep(0.2)  # Delay to avoid capturing multiple key presses

# Main loop
fill_screen(WHITE)
while True:
    message_box()
    main_fun(get_max30102_values()[0], get_max30102_values()[1],
             get_max30102_values()[2], get_max30102_values()[3])
