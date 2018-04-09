[BITS 64]
	global memset

	section .text

memset:	push rbp		;; prologue
	mov rbp, rsp

	mov rax,rdi
loop:	cmp rdx, 0
	jz end
	mov byte[rdi], sil
	inc rdi
	dec rdx
	jmp loop
	
end:	mov rsp, rbp		;; epilogue
	pop rbp
	ret
	
