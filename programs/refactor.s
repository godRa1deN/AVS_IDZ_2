	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d "
.LC1:
	.string "while"
.LC2:
	.string "do"
.LC3:
	.string "int"
.LC4:
	.string "char"
.LC5:
	.string "scanf"
	.text
	.globl	find
find:
	endbr64										#rdi = первый аргумент = &s; rsi = второй аргумент = &word																											
	push rbp									#edx = 3-й аргумент = slen; ecx = 4-й аргумент = wordlen
	mov	rbp, rsp
	sub	rsp, 48									#выделяем память на стеке		
	mov	DWORD PTR -4[rbp], 0					#локальная переменная t = 0; &t = rbp-4
	mov	r10d, 0									#локальная переменная count = 0; r10d = count
	mov	eax, ecx
	sub	eax, 1									#eax = wordlen - 1
	mov	r11d, eax								#локальная переменная last = wordlen - 1 = r11d
	jmp	.L2
.L7:
	mov	r15d, 0									#p = 0; r15d = p
	jmp	.L3
.L5:
	add	r15d, 1									#p++
.L3:			
	cmp	r15d, r11d								#cmp p | last
	jg	.L4										#если p > last -> .L4
	mov	ebx, DWORD PTR -4[rbp]					#ebx = t
	mov	eax, r15d								#eax = p
	add	eax, ebx								#eax = p + t
	movsx	r8, eax								#знаково расширяем eax в r8
	mov	rax, rdi								#rax = &s
	add	rax, r8									#rax = &s[p + t]
	movzx	ebx, BYTE PTR [rax]					#bl = s[p + t], беззнаково расширяем в ebx
	movsx	r9, r15d							#r9 = p
	mov	rax, rsi								#rax = &word
	add	rax, r9									#rax = &word[p]
	movzx	eax, BYTE PTR [rax]					#al = word[p], знаково расширяем в eax
	cmp	bl, al									#cmp s[p + t] | word[p]
	je	.L5										#если s[p + t] == word[p] -> .L5
.L4:		
	cmp	r15d, ecx								#cmp p | wordlen
	jne	.L6										#если p != wordlen -> .L6
	add	r10d, 1									#count++
.L6:
	add	DWORD PTR -4[rbp], 1					#t++
.L2:
	mov	eax, edx								#eax = slen
	sub	eax, r11d								#eax = slen - last
	cmp	DWORD PTR -4[rbp], eax					#cmp t | slen - last
	jl	.L7										#если t < slen - last -> .L7
	mov	eax, r10d				
	mov	esi, eax								#esi = второй аргумент = count
	lea	rax, .LC0[rip]									
	mov	rdi, rax								#rdi = первый аргумент = форматная строка = "%d "			
	mov	eax, 0
	call	printf@PLT							#вызов printf
	nop											#пустая команда
	leave
	ret											#стандартный эпилог
	.globl	main
main:
	endbr64										#команда для защиты
	push	rbp
	mov	rbp, rsp								#стандартный пролог
	sub	rsp, 10048								#выделяем памммямть на стеке
	lea r14, -10016[rbp]						#r14 = &s = rbp - 10016
	mov	rdx, QWORD PTR stdin[rip]				#rdx = 3-й аргумент = stdin
	mov	esi, 10000								#esi = 2-й аргумент = 10000
	mov	rdi, r14								#rdi = 1-й аргумент = r14 = &s
	call	fgets@PLT							#вызов fgets
	mov	r13d, 0									#n = 0; r13d = n
	jmp	.L9										#прыгаем в .l9
.L10:
	add	r13d, 1									#n++
.L9:
	mov	eax, r13d								#eax = n
	cdqe									
	movzx	eax, BYTE PTR [r14+rax]				#al = s[n], знаково расширяем в eax
	test	al, al								#выставляем флаги у al
	jne	.L10									#s[n] != 0 -> .L10								
	sub	r13d, 1									#n--
	mov	rdi, r14								#rdi = 1-й аргумент = r14 = &s
	lea	rax, .LC1[rip]					
	mov	rsi, rax								#rsi = 2-й аргумент = адрес строки "while"
	mov	edx, r13d								#edx = 3-й аргумент = n
	mov	ecx, 5									#ecx = 4-й аргумент = 5
	call	find								#вызов find
	mov	rdi, r14								#rdi = 1-й аргумент = r14 = &s
	lea	rax, .LC2[rip]					
	mov	rsi, rax								#rsi = 2-й аргумент = адрес строки "do"
	mov	edx, r13d								#edx = 3-й аргумент = n
	mov	ecx, 2									#ecx = 4-й аргумент = 2
	call	find								#вызов find
	mov	rdi, r14								#rdi = 1-й аргумент = r14 = &s
	lea	rax, .LC3[rip]					
	mov	rsi, rax								#rsi = 2-й аргумент = адрес строки "int"
	mov	edx, r13d								#edx = 3-й аргумент = n
	mov	ecx, 3									#ecx = 4-й аргумент = 3
	call	find								#вызов find
	mov	rdi, r14								#rdi = 1-й аргумент = r14 = &s
	lea	rax, .LC4[rip]					
	mov	rsi, rax								#rsi = 2-й аргумент = адрес строки "char"
	mov	edx, r13d								#edx = 3-й аргумент = n
	mov	ecx, 4									#ecx = 4-й аргумент = 4
	call	find								#вызов find
	mov	rdi, r14								#rdi = 1-й аргумент = r14 = &s
	lea	rax, .LC5[rip]				
	mov	rsi, rax								#rsi = 2-й аргумент = адрес строки "scanf"
	mov	edx, r13d								#edx = 3-й аргумент = n
	mov	ecx, 5									#ecx = 4-й аргумент = 5
	call	find								#вызов find
	mov	eax, 0
	leave			
	ret											#return 0
