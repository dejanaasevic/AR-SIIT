# String Concatenation: Combine two strings into one.
# Autor: Dejana Sevic, SV63/2023

.section .data
	prvi_string:	.ascii "Ne mogu vise ovo.\0"
	prvi_string_len = (.-prvi_string)/1
	drugi_string:	.ascii "Mrzim asembler.\0"
	drugi_string_len = (.-drugi_string)/1
	treci_string:	.fill 100,1,0
.section .text
.globl main
main:
	movl $prvi_string_len, %eax
	decl %eax
	movl $drugi_string_len, %ebx
	movl $0, %esi	#indeks za prvi i drugi niz
	movl $0, %edi	#indeks za treci niz

prepisi_prvi_string:
	cmpl %eax, %esi
	jge dalje	
	movb prvi_string(,%esi,1), %cl
	movb %cl, treci_string(,%edi,1)
	incl %esi
	incl %edi
	jmp prepisi_prvi_string
	
dalje:
	movl $0, %esi
prepisi_drugi_string:
	cmpl %ebx, %esi
	jge kraj	
	movb drugi_string(,%esi,1), %cl
	movb %cl, treci_string(,%edi,1)
	incl %esi
	incl %edi
	jmp prepisi_drugi_string
kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
