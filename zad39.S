#T12 SIIT
#Autor: Dejana Sevic, SV63/2023
.section .data	
	prvi_ispis:	.ascii "Unesite string: \0"
	prvi_ispis_len = (.-prvi_ispis)/1
	drugi_ispis:	.ascii "Rezultujuci string: \0"
	drugi_ispis_len = (.-drugi_ispis)/1
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
	
	decl %eax	#duzina unosa
	movl $0, %esi	#indeks
	mov $0, %ebx	# status - ako je nula pretvara velika u mala slova, ako je jedan pretvara mala u velika slova
	
petlja:
	cmpl %eax, %esi
	jge kraj_stringa
	movb unos(,%esi,1), %cl
	cmpb $'.', %cl
	je dalje
	incl %esi
	jmp petlja
dalje:
	incl %esi
	cmpl $0, %ebx
	je pretvaraj_u_mala_slova
	cmpl $1, %ebx
	je pretvaraj_u_velika_slova

pretvaraj_u_mala_slova:
	cmpl %eax, %esi
	jge kraj_stringa
	movb unos(,%esi,1),%cl
	cmpb $'.', %cl
	je dalje_velika
	cmpb $'A', %cl
	jl dalje
	cmpb $'Z', %cl
	jg dalje
	addb $'a'-'A', %cl
	movb %cl, unos(,%esi,1)
	incl %esi
	jmp pretvaraj_u_mala_slova
	
dalje_velika:
	movl $1, %ebx
	jmp petlja
	
pretvaraj_u_velika_slova:
	cmpl %eax, %esi
	jge kraj_stringa
	movb unos(,%esi,1),%cl
	cmpb $'.', %cl
	je dalje_mala
	cmpb $'a', %cl
	jl dalje
	cmpb $'z', %cl
	jg dalje
	subb $'a'-'A', %cl
	movb %cl, unos(,%esi,1)
	incl %esi
	jmp pretvaraj_u_velika_slova
	
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
	leal unos, %ecx
	movl %esi, %edx
	int $0x80
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
