Just to bring a comparison between C language code , Assembly code , and Arm instructions set   

1) Initializing `fact` function / label:   

   C code :   
   ```c
   int FACT(int n) {
   ```   
   Assembly code :      
   ```asm
   FACT:
        pushq	%rbp
        .seh_pushreg	%rbp
        movq	%rsp, %rbp
        .seh_setframe	%rbp, 0
   ```
   Arm Instructions :
   ```asm
   FACT:
        SUBI SP , SP , #16
        STR LR , [SP , #8]
        STR X0 , [SP , #0]
   ```
2) Declare Base case for recursion    
    
   C code:
   ```c
   if(n < 1) return 1;
   ```   
      
   Assembly Code:   
      
   call `.L3` label inside `FACT` label
   ```asm
   	movl	$1, %eax
	jmp	.L3
   ```
   declare `.L3` label inside `FACT` label
   ```asm
   .L3:
         addq	$32, %rsp
         popq	%rbp
         ret
   ```
   
   ARM Instructions:   
   
   ```asm
      ADDI X1 , XZR , #1
      ADDI SP , SP , #16

      BR LR
   ```
4)


