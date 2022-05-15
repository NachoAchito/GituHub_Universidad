.data
mat1: .word 1, 2, 3, 4, 5  	#Vector mat1
mat2: .word 6, 7, 8, 9, 0 	#Vector mat2
mat3: .word 0, 0, 0, 0, 0	#Vector mat3
cont: .word 5				#Contador

.text 

main:
	la a0, cont 	#Se carga el valor de la entiqueta cont en a0
	lw a4, 0(a0)	#Se carga el contenido al que apunta a0 en a4
	la a0, mat1 	#Se carga mat1 en a0
	la a1, mat2 	#Se carga mat2 en a1

loop:
	lw a2, 0(a0)	#Se carga el contenido al que apunta a0 en a2
	lw a3, 0(a1)	#Se carga el contenido al que apunta a1 en a3
	add a3, a2, a3	#Se suma el a2 mas a3 i se guarda en a3
	sw a3, 0(a1)	#Se guarda el contenido de a3 en a1
	addi a0, a0, 4	#La direccion de memoria a la que apunta a0 aumenta 4 bytes
	addi a1, a1, 4	#La direccion de memoria a la que apunta a1 aumenta 4 bytes
	addi a4, a4, -1	#El contador decrementa en uno

	bgtz a4, loop	#Si a4 es mayor a 0 se salta a la etiqueta loop
end:
	nop				#Fin del programa