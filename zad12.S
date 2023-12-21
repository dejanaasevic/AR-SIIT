# Write an assembly program that calculates the element-wise sum of two arrays
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_niz:	.long 1,2,3,4,5
	drugi_niz:	.long 6,7,8,9,10
	niz_len = (.-drugi_niz)/4
	treci_niz:	.fill niz_len, 4,0
	
.section .text
.globl main
main:
	movl $0, %esi
	movl $niz_len, %ecx
petlja:
	cmpl %ecx, %esi
	jge kraj
	movl prvi_niz(,%esi,4), %eax
	movl drugi_niz(,%esi,4), %ebx
	addl %ebx, %eax
	movl %eax, treci_niz(,%esi,4)
	incl %esi
	jmp petlja
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
