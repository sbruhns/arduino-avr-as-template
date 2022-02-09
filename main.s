; register memory mapping (check data sheet)
.equiv PORTB, 0x05
.equiv DDRB, 0x04
.equiv PINB, 0x03

.equiv RAMEND, 0x8ff
.equiv SREG, 0x3f
.equiv SPL, 0x3d
.equiv SPH, 0x3e

.org 0
   rjmp main

main:
   ldi r17,0
   out SREG,r17 ; init stack
   ldi r17,lo8(RAMEND)
   out SPL,r17
   ldi r17,hi8(RAMEND)
   out SPH,r17

   ldi r17,0x20
   out DDRB,r17

   clr r16
mainloop:
   eor r16,r17
   out PORTB,r16
   call sleep
   rjmp mainloop

sleep:
   push r16
   push r17
   push r18

   ldi r16,0x00
   ldi r17,0x00
   ldi r18,0x20
loop:
   dec r16
   brne loop
   dec r17
   brne loop
   dec r18
   brne loop

   pop r18
   pop r17
   pop r16
   ret
