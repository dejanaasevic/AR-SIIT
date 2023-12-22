# Character Count: Count the occurrences of a specific character in a string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "Dejana\0"
	s_len = 	(.-s)/1
	char:	.ascii "a\0"
	br:	.long 0
.section .text
.globl main
main:
	movl $s_len, %eax
	movl $0, %esi
	movl $0, %edi
	movl $0, %ebx

petlja:
	cmpl %eax, %esi
	jge kraj
	movb s(,%esi,1), %cl
	movb char(,%edi,1), %ch
	cmpb %ch, %cl
	jne dalje
	incl %ebx

dalje:
	incl %esi
	jmp petlja

kraj:
	movl %ebx, br
	movl $1, %eax
	movl $0, %ebx
	int $0x80
