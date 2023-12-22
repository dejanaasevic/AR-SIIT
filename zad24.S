# Skipping Every Other Character: Implement a function that skips every other character in a string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_string:	.ascii "Dejana Sevic SV63/2023\0"
	len = (.-prvi_string)/1
	drugi_string:	.fill 100, 1,0
.section .text
.globl main
main:
	movl $len, %eax
	movl $0, %esi
	movl $0, %edi
	
petlja:
	cmpl %eax, %esi
	jge kraj_stringa
	movb prvi_string(,%esi,1), %cl
	movb %cl, drugi_string(,%edi,1)
	addl $2, %esi
	incl %edi
	jmp petlja

kraj_stringa:
	movb $0, drugi_string(,%edi,1)
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
