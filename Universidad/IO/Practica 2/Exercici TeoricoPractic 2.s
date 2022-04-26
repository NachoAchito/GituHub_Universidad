.data 
A: .word -2, -3			# Vector de 2 enters

.text
	la a0, A				#a0 actuara com a punter
	lw a1, 0(a0)			#Es carrega el contingut al que apunta a0 en a1
	lw a2, 4(a0)			#Es carrega el contingut al que apunta a0 desplaçat 4 bytes en a2

	beq a1, a2, cas1		#Si a1 es igual a a2 es salta al cas1 
	blez a1, aux1			#Si a1 es negatiu es salta a aux1
	blez a2, aux2			#Si a2 es negatiu es salta a aux2
	
cas3:
	sub a3, a1, a2		#Es resta a1 menys a2 i es guarda el resultat en a3
	j end
cas1:
	mul a3, a1, a2		#Es multiplica a1 per a2 i es guarda el resultat en a3
	j end

cas2:
	add a3, a1, a2		##Es suma a1 mes a2 i es guarda el resultat en a3
	j end

cas4:
	not a1, a1				#Es nega a1 i es guarda en a1
	not a2, a2				#Es nega a2 i es guarda en a2
	addi a1, a1, 1		#Es suma 1 a a1 i es guarda en a1
	addi a2, a2, 1		#Es suma 1 a a2 i es guarda en a2
	sw a1, 8(a0)			#Es guarda el contingut de a1 en memmoria
	sw a2, 12(a0)			#Es guarda el contingut de a2 en memoria
	j end	

aux1:
	blez a2, cas4			#Si a2 es negatiu salta al cas4 ja que a1 i a2 son negatius
	j cas2
aux2:
	blez a1, cas4			#Si a1 es negatiu salta al cas4 ja que a1 i a2 son negatius
	j cas2
end:
nop