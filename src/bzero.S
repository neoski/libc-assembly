[BITS 64]
	global bzero

	section .text

bzero:	push rbp		;; prologue
	mov rbp, rsp

	dec rsi
loop:	cmp rsi, -1
	je end
	mov byte[rdi + rsi], 0
	dec rsi
	jmp loop
	
end:	mov rsp, rbp		;; epilogue
	pop rbp
	ret
	
