[BITS 64]
	global strlen

	section .text
	
strlen:	push rbp		;; prologue
	mov rbp, rsp
	
	xor rcx,rcx	
check:	cmp byte[rdi+rcx], 0
	jz end
	inc rcx
	jmp check
	
end:	mov rax,rcx
	
	mov rsp, rbp		;;  epilogue
	pop rbp	
	ret

