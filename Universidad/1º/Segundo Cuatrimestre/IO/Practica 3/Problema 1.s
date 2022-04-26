.data
a: .word 5
b: .word -6
resultat: .word 0
	.text
	la a0, a
	lw a1, 0(a0)
	lw a2, 4(a0)
	bgt a1, a2, cert
	j fals
cert:
	sub a3, a1, a2
	j end
fals:
	sub a3, a2, a1
end:
	sw a3, 8(a0)
