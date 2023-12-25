# SIIT T12
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_ispis:	.ascii	"Unesite string: \0"
	prvi_ispis_len = (.-prvi_ispis)/1
	drugi_ispis:	.ascii "Rezultujuci string:	\0"
	drugi_ispis_len = (.-drugi_ispis)/1
	u:	.fill 50,1,0
	max_unos = 50
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
	leal u, %ecx
	movl $max_unos, %edx
	int $0x80
	
	decl %eax	#duzina unosa
	movl $0, %ebx # ako je 0 pretvara u  mala slova ako je 1 u velika
	movl $0, %esi
	
petlja:	
	cmpl %eax, %esi
	jge kraj_stringa
	movb u(,%esi,1), %cl
	cmpb $'!', %cl
	je dalje
	incl %esi
	jmp petlja

dalje:
	incl %esi
	cmpl $0, %ebx
	je pretvori_velika_slova
	cmpl $1, %ebx
	je pretvori_mala_slova

pretvori_velika_slova:
	cmpl %eax, %esi
	jge kraj_stringa
	movb u(,%esi,1),%cl
	cmpb $'!', %cl
	je dalje_velika
	cmpb $64, %cl
	jle dalje
	cmpb $91, %cl
	jge dalje
	addb $'a'-'A', %cl
	movb %cl, u(,%esi,1)
	incl %esi
	jmp pretvori_velika_slova

dalje_velika:
	movl $1, %ebx
	jmp petlja
	
pretvori_mala_slova:
	cmpl %eax, %esi
	jge kraj_stringa
	movb u(,%esi,1),%cl
	cmpb $'!', %cl
	je dalje_mala
	cmpb $96, %cl
	jle dalje
	cmpb $123, %cl
	jge dalje
	subb $'a'-'A', %cl
	movb %cl, u(,%esi,1)
	incl %esi
	jmp pretvori_mala_slova

dalje_mala:
	movl $0, %ebx
	jmp petlja	

kraj_stringa:
	movl $4, %eax
	movl $1, %ebx
	leal drugi_ispis, %ecx
	movl $drugi_ispis_len, %edx
	int $0x80
	
	movl $4, %eax
	movl $1, %ebx
	leal u, %ecx
	movl %esi, %edx
	int $0x80

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
