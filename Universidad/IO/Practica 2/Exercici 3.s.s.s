.data
A: .word 3083				#Vector de 1 enter
B: .word 17				#Vector de 1 enter

.text
	la a0, A					#a0 atua com un punter i apuntara a la direccio de A
	lw a1, 0(a0)				#Es carrega el contingut al que apunta a0 en a1. a1 = 3082
	lw a2, 4(a0)				#Es carrega el contingut al que apunta a0 desplaçat 4 bytesen a2. a2 = 17
	sub a0, a0, a0

loop:
	beqz a2, end				#Si a2 es igual a 0 es salta a end
	add a0, a0, a1			#Es suma a0 mes a1 i es guarda el resultat en a0
	addi a2, a2 -1			#a2--
	j loop

end:
	nop