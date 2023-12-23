# Replacing Spaces with Dashes: Implement a function that replaces all spaces in a string with dashes.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "I lomi i moli, i benzinom polij\0"
	s_len = (.-s)/1
.section .text
.globl main
main:
	movl $0, %esi

petlja:
	cmpl $s_len, %esi
	jge kraj
	movb s(,%esi,1), %cl
	cmpb $' ', %cl
	je zameni
	incl %esi
	jmp petlja

zameni:
	movb $'_', %cl
	movb %cl, s(,%esi,1)
	incl %esi
	jmp petlja

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
