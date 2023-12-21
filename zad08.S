# Unique Elements: Write a program to identify and count unique elements in the array.
# Autor: Dejana Sevic, SV63/2023

.section .data
	niz: .long 4,7,2,9,6,4,7,9,1,9
	niz_len = (.-niz)/4
	br:	.long 0

.section .text
.globl main
main:
	movl $0, %esi		#index za spoljasnju petlju - i
	movl $0, %ebx		#brojac unique elemenata
	movl $niz_len, %ecx #index kraja niza
	

spoljasnja_petlja:
	cmpl %ecx, %esi
	jge kraj
	movl niz(, %esi,4), %eax
	movl $0, %edi		#index za unutrasnju petlju - j
	movl $0, %edx		#trenutni brojac

unutrasnja_petlja:
	cmpl %ecx, %edi
	jge kraj_unutrasnje_petlje
	cmpl niz(, %edi,4), %eax
	jne dalje
	incl %edx
dalje:
	incl %edi
	jmp unutrasnja_petlja

kraj_unutrasnje_petlje:
	cmpl $1, %edx
	jne sledeci_element
	incl %ebx
	
sledeci_element:
	incl %esi
	jmp spoljasnja_petlja
	
kraj:
	movl %ebx, br
	movl $1, %eax
	movl $0, %ebx
	int $0x80

