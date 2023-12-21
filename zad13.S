# Write an assembly program that finds the indices of all minimum and maximum elements in an array.
# Autor: Dejana Sevic, SV63/2023

.section .data
	niz:	.long 2,3,4,5,2,2,5,1,2,4,5
	niz_len = (.-niz)/4
	niz_index_max:	.fill niz_len, 4, -1
	niz_index_min:	.fill niz_len, 4, -1
.section .text
.globl main
main:
	movl $niz, %eax
	movl $0, %esi
	movl (%eax, %esi, 4), %ebx	#minmalni element postavi kao prvi element niza
	movl (%eax, %esi, 4), %ecx	#maksimalni element postavi kao prvi element niza

petlja:
	cmpl $niz_len, %esi
	jge nasao_ekstreme
	movl (%eax, %esi, 4), %edx
	incl %esi
	cmpl %edx, %ebx
	jle proveri_max
	movl %edx, %ebx
	jmp petlja

proveri_max:
	cmpl %edx, %ecx
	jge petlja
	movl %edx, %ecx
	jmp petlja

nasao_ekstreme:
	movl $-1, %eax
	movl $0, %esi
	movl $0, %edi
	
provera:
	incl %eax
	cmpl $niz_len, %eax
	jge kraj
	movl niz(,%eax,4), %edx
provera_min:
	cmpl %edx, %ebx
	je nasao_min
provera_max:
	cmpl %edx, %ecx
	je nasao_max
	jmp provera
		
nasao_min:
	movl %eax, niz_index_min(,%esi,4)
	incl %esi
	jmp provera_max

nasao_max: 
	movl %eax, niz_index_max(,%edi,4)
	incl %edi
	jmp provera
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
	
	
	
