# Varijacija pripreme lakseg SOV-a
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_ispis:	.ascii "Unesite string: \0"
	prvi_ispis_len = (.-prvi_ispis)/1
	brojac:	.long 0
	unos:	.fill 50,1,0
	max_len = 50
.section .text
.globl main
main:
	movl $4, %eax
	movl $1, %ebx
	leal prvi_ispis, %ecx
	movl $prvi_ispis_len, %edx
	int $0x80
	
	movl $3, %eax
	movl $0, %ebx
	leal unos, %ecx
	movl $max_len, %edx
	int $0x80
	
	decl %eax		#duzina unosa
	movl $0, brojac	#brojac
	movl $0, %esi	#indeks
	
petlja:
	cmpl %eax, %esi
	jge kraj
	movb unos(,%esi,1), %cl
	cmpb $47, %cl
	jle pronasao
	cmpb $57, %cl
	jle dalje
	cmpb $64, %cl
	jle pronasao
	cmpb $90, %cl
	jle dalje
	cmpb $96, %cl
	jle pronasao
	cmpb $122, %cl
	jle dalje
	cmpb $127, %cl
	jle pronasao
	
dalje:
	incl %esi
	jmp petlja
pronasao:
	incl %esi
	incl brojac
	jmp petlja
kraj:
	movl $1, %eax
	movl brojac, %ebx
	int $0x80
	
