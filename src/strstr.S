[BITS 64]
	global strstr

	section .text
	
strstr:	push rbp		;; prologue
	mov rbp, rsp
	
	xor rcx,rcx
	
loop:	cmp byte[rdi+rcx], 0
	je null
	jmp find
endf:	inc rcx
	jmp loop
	
find:	xor r10, r10
	xor r11, r11

loopf:	cmp byte[rsi + r10], 0
	je end
	add rdi, rcx
	cmp byte[rdi + r10], 0
	je null
	mov r11b, byte[rdi + r10]
	sub rdi, rcx
	cmp byte[rsi + r10], r11b
	jne endf
	inc r10
	jmp loopf

null:	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret
	
end:	add rcx, rdi
	mov rax, rcx
	mov rsp, rbp		;;  epilogue
	pop rbp	
	ret

