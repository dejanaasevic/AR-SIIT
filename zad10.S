# Whitespace Trimming: Remove leading and trailing whitespaces from a string.
# Autor: Dejana Sevic, SV63/2023

.section .data
	s:	.ascii	"      Neki tekst.           \0"
	s_len = .-s
.section .text
.globl main
main:
	movl $s, %eax
kraj_stringa:
	cmpb $0, (%eax)
	je razmaci_na_kraju
	incl %eax
	jmp kraj_stringa
	
razmaci_na_kraju:
	cmpb $' ', -1(%eax)
	jne izbaci_na_kraju
	decl %eax
	jmp razmaci_na_kraju

izbaci_na_kraju:
	movb $0, (%eax)

razmaci_na_pocetku:
	movl $s, %eax
	cmpb $' ', (%eax)
	jne kraj

izbaci_na_pocetku:
	cmpl $0, (%eax)
	je razmaci_na_pocetku
	movb 1(%eax), %bl
	movb %bl, (%eax)
	incl %eax
	jmp izbaci_na_pocetku

kraj:
	movl $1, %eax
	movl $0, %ebx
	int $0x80
