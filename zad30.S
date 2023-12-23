# Counting Vowels and Consonants: Implement a function that counts the number of vowels and consonants in a string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii "Dejana Sevic\0"
	s_len =  (.-s)/1
	br_suglasnika:	.long 0
	br_samoglasnika:	.long 0 
.section .text
.globl main
main:
	movl $0, %esi
	movl $0, %eax	#samoglasnici	
	movl $0, %ebx	#suglasnici
petlja:
	cmpl $s_len, %esi
	jge kraj	
	movb s(,%esi,1), %cl
	cmpb $'A',%cl
	jl dalje
	cmpb $'Z', %cl
	jle nasao_veliko_slovo
	cmpb $'a', %cl
	jl dalje
	cmpb $'z',%cl
	jle nasao_malo_slovo
	jg dalje
	
dalje:
	incl %esi
	jmp petlja
	
nasao_veliko_slovo:
	cmpb $'A', %cl
	je nasao_samoglasnik
	cmpb $'E', %cl
	je nasao_samoglasnik
	cmpb $'I', %cl
	je nasao_samoglasnik
	cmpb $'O' , %cl
	je nasao_samoglasnik
	cmpb $'U', %cl
	je nasao_samoglasnik
	incl %ebx
	jmp dalje

nasao_malo_slovo:
	cmpb $'a', %cl
	je nasao_samoglasnik
	cmpb $'e', %cl
	je nasao_samoglasnik
	cmpb $'i', %cl
	je nasao_samoglasnik
	cmpb $'o' , %cl
	je nasao_samoglasnik
	cmpb $'u', %cl
	je nasao_samoglasnik
	incl %ebx
	jmp dalje
	
nasao_samoglasnik:
	incl %eax
	jmp dalje
kraj:
	movl %eax, br_samoglasnika
	movl %ebx, br_suglasnika 
	movl $1, %eax
	movl $0, %ebx
	int $0x80
