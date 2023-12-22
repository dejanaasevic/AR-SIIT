# String Conversion: Convert a string to lowercase
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "Dejana Sevic, SV63/2023\0"
	s_len = (.-s)/1
.section .text
.globl main
main:
	movl $s, %eax
	movl $0, %esi
	movl $s_len, %ebx

petlja:
	cmpl %ebx, %esi
	jge kraj
	movb (%eax, %esi,1), %cl
	cmpb $'A', %cl
	jl dalje
	cmpb $'Z', %cl
	jg dalje
	addb $'a'-'A', %cl
	movb %cl, (%eax, %esi,1)
dalje:
	incl %esi
	jmp petlja
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
