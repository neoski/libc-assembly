[BITS 64]
	global strcasecmp
	
	section .text

strcasecmp:	push rbp	;; prologue
		mov rbp, rsp

		xor rcx,rcx
	
loop:		mov al, [rdi + rcx]
		mov ah, [rsi + rcx]
		jmp check 
endc:		jmp check2	
endc2:		cmp al, 0	
		je end	
		cmp ah, 0
		je end
		cmp al, ah
		jne end
		inc rcx
		jmp loop
	
check:		cmp al, 65
		jb endc		
		cmp al, 90
		ja endc
		add al, 32
		jmp endc

check2:		cmp ah, 65
		jb endc2
		cmp ah, 90
		ja endc2
		add ah, 32
		jmp endc2
	
end:		sub al, ah
		movsx rax, al
	
		mov rsp, rbp	;; epilogue
		pop rbp
		ret
