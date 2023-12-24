# Program that counts number of words in string
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii	"Uz viski topao dabogda propao."
	s_len = (.-s)/1
	br:		.long 0
.section .text
.globl main
main:
	movl $0, %esi	#index string s
	movl $0, %ebx 	#brojac reci

petlja:
	cmpl $s_len, %esi
	jg kraj
	movb s(,%esi,1), %cl
	cmpb $' ', %cl
	je nova_rec
	cmpb $0, %cl
	je nova_rec
	incl %esi
	jmp petlja
	
nova_rec:
	incl %ebx
	incl %esi
	jmp petlja
kraj:
	movl %ebx, br
	movl $1, %eax
	movl $0, %ebx
	int $0x80

