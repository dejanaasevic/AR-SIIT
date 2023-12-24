# Program that count length of each word in string
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "Da si musko da ti treba samo jedno logicno.\0"
	s_len = (.-s)/1
	word_len:	.long 0,0,0,0,0,0,0,0,0,0
.section .text
.globl main
main:
	movl $0, %esi	#indeks prvog niza
	movl $0, %edi	#indeks drugog niza
	movl $0, %ebx	#brojac slova neke reci

petlja:
	cmpl $s_len, %esi
	jg kraj	
	movb s(,%esi,1), %cl
	incl %ebx
	cmpb $' ',%cl
	je nasao_novu_rec
	cmpb $0, %cl
	je nasao_poslednju_rec
	incl %esi
	jmp petlja
	
nasao_novu_rec:
	decl %ebx
	incl %esi
	movl %ebx, word_len(,%edi,4)
	incl %edi
	movl $0, %ebx
	jmp petlja
	
nasao_poslednju_rec:
	decl %ebx
	decl %ebx
	incl %esi
	movl %ebx, word_len(,%edi,4)
	incl %edi
	movl $0, %ebx
	jmp petlja

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
