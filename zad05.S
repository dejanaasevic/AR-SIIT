# Subarray Sum: Summarize elements from the first to the seventh index of the array.
# Autor: Dejana Sevic, SV63/2023

.section .data
	niz:	.long 1,32,14,56,11,7,8,9,12,24,44
	niz_len= (.-niz)/4
	start:	.long 2
	end:	.long 7
	sum:	.long 0
	greska:	.byte 0
.section .text
.globl main
main:
	movl $niz, %eax		#adresa niza
	movl start, %esi	# pocetak intervala
	movl end, %ecx	    # kraj intervala
	movl $0, %ebx		# suma
	
	cmpl $niz_len, %esi
	jge pogreska
	cmpl $0, %esi
	jl pogreska
	cmpl $niz_len, %ecx 
	jge pogreska
	cmpl $0, %ecx
	jl pogreska
	cmpl %ecx, %esi
	jg pogreska
	
petlja:
	cmpl %ecx, %esi
	jg kraj
	addl (%eax, %esi, 4), %ebx
	incl %esi
	jmp petlja

pogreska:
	movb $1, greska
kraj:
	movl %ebx, sum
	movl $1, %eax
	movl $0, %ebx
	int $0x80
