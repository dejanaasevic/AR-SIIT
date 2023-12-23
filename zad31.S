#Replacing Every Third Word: Implement a function that replaces every third word in the string with another specified word.
# Autor: Dejana Sevic, SV63/2023
.section .data
	prvi_string:	.ascii	"Slatko je more kad izadjes iz vode seceru\0"
	prvi_string_len = (.-prvi_string)/1
	drugi_string:	.fill 100,1,0
	promena:	.ascii "lepi"
	promena_len = (.-promena)/1
.section .text
.globl main
main:
	movl $0, %eax	#brojac reci
	movl $0, %ebx	#broj slova u reci
	movl $0, %esi	#indeks glavnog stringa
	movl %esi, %edx #pocetak reci
	movl $0, %edi	#indeks drugog stringa

petlja:
	cmpl $prvi_string_len, %esi
	jge kraj
	movb prvi_string(,%esi,1),%cl
	incl %ebx
	cmpb $' ', %cl
	je dalje
	cmpb $0, %cl
	je dalje
	incl %esi
	jmp petlja
	
dalje:
	incl %eax
	incl %esi
	cmpl $3, %eax
	je zamena
	jne prepisi_rec

prepisi_rec:
	cmpl $0, %ebx
	je nastavi
	movb prvi_string(,%edx,1),%cl
	movb %cl, drugi_string(,%edi,1)
	incl %edi
	incl %edx
	decl %ebx
	jmp prepisi_rec

nastavi:
	movl $0, %ebx
	movl %esi, %edx
	jmp petlja
	
zamena:
	movl $0, %ebx
	movl $0, %eax
zameni_rec:
	cmpl $promena_len, %ebx
	jge dodaj_razmak
	movb promena(,%ebx,1), %cl
	movb %cl, drugi_string(,%edi,1)
	incl %edi
	incl %ebx
	jmp zameni_rec

dodaj_razmak:
	movb $' ', drugi_string(,%edi,1)
	incl %edi
	jmp nastavi
	
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
