# String Reversal: Write a program to reverse a string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii	"Dejana\0"
	s_len =  (.-s)/1
.section .text
.globl main
main:
	movl $s, %eax
	movl $0, %esi
	movl $s_len, %edi
	decl %edi
	decl %edi

petlja:
	cmpl %edi, %esi
	jge kraj
	movb (%eax, %esi, 1), %cl
	movb (%eax, %edi, 1), %ch
	xchgb %cl, %ch
	movb %cl, (%eax, %esi, 1)
	movb %ch, (%eax, %edi, 1)
	incl %esi
	decl %edi
	jmp petlja
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
