# String Length: Determine the length of a string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "Dejana Sevic\0"
	s_len:	.long 0
.section .text
.globl main
main:
	movl $s, %eax
	movl $0, %esi

petlja:
	cmpb $0, (%eax,%esi,1)
	je kraj
	incl %esi
	jmp petlja
kraj:
	movl %esi, s_len
	movl $1, %eax
	movl $0, %ebx
	int $0x80
