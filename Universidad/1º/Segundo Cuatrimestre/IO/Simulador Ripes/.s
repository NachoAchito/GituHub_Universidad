.data
mat1: .word 1,2,3,4,5
mat2: .word 6,7,8,9,0
mat3: .word 0,0,0,0,0
cont: .word 5
.text
la a0, cont
lw a3, 0(a0)
la a1, mat1
la a2, mat2

loop:
	add a2, a1, a2
	addi a1, a1, 4
	addi a2, a2, 4
	addi a3, a3, -1