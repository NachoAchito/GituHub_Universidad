.org 50h
	pila:
.org 100h
	lxi H, pila
	sphl 

	LXI H, E000h
	JMP loop

.org 600h
	loop:
	JMP loop


.org 24h
	IN 00h
	MOV M, A
	INX H
	CPI 3Dh
	JZ guardar
	JMP loop

;Subrutina que guarda el valors de memoria als registres i escull l'operacio que es
;realitzara amb els valors dels registres
.org 200h
guardar:
	MOV B, H
	MOV C, L

	DCX B
	DCX B

	LDAX B
	SUI 30h
	MOV E, A

	DCX B
	DCX B
	LDAX B
	SUI 30h
	MOV D, A
	INX B

	LDAX B
	CPI 2Bh
	JZ suma
	CPI 2Dh
	JZ resta
	CPI 26h
	JZ and
	CPI 7Ch
	JZ or

;Subrutina que realitza la suma i comprova si hi ha overflow
.org 250h
suma:

	MOV A, D
	ADD E
	SUI Ah
	JP carry
	ADI 3Ah
	MOV M, A
	INX H

	MVI A, 3Bh
	MOV M, A
	INX H

	JMP loop

;Subrutina que gestiona el resultat si hi ha overflow
.org 300h
carry:
	MVI M, 31h
	INX H
	ADI 30h
	MOV M, A
	INX H

	MVI A, 3Bh
	MOV M, A
	INX H

	JMP loop


;Subrutina que fa la resta i es comprova si el resultat es positiu o negatiu
.org 350h
resta:
	MOV A, D
	SUB E
	JM signe

	ADI 30h
	MOV M, A
	INX H
	
	MVI A, 3Bh
	MOV M, A
	INX H

	JMP loop


;Subrutina que gestiona el resultat si dona negatiu
.org 400h
signe:
	MOV D, A
	MVI A, 0h
	SUB D
	ADI 30h
	MVI M, 2Dh
	INX H

	MOV M, A
	INX H

	MVI A, 3Bh
	MOV M, A
	INX H

	JMP loop

;Subrutina que realitza la operacio logica OR
.org 450h
or:
	MOV A, D
	ORA E
	SUI Ah
	JP carryor
	ADI 3Ah
	MOV M, A
	INX H

	MVI A, 3Bh
	MOV M, A
	INX H

	JMP loop

;Subrutina que gestiona el resultat de l'OR quan hi ha overflow
.org 500h
carryor:
	MVI M, 31h
	INX H
	ADI 30h
	MOV M, A
	INX H

	MVI A, 3Bh
	MOV M, A
	INX H

	JMP loop

;Subrutina que realitza la operacio logica AND
.org 550h
and:
	MOV A, D
	ANA E
	ADI 30h
	MOV M, A
	INX H

	MVI A, 3Bh
	MOV M, A
	INX H

	JMP loop







