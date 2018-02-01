[BITS 32]
[ORG 0X7C00]

MOV SI, BOOTLOADERSTR
CALL PrintString
JMP $

PrintCharacter:
MOV AH, 0X0E
MOV BH, 0X00
MOV BL, 0X07

INT 0X10
RET

PrintString
next_character:
MOV AL, [SI]
INC SI
OR AL, AL
JZ exit_function
CALL PrintCharacter
exit_function
RET

;Data
BOOTLOADERSTR db 'Deepak JOSHI' , 0

TIMES 510 - ($ - $$) db 0
DW 0XAA55
