# Laksi SOV - SIIT 2023
# Napiši asemblerski program koji menja svaku cifru u stringu prvim karakterom iz stringa, izlazni kod je broj izmena odnosno broj cifara tog stringa.
# Dejana Sevic, SV63/2023
.section .data
	poruka:	.ascii "Unesite string:	\0"
	poruka_len = (.-poruka)/1
	s: 	.fill 50,1,0
.section .text
.globl main
main:
	movl $4, %eax
	movl $1, %ebx
	leal poruka,  %ecx
	movl $poruka_len, %edx
	int $0x80
	
	movl $3, %eax
	movl $0, %ebx
	leal s, %ecx
	movl $50, %edx
	int $0x80
	
	decl %eax	#duzina s
	
	movl $0, %esi
	movb s(, %esi,1), %cl
	incl %esi

petlja:	
	movb s(,%esi,1), %ch
	cmpb $0, %ch
	je kraj
	cmpb $'0', %ch
	jl dalje
	cmpb $'9', %ch
	jg dalje
	movb %cl, %ch
	movb %ch, s(,%esi,1)
	incl %ebx
	incl %esi
	jmp petlja
dalje:
	incl %esi
	jmp petlja
kraj:
	movl $1, %eax
	int $0x80
