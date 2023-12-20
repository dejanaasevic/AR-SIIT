# Average Calculation: Develop a function to find the average of elements in the array.
# Autor: Dejana Sevic, SV63/2023

.section .data
	niz:	.long 1,2,3,4,5,6,7,8,9,10
	NELEM = 10
	avg:	.long 0
.section .text
.globl main
main:
	movl $0, %eax
	movl $0, %esi
	movl $niz, %ebx
petlja:
	addl (%ebx, %esi,4), %eax
	incl %esi
	cmpl $NELEM, %esi
	jl petlja
	
	movl $0, %edx
	movl $NELEM, %ecx
	divl %ecx
	movl %eax, avg

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
