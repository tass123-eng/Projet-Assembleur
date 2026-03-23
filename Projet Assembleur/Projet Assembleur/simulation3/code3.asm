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

boucle 
       movlw b'10101010' ; Allumer les LEDs pairs
       movwf PORTC
       call delay
       movlw b'01010101' ; Allumer les LEDs impairs
       movwf PORTC
       call delay
       goto boucle

delay  movlw d'50' ; Ajuster le délai selon vos besoins
loop   decfsz 0x20,f
       goto loop
       return

end
