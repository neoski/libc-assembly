[BITS 64]
	global memmove

	section .text

memmove:	push rbp		;; prologue
		mov rbp, rsp

init:		xor rcx, rcx		;; init counter 
		;; mov rax, rdi
		;; sub rax, rsi		;; get distance 
		;; cmp rax, rdx		;; compare to length
		cmp rdi, rsi
		jbe copy_left

		dec rdx
copy_right:	cmp rdx, -1
		je end
		mov al, byte[rsi + rdx]
		mov byte[rdi + rdx], al
		dec rdx
		jmp copy_right
	
copy_left:	cmp rdx, rcx
		je end
		mov al, [rsi + rcx]
		mov [rdi + rcx], al
		inc rcx
		jmp copy_left

		
end:		mov rax,rdi
		mov rsp, rbp		;; epilogue
		pop rbp
		ret
	
