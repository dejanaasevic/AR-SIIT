# Priprema T12
# Autor: Dejana Sevic, SV63/2023
.section .data
ulaz_str: .ascii "Unesite string: \0"
ulaz_len = (.-ulaz_str)/1
unos_max = 50
postoji_broj:		.long 0
unos: 	.fill unos_max,1,42
.section .text
.globl main
main:
	movl $4, %eax
	movl $1, %ebx
	leal ulaz_str, %ecx
	movl $ulaz_len, %edx
	int $0x80
	
	movl $3, %eax
	movl $0, %ebx
	leal unos, %ecx
	movl $unos_max, %edx
	int $0x80
	
	decl %eax		#length
	movl $0, %esi	#index
	movl $0, %ebx	#max
	movl $200, %edx	#min
	movl $0, %ecx
	
	
petlja:
	cmpl %eax, %esi
	jg kraj_stringa
	movb unos(,%esi,1), %cl
	cmpb $'0',%cl
	jl dalje
	cmpb $'9', %cl
	jle nasao_broj
	incl %esi
	jmp petlja

nasao_broj:
	movl $1, postoji_broj
	cmpl %edx, %ecx
	jge proveri_max
	movl %ecx, %edx

proveri_max:
	cmpl %ebx, %ecx
	jl dalje
	movl %ecx, %ebx
dalje:
	incl %esi
	jmp petlja

kraj_stringa:
	cmpl $0, postoji_broj
	jne saberi
	movl $0, %ebx
	jmp kraj
saberi:
	addl %edx,%ebx
kraj:
	movl $1, %eax
	int $0x80
