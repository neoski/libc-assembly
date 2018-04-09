[BITS 64]
	global rindex

	section .text
	
rindex:	push rbp		;; prologue
	mov rbp, rsp
	
	xor rcx,rcx
	
check:	cmp byte[rdi+rcx], 0
	jz find
	inc rcx
	jmp check
	
find:	cmp rcx, -1
	je null
	cmp byte[rdi+rcx], sil
	je end
	dec rcx
	jmp find

null:	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret
	
end:	add rcx, rdi
	mov rax, rcx
	mov rsp, rbp		;;  epilogue
	pop rbp	
	ret

