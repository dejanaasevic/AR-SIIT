# Sorting: Create a sorting algorithm to arrange the elements in ascending or descending order.
# Autor: Dejana Sevic, SV63/2023

.section .data
	niz:	.long 4,7,2,9,1
	niz_len=(.-niz)/4 
.section .text
.globl main
main:
	movl $niz, %eax
	movl $niz_len, %esi

spoljasnja_petlja:
	decl %esi
	jz kraj
	movl $niz_len, %edi
	
unutrasnja_petlja:
	decl %edi
	jz spoljasnja_petlja
	
	movl (%eax, %edi,4), %ebx
	movl -4(%eax, %edi,4), %ecx
	cmpl %ebx, %ecx
	jl unutrasnja_petlja
	
	xchgl %ebx, %ecx
	movl %ebx, (%eax, %edi,4)
	movl %ecx, -4(%eax, %edi,4)
	jmp unutrasnja_petlja 

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
