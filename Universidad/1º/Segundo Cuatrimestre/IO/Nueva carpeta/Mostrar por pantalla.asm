.org 100h
	pila:

.org 200h
	lxi H, pila
	sphl 
	lxi H, E000h
	
bucle:
	jmp bucle

.org 24h
	call mostrar
	ret

.org 300h
mostrar:
	in 00h
	mov M,A
	inx H
	ret