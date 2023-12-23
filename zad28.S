# Reversing Concatenated Strings: Create a program that concatenates two strings in reverse order
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_string:	.ascii "Dejana\0"
	prvi_string_len = (.-prvi_string)
	drugi_string:	.ascii "Sevic\0"
	drugi_string_len = (.-drugi_string)
	treci_string:	.fill 100,1,0
.section .text
.globl main
main:
	movl $prvi_string_len, %esi	#indeks prvog stringa
	decl %esi
	decl %esi
	movl $0, %edi	#indeks treceg stringa
	
petlja_prvi_string:
	cmpl $0, %esi
	jl dalje
	movb prvi_string(,%esi,1), %cl
	movb %cl, treci_string(,%edi,1)
	decl %esi
	incl %edi
	jmp petlja_prvi_string
dalje:
	movl $drugi_string_len, %esi
	decl %esi
	decl %esi	
petlja_drugi_string:
	cmpl $0, %esi
	jl kraj	
	movb drugi_string(,%esi,1), %cl
	movb %cl, treci_string(,%edi,1)
	decl %esi
	incl %edi
	jmp petlja_drugi_string	
kraj:
	movl $1, %eax
	movl $0, %eax
	int $0x80
