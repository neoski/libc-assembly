[BITS 64]
		global strpbrk
	
		section .text
	
strpbrk:	push rbp		;; prologue
		mov rbp, rsp
	
		xor rcx,rcx

loop:		cmp byte[rdi+rcx], 0
		je null
		jmp find
endf:		inc rcx
		jmp loop
	
find:		xor r10, r10
		mov r11b, byte[rdi + rcx]

loopf:		cmp byte[rsi + r10], 0
		je endf
		cmp byte[rsi + r10], r11b
		je end
		inc r10
		jmp loopf
	
null:		mov rax, 0
		mov rsp, rbp
		pop rbp
		ret
	
end:		add rcx, rdi
		mov rax, rcx
		mov rsp, rbp		;;  epilogue
		pop rbp	
		ret
	
