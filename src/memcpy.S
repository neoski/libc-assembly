[BITS 64]
	global memcpy

	section .text

memcpy:	push rbp		;; prologue
	mov rbp, rsp

	xor rcx, rcx
loop:	cmp rdx, 0
	jz end
	mov al, [rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	dec rdx
	jmp loop
	
end:	mov rax,rdi
	mov rsp, rbp		;; epilogue
	pop rbp
	ret
	
