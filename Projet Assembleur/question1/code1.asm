#include <p16F877.inc>

ORG 0x00

BSF STATUS, RP0 ; bank 1
BCF STATUS, RP1

MOVLW b'00000000'
MOVWF TRISC ; sortie=port C 

BCF STATUS, RP0 ; bank 0
MOVLW b'00000001'
MOVWF PORTC ; configurer le bit 0 du port C
End