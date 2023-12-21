# Element Search: Implement a function to search for a specific number in the array.
# Autor: Dejana Sevic, SV63/2023

.section .data
	niz:	.long 4,7,2,9,1,17,44,3,11
	niz_len = (.-niz)/4
	elem:	.long 24
	indeks:	.long 0 
.section .text
.globl main
main:
	movl $niz, %eax
	movl $0, %esi
	movl $niz_len, %ebx
	movl elem, %ecx

petlja:
	cmpl %ebx, %esi
	jge kraj_niza
	cmpl (%eax, %esi,4), %ecx
	je pronasao
	incl %esi 
	jmp petlja
	
pronasao:
	movl %esi, indeks
	jmp kraj

kraj_niza:
	movl $-1, indeks
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
