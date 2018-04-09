[BITS 64]
	global strcpy

	section .text
	
strcpy:	push rbp		;; prologue
	mov rbp, rsp
	
	xor r10, r10
	xor r11b, r11b
	
loop:	cmp byte[rsi + r10], 0
	je end
	mov r11b, byte[rsi + r10]
	mov byte[rdi + r10], r11b
	inc r10
	jmp loop
	
end:	mov byte[rdi + r10], 0
	mov rax, rdi
	mov rsp, rbp		;;  epilogue
	pop rbp	
	ret

