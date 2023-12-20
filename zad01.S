# Summation: Write a program to calculate the sum of all elements in the array.
# Autor: Dejana Sevic, SV63/2023

.section .data
	niz:	.long 1,2,3,4,5,6,7,8,9,10,11,12,13,14
	NELEM = 14
	suma:	.long 0
.section .text
.globl main
main:
	movl $0, %eax 	#suma, postavlja se na 0
	movl $niz, %ebx #adresa niza se premesta u %ebx
	movl $0, %esi	#index se postavlja u %esi
petlja:
	addl (%ebx, %esi,4), %eax
	incl %esi
	cmpl $NELEM, %esi
	jl petlja
kraj:
	movl %eax, suma
	movl $1, %eax
	movl $0, %ebx
	int $0x80
