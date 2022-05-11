.define 
	contador 5

.data 50h
	mat1: db 1,2,3,4,5
	mat2: db 6,7,8,9,0
	mat3: db 0,0,0,0,0

.org 100h
lxi h, mat1
lxi b, mat3
mvi d, contador

movement:
	mov a, M
	stax b
	inx h
	inx b
	dcr d
jnz movement
mvi d,contador
lxi b,mat3

loop:
	mov e, M
	ldax b
	add e
	stax b
	inx h
	inx b
	dcr d
	jnz loop
hlt