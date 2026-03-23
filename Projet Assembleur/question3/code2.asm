#include <p16F877.inc>

ORG 0x00

COMPT EQU 0x0c

BSF STATUS, RP0 ; bank 1
BCF STATUS, RP1

MOVLW  b'00000000'
MOVWF TRISC ; sortie= port C 

BCF STATUS, RP0 ; bank 0
MOVLW  b'00000000'
MOVWF PORTC ; configurer tous bites de port C en 0

CALL ATTENDRE1

boucle
MOVLW  b'00000001'
MOVWF PORTC ; configurer le bit 0 du port C en 1
CALL ATTENDRE1
MOVLW  b'00000010'
MOVWF PORTC ; configurer le bit 1 du port C en 1
CALL ATTENDRE1
MOVLW b'00000100'
MOVWF PORTC ; configurer le bit 2 du port C en 1
CALL ATTENDRE1
MOVLW b'00001000'
MOVWF PORTC ; configurer le bit 3 du port C en 1
CALL ATTENDRE1
MOVLW b'00010000'
MOVWF PORTC ; configurer le bit 4 du port C en 1
CALL ATTENDRE1
MOVLW b'00100000'
MOVWF PORTC ; configurer le bit 5 du port C en 1
CALL ATTENDRE1
MOVLW b'01000000'
MOVWF PORTC ; configurer le bit 6 du port C en 1
CALL ATTENDRE1
MOVLW b'10000000'
MOVWF PORTC ; configurer le bit 7 du port C en 1
CALL ATTENDRE1
GOTO boucle

ATTENDRE1
MOVLW 0x0F
MOVWF  COMPT
ATTENDRE2
DECFSZ  COMPT, F
GOTO ATTENDRE2
RETURN

End
