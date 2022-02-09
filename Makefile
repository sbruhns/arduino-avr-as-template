DEVICE     = atmega328p
PROGRAMMER = -v -patmega328p -carduino -P/dev/cu.usbmodem142201 -b115200 -D

AVRDUDE = avrdude -p$(DEVICE) $(PROGRAMMER) 
COMPILE = avr-as -g -mmcu=$(DEVICE)
LINK = avr-ld

all: flash

build: main.hex

OBJECTS = main.o

main.hex: main.elf
	avr-objcopy -O ihex -R .eeprom $< $@

main.elf: $(OBJECTS)
	$(LINK) -o $@ $<

.s.o:
	avr-as -g -mmcu=atmega328p -o $@ $<

flash: build
	$(AVRDUDE) -U flash:w:main.hex:i

clean:
	rm -f main.hex main.elf $(OBJECTS)
