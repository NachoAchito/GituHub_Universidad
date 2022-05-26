.org 100h
	pila:

.org 200h
	lxi H, pila
	sphl

	lxi B, E000h
	lxi H, 400h
	mvi D, 02h

bucle:
	jmp bucle

.org 0024h
	call string_in
 	ret


.org 300h
string_in:
	in 00h
	cpi 00h
	jz no_tecla
	
	mov M, A
	inx H
	dcr D
	mvi A, 0h
	cmp D
	jz resultat

no_tecla:
	ret

resultat:
	mov A, H
	dcr H
	add H
	sui 30h
	stax B
	inx B
	mvi D, 2h
	ret



