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
   Arm instructions :
   ```asm
   FACT:
        SUBI SP , SP , #16
        STR LR , [SP , #8]
        STR X0 , [SP , #0]
   ```
