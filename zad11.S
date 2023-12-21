# String Sort: Write a program that sorts an array of strings in alphabetical order and then displays the sorted strings.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "Dejana Sevic"
	s_len = 	(.-s)/1
.section .text
.globl main
main:
	movl $s, %eax
	movl $s_len, %esi

spoljasnja_petlja:
	decl %esi
	jz kraj
	movl $s_len, %edi

unutrasnja_petlja:
	decl %edi
	jz spoljasnja_petlja
	movb (%eax, %edi,1), %bl
	movb -1(%eax, %edi,1), %cl
	cmpb %bl, %cl
	jl unutrasnja_petlja
	xchgb %bl, %cl
	movb %bl, (%eax, %edi,1)
	movb %cl, -1(%eax, %edi,1)
	jmp unutrasnja_petlja
	
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
