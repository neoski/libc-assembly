[BITS 64]
		global strcspn
	
		section .text
	
strcspn:	push rbp		;; prologue
		mov rbp, rsp
	
		xor rcx,rcx
	
loop:		cmp byte[rdi+rcx], 0
		je end	
		jmp find			
endf:		inc rcx		
		jmp loop	
	
find:		xor r10, r10
		xor r11, r11

loopf:		cmp byte[rsi + r10], 0
		je endf
		cmp byte[rdi + rcx], 0
		je endf
		mov r11b, byte[rdi + rcx]
		cmp byte[rsi + r10], r11b
		je end
		inc r10
		jmp loopf

end:		mov rax, rcx
		mov rsp, rbp		;;  epilogue
		pop rbp	
		ret

