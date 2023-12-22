# String Extraction: Extract a specific portion of a string (substring).
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "Ko ovu dramu rezira.\0"
	s_len = (.-s)/1
	start_index:	.long 4
	length = 5
	greska:	.byte 0
	substring:	.fill length,1,0
.section .text
.globl main
main:
	movl $s_len, %eax
	movl start_index, %ebx
	addl $length, %ebx
	
	cmpl %eax, %ebx
	jg pogreska
	
	movl start_index, %esi
	movl $0, %edi
	movl $length, %eax
	
petlja:
	movb s(,%esi,1), %cl
	movb %cl , substring(,%edi,1)
	incl %esi
	incl %edi
	decl %eax
	jz kraj
	jmp petlja
pogreska:		
	movb $1, greska
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
