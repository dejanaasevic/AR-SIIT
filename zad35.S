# Laksi SOV priprema
# Autor: Dejana Sevic, SV63/2023

.section .data
	brojac:	.byte 0
	poruka:	.ascii	"Unesite string: \0"
	poruka_len = (.-poruka)
	s:	.fill 50,1,0 
.section .text
.globl main
main:
	movl $4, %eax
	movl $1, %ebx
	leal poruka, %ecx
	movl $poruka_len, %edx
	int $0x80
	
	movl $3, %eax
	movl $0, %ebx
	leal poruka, %ecx
	movl $50, %edx
	int $0x80
	

	decl %eax
	
	movl $0, %ebx
	movl $0, %esi

petlja:
	cmpl %eax, %esi
	jge kraj
	movb poruka(,%esi,1),%cl
	cmpb $48, %cl
	jl preskoci
	cmpb $58, %cl
	jle nasao
	cmpb $65, %cl
	jl preskoci
	cmpb $90, %cl
	jle nasao
	cmpb $97, %cl
	jl preskoci
	cmpb $122, %cl
	jle nasao
	jg preskoci

nasao:
	incl %ebx
	incl %esi
	jmp petlja
preskoci:
	incl %esi
	jmp petlja
kraj:
	movl %ebx, brojac
	movl $1, %eax
	movl $0, %ebx
	int $0x80
