.data
Dades: .word 9, 3, 4, 1 	# vector de 4 enters
Resultat: .word 0, 0 		# vector de 2 enters
.text 							# directiva d’inici de programa
main:
la a0, Dades 				# a0 actuarà com a punter
lw a1, 0(a0) 				# 0(a0) = Dada[0] = 9
lw a2, 4(a0)					# 4(a0) = Dada[1] = 3
lw a3, 8(a0) 				# 8(a0) = Dada[2] = 4
lw a4, 12(a0) 				# 12(a0) = Dada[3] = 1
loop:
add a5,a1,a2					#9 + 3 = 12
add a6,a4,a2					#1 + 3 = 4
addi a3, a3,-1				#a3--
bgez a3, loop				#si a3 >= 0 salta a la etiqueta loop
sw a5, 16(a0) 				# 16(a0) = Resultat[0] = 12
sw a6, 20(a0) 				# 20(a0) = Resultat[1] = 4
end: nop 						#final de programa
