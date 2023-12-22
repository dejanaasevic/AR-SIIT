# String Duplication: Create a program that duplicates the content of a string
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_string:	.ascii "Dejana\0"
	s_len = (.-prvi_string)/1
	drugi_string:	.fill 100,1,0
.section .text
.globl main
main:
	movl $s_len, %eax
	decl %eax
	movl $0, %esi	#index prvog niza
	movl $0, %edi 	#index drugog niza
prva_petlja:
	cmpl %eax, %esi
	jge dalje
	movb prvi_string(,%esi,1), %cl
	movb %cl, drugi_string(,%edi,1)
	incl %esi
	incl %edi
	jmp prva_petlja
dalje:
	movl $s_len, %eax
	movl $0, %esi
druga_petlja:
	cmpl %eax, %esi
	jge kraj
	movb prvi_string(,%esi,1), %cl
	movb %cl, drugi_string(,%edi,1)
	incl %esi
	incl %edi
	jmp druga_petlja
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
