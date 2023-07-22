import machine
import time

keypad_rows = [machine.Pin(pin, machine.Pin.IN, machine.Pin.PULL_UP) for pin in (13, 12, 14, 27)]
keypad_cols = [machine.Pin(pin, machine.Pin.OUT) for pin in (26, 25, 33, 32)]

# Define the labels for each button on the keypad
keypad_labels = [
    "1", "2", "3", "A",
    "4", "5", "6", "B",
    "7", "8", "9", "C",
    "*", "0", "#", "D"
]


key_pressed = False

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
    input_text = ""
    while True:
        key = read_keypad(keypad_rows, keypad_cols, keypad_labels)
        if key != None and not key_pressed:
            if key == "#":
                print(input_text)
                break
            elif key == "*":
                input_text = ""
            elif key =="A":
                input_text = input_text[:-1]
                print(input_text)
            else:
                input_text += key
                print(input_text)
            key_pressed = True
        elif key == None:
            key_pressed = False
    return input_text