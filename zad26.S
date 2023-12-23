# Removing Special Characters: Develop a function that removes all special characters (punctuation marks, symbols) from a string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_string:	.ascii "He@llo! How are you? I'm d@oing well.\0"
	len = (.-prvi_string)/1
	drugi_string:	.fill 100,1,0
.section .text
.globl main
main:
	movl $0, %esi	#indeks prvog stringa
	movl $0, %edi 	#indeks drugog stringa
	
petlja:	
	cmpl $len, %esi
	jge kraj
	movb prvi_string(,%esi,1), %cl
	cmpb $32, %cl
	jle prepisi
	cmpb $47, %cl
	jle izbaci
	cmpb $57, %cl
	jle prepisi
	cmpb $64, %cl
	jle izbaci
	cmpb $90, %cl
	jle prepisi
	cmpb $96, %cl
	jle izbaci
	cmpb $122, %cl
	jle prepisi
	cmpb $127, %cl
	jle izbaci
prepisi:
	movb %cl, drugi_string(,%edi,1)
	incl %edi
	incl %esi
	jmp petlja
izbaci:
	incl %esi
	jmp petlja
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
