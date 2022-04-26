.data
xx: .word 10				#Etiqueta que guarda 32 bits per emmgatzmar una paraula que conte un 10
yy: .word 20				#Etiqueta que guarda 32 bits per emmgatzmar una paraula que conte un 20
resultat: .word 0			#Etiqueta que guarda 32 bits per emmgatzmar una paraula que conte un 0

.text
	la a3, xx				#a3 fa de punter que apunta a la direccio de memoria de xx que conte un 10
	lw a0, 0(a3)			#Es carrega en a0 el contingut al qual apunta a3. a0 = 10
	lw a1, 4(a3)			#Es carrega en a1 el contingut al qual apunta a3 desplaçat 4 bytes. a0 = 20
	add a2, a0, a1			#Es suma a0 mes a1 i es guarda en a2. a2 = 30
	sw a2, 8(a3)			#Es carrega el contingut de a2 en la posicio de memoria que apunta a3 desplaçada 8 bytes