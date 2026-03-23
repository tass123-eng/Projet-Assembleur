#include <p16f877.inc>

__CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _HS_OSC

org 0x00
goto start

org 0x04
start:
       bsf STATUS,RP0 
       bcf STATUS,RP1
       movlw b'00000000'
       movwf PORTC   
       bcf OPTION_REG,NOT_RBPU 
        bcf STATUS,RP0 
boucle1 movlw b'11000000'
        movwf PORTC
        goto boucle2

boucle2 movlw b'00110000'
        movwf PORTC 
        goto boucle3

boucle3 movlw b'00001100'
        movwf PORTC
        goto boucle4
boucle4 movlw b'00000011'
        movwf PORTC
        goto boucle1
end