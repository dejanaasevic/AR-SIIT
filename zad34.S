# Program that checks if a string is a palindrome

.section .data
	s:	.ascii "Ana voli Milovana\0"
	s_len = (.-s)/1
	drugi_string:	.fill	100,1,0
	palindrom_status:	.byte 0
.section .text
.globl main
main:
	movl $0, %esi	#indeks prvog niza
	movl $0, %edi	#indeks drugog niza
	movl $0, %ebx	#brojac slova

petlja:
	cmpl $s_len, %esi
	jge palindrom
	movb s(,%esi,1),%cl
	cmpb $0, %cl
	je palindrom
	cmpb $' ', %cl
	je preskoci
	cmpb $'A', %cl
	jl prepisi
	cmpb $'Z', %cl
	jle veliko_slovo
	jmp prepisi
veliko_slovo:
	addb $'a'-'A', %cl
	movb %cl,drugi_string(,%edi,1)
	incl %esi
	incl %edi
	jmp petlja

prepisi:
	movb %cl,drugi_string(,%edi,1)
	incl %esi
	incl %edi
	jmp petlja
preskoci:
	incl %esi
	jmp petlja
palindrom:
	decl %edi
	movl $0, %esi
provera:
	cmpl %edi, %esi
	jge nasao_palindrom
	movb drugi_string(,%esi,1),%cl
	movb drugi_string(,%edi,1),%ch
	cmpb %cl, %ch
	jne  kraj
	incl %esi
	decl %edi	
	jmp provera
nasao_palindrom:
	movb $1, palindrom_status
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
