# Maximum Element: Create a program to find the maximum value in the array.
# Autor: Dejana Sevic, SV63/2023

.section .data
	niz:	.long  12,7,13,12,11,65,1,8,15
	niz_len = (.-niz)/4
	max:	.long 0
.section .text
.globl main
main:
	movl $niz, %eax		#postavi adresu niza u eax
	movl $0, %esi		# postavi indeks u %esi
	movl (%eax, %esi, 4), %ebx	#inicijalizuj max na prvi element niza u %ebx
	
petlja:
	cmpl $niz_len, %esi
	jge kraj
	cmpl (%eax, %esi,4), %ebx
	jge dalje
	movl (%eax, %esi,4), %ebx
dalje:
	incl %esi
	jmp petlja

kraj:
	movl %ebx, max
	movl $1, %eax
	movl $0, %ebx
	int $0x80
