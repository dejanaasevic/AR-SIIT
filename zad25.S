# Finding the Longest Word: Create a program that finds the longest word in a string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "Reci ne mogu da opisu koliko ja mrzim ovaj asembler\0"
	s_len = (.-s)/1
	indeks:		.long 0
	max_len:	.long 0
	rec:	.fill 100,1,0
.section .text
.globl main
main:
	movl $0, indeks
	movl $0, %esi	#index glavnog stringa
	movl $0, %ebx	#trenutni brojac
	movl $0, %eax   #max duzina
	movl $0, %edx   #index
	
petlja:
	cmpl $s_len, %esi
	jge kraj_stringa
	movb s(,%esi,1), %cl
	cmpb $' ',%cl
	je dalje
	cmpb $0, %cl
	je dalje
	incl %esi
	incl %ebx
	jmp petlja

dalje:
	cmpl %eax, %ebx
	jg nasao_novi_max
	incl %esi
	movl %esi, %edx
	movl $0, %ebx
	jmp petlja
	
nasao_novi_max:
	movl %ebx, %eax
	movl %edx, indeks
	movl %ebx, max_len
	movl $0, %ebx
	incl %esi
	movl %esi, %edx
	jmp petlja
	
kraj_stringa:
	movl indeks, %esi
	movl $0, %edi
	movl max_len, %eax

popuni:
	cmpl $0, %eax
	je kraj
	movb s(,%esi,1), %cl
	movb %cl, rec(,%edi,1)
	incl %esi
	incl %edi
	decl %eax
	jmp popuni
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
