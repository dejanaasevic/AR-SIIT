# Array Reversal: Reverse the order of elements in the array.
# Autor: Dejana Sevic SV63/2023

.section .data
	niz:	.long 1,2,3,4,5,6,7,8,9,10
	niz_len = (.-niz)/4
.section .text
.globl main
main:
	movl $niz, %eax
	movl $0, %esi
	movl $niz_len, %edi
	decl %edi

petlja:
	cmpl %edi, %esi
	jge kraj
	
	movl (%eax, %esi, 4), %ebx
	movl (%eax, %edi, 4), %ecx
	movl %ecx, (%eax, %esi, 4)
	movl %ebx, (%eax, %edi, 4)
	
	decl %edi
	incl %esi
	jmp petlja
	
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
