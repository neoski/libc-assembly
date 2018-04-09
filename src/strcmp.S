[BITS 64]
	global strcmp
	
	section .text

strcmp:	push rbp	;; prologue
	mov rbp, rsp

	xor rcx,rcx
loop:	
	mov al, [rdi + rcx]
	mov ah, [rsi + rcx]
	cmp al, 0
	je end
	cmp ah, 0
	je end
	cmp al, ah
	jne end
	inc rcx
	jmp loop
	
end:	sub al, ah
	movsx rax, al
	
	mov rsp, rbp	;; epilogue
	pop rbp
	ret
