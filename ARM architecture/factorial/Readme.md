Just to bring a comparison between C language code , Assembly code , and Arm instructions set   

1) Initializing `FACT` function / label:   

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
2) Declare Base Case for Recursion    
    
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
   declare `.L3` label outside `FACT` label
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
3) Recursive formula

   C language:   
   ```c
   return n*FACT(n-1);
   ```
   
   Assembly Code:   
   ```asm
   
   .L2:   
	movl	16(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %ecx
	call	fact
	imull	16(%rbp), %eax
	
   ```

   ARM Instructions:
   ```asm
   SUBIS XZR , X0 , #1
   B GE L1
   ```
   ```asm
   
   L1:
	SUBI X0 , X0 , #1
	BL FACT
	
	LDR XO , [SP , #0]
	LDR LR , [SP , #8]
	ADDI SP , SP , #16
	MUL X1 , X0 , X1
	
	BR LR
	
   ```
4) End of program
    C langugage :
    ```c
    	}
    ```
    Assembly Language :
    ```asm
    
    ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	
    ```
    
    ARM Instructions:
    for return statement
 
    ```asm
    BR LR
    ```
    
    
Conclusion:    
     Arm instruction set is far differemt from actual assembly code
