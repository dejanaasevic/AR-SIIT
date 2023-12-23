# Reverse Words in Sentences: Develop a function that reverses the words in sentences
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_string:	.ascii "A ja nocu ne mogu da zaspim crna jutra a ja sama sasvim\0"
	len = (.-prvi_string)/1
	drugi_string: 	.fill len,1,0
.section .text
.globl main
main:
	movl $prvi_string,%eax
	movl $0, %esi	#indeks prvog stringa
	movl $0, %edi	#indeks drugog stringa
	movl $0, %ebx
	
petlja:
	cmpl $len, %esi
	jge kraj
	movb (%eax,%esi,1),%cl
	incl %ebx
	cmpb $' ',1(%eax,%esi,1)
	je dalje
	cmpb $0, 1(%eax,%esi,1)
	je poslednji_dalje
	incl  %esi
	jmp petlja

dalje:
	movl %esi, %ebp
obrni:
	cmpl $0, %ebx
	je dodaj_razmak
	movb (%eax, %ebp,1), %cl
	movb %cl, drugi_string(,%edi,1)
	incl %edi
	decl %ebp
	decl %ebx
	jmp obrni
	
dodaj_razmak:
	movb $' ', drugi_string(,%edi,1)
	incl %edi
	incl %esi
	jmp petlja

poslednji_dalje:
	movl %esi, %ebp
	decl %ebx
obrni_poslednji:
	cmpl $0, %ebx
	je kraj
	movb (%eax, %ebp,1), %cl
	movb %cl, drugi_string(,%edi,1)
	incl %edi
	decl %ebp
	decl %ebx
	jmp obrni_poslednji
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
