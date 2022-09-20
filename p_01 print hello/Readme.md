# print hello

new label is created in assembly code when ``` printf("hello"); ``` statement is given in C   

```asm
.LC0:   
	.ascii "hello\0"   
	.text   
	.globl	main   
	.def	main;	.scl	2;	.type	32;	.endef   
	.seh_proc	main
```

printf call in assembly , inside `main` label:   
   
```asm
   leaq	.LC0(%rip), %rcx
   call	printf
```
