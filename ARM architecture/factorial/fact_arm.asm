FACT:
	SUBI SP , SP , #16
	STR LR , [SP , #8]
	STR X0 , [SP , #0]
	
	SUBIS XZR , X0 , #1
	B GE L1
	
	ADDI X1 , XZR , #1
	ADDI SP , SP , #16
	
	BR LR
L1:
	SUBI X0 , X0 , #1
	BL FACT
	
	LDR XO , [SP , #0]
	LDR LR , [SP , #8]
	ADDI SP , SP , #16
	MUL X1 , X0 , X1
	
	BR LR
