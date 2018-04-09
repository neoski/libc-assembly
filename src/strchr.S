[BITS 64]
	global strchr
	
	section .text

strchr:	push rbp	;; prologue
	mov rbp, rsp

loop:	cmp byte[rdi], sil
	jz found
	cmp byte[rdi], 0
	jz nfound
	inc rdi
	jmp loop
	
found:	mov rax, rdi
	jmp end
nfound:	mov rax, 0
	
end:	mov rsp, rbp	;; epilogue
	pop rbp
	ret
