# Minimum Element: Write code to find the minimum value in the array.
# Autor: Dejana Sevic

.section .data
	niz:	.long 14,56,12,9,11,24,44,5,6,8
	niz_len = (.-niz)/4
	min:	.long 0
.section .text
.globl main
main:
	movl $niz, %eax				#adresa niza u %eax
	movl $0, %esi				#postavi indeks u %esi
	movl (%eax, %esi, 4), %ebx	#postavi prvi element kao najmanji u %ebx

petlja:
	cmpl $niz_len, %esi
	jge kraj
	cmpl (%eax, %esi, 4), %ebx
	jle dalje
	movl (%eax, %esi, 4), %ebx
dalje:
	incl %esi
	jmp petlja

kraj:
	movl %ebx, min
	movl $1, %eax
	movl $0, %ebx
	int $0x80
