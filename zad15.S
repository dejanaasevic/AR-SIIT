# String Comparison: Compare two strings and check if they are equal.
# Autor: Dejana Sevic

.section .data
	prvi_string:	.ascii	"Dejana Sevic\0"
	prvi_string_len = (.-prvi_string)/1
	drugi_string:	.ascii	"Dejana Sevic\0"
	drugi_string_len = (.-drugi_string)/1
	jednaki:	.byte 0
.section .text
.globl main
main:
	movl $prvi_string_len, %eax
	movl $drugi_string_len, %ebx
	cmpl %eax, %ebx
	jne kraj
	
	movl $0, %esi
provera:
	cmpl %eax, %esi
	jge isti_stringovi
	movb prvi_string(,%esi,1), %cl
	movb drugi_string(,%esi,1), %ch
	cmpb %cl, %ch
	jne kraj
	incl %esi
	jmp provera

isti_stringovi:
	movb $1, jednaki
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
