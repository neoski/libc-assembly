[BITS 64]
		global strnlen

		section .text
	
strnlen:	push rbp		;; prologue
		mov rbp, rsp
	
		mov rcx, rsi	
check:		cmp byte[rdi+rcx], 0
		jz end
		inc rcx
		jmp check
	
end:		sub rcx, rsi
		mov rax,rcx
	
		mov rsp, rbp		;;  epilogue
		pop rbp	
		ret

