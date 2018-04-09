[BITS 64]
		global strrchr
	
		section .text

strrchr:	push rbp	;; prologue
		mov rbp, rsp

		xor r10, r10
goend:		cmp byte[rdi + r10], 0
		je loop
		inc r10
		jmp goend
	
loop:		cmp r10, -1
		je nfound
		cmp byte[rdi + r10], sil
		je found
		dec r10
		jmp loop
	
found:		add rdi, r10
		mov rax, rdi
		jmp end		
nfound:		mov rax, 0
	
end:		mov rsp, rbp	;; epilogue
		pop rbp		
		ret
