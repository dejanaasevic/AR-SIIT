# Substring Search: Implement a function to search for a substring within a larger string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii	"Dejana\0"
	s_len = (.-s)/1
	substring:	.ascii "aana\0"
	substring_len = (.-substring)/1
	sub_index:	.long -1
.section .text
.globl main
main:
	movl $s_len, %eax
	movl $substring_len, %ebx
	decl %eax
	decl %ebx
	decl %ebx
	movl $0, %esi	#index stringa
	movl $0, %edi	#index sub stringa
petlja:
	cmpl %eax, %esi
	jge kraj
	movb s(,%esi,1), %ch
	movb substring(,%edi, 1), %cl
	cmpb %ch, %cl
	movl %esi, %edx
	je provera
	incl %esi
	jmp petlja
	
provera:
	cmpl %ebx, %edi
	jge pronasao_substring
	incl %esi
	incl %edi
	movb s(,%esi,1), %ch
	movb substring(,%edi, 1), %cl
	cmpb %ch, %cl
	je provera
	movl $0, %edi
	jmp petlja
	
pronasao_substring:
	movl %edx, sub_index
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
