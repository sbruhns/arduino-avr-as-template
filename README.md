# arduino-avr-as-template

Basic template for getting started with bare metal GNU Assembler development on arduino uno

## Build main.hex from main.s

```
make build
```

## Flash main.hex to arduino uno

make sure to update the port the arduino uno is attached to your system in the `Makefile` in that line:

```
PROGRAMMER = -v -patmega328p -carduino -P/dev/cu.usbmodem142201 -b115200 -D
```

Run:

```
make flash
```

## build and flash

```
make
```

## Accessing Registers 

Registers like PORTB, DDRB ... are mapped to the beginning of the memory the adresses can be found in the [datasheet](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf)

main.s contains some example on accessing the PORTB to make the onboard pin blink

```
; register memory mapping (check datasheet)
.equiv PORTB, 0x05
.equiv DDRB, 0x04
.equiv PINB, 0x03

...

out PORTB,r16
```
