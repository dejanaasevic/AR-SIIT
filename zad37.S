# Priprema T12
# Autor: Dejana Sevic SV63/2023
.section .data
	prvi_ispis:	.ascii "Unesite string: \0"
	prvi_ispis_len = (.-prvi_ispis)/1
	max_len = 50
	unos:	.fill max_len,1,0
	drugi_ispis: .ascii "Rezultujuci string:"
	drugi_ispis_len = (.-drugi_ispis)/1
.section .text
.globl main
main:
	movl $4, %eax
	movl $1, %ebx
	leal prvi_ispis, %ecx
	movl $prvi_ispis_len, %edx
	int $0x80
	
	movl $3,%eax
	movl $0, %ebx
	leal unos, %ecx
	movl $max_len, %edx
	int $0x80
	
	decl %eax		#duzina unosa
	movl $0, %esi   #index

petlja:
	cmpl %eax, %esi
	jge kraj_stringa
	movb unos(,%esi,1), %cl
	cmpb $'.', %cl
	je pronasao_tacku
	incl %esi
	jmp petlja

pronasao_tacku:
	incl %esi
trazi_slovo:
	cmpl %eax, %esi
	jge kraj_stringa
	movb unos(,%esi,1), %cl
	cmpb $96, %cl
	jle nastavi
	cmpb $123, %cl
	jge nastavi
	subb $'a'-'A', %cl
	movb %cl, unos(,%esi,1)
	jmp petlja
nastavi:
	incl %esi
	jmp trazi_slovo

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
