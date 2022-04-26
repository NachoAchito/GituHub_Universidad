.data
a: .word 252
b: .word 105
resultat: .word 0
.text
	la a0, a
	lw a1, 0(a0)
	lw a2, 4(a0)
loop:
	beq a1, a2 end
	bgt a1, a2, cert
	j fals
cert:
	sub a1, a1, a2
	j loop
fals:
	sub a2, a2, a1
	j loop
end:
	sw a1, 8(a0)
	