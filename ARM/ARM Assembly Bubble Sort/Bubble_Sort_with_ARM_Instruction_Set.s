.text
.equ LEDs, 0xFF200000
.global _start
_start:
/* PUT YOUR CODE HERE*/
LDR R4, DataNum
LDR R3, =SortData
SUB R4, R4, #1
OUTER:	TEQ R4, #0
		BEQ FINAL
		MOV R5, #0
		INNER:	TEQ R5, R4
				BEQ OUTER_2
				LDR R0, [R3, R5, LSL #2]
				ADD R5, R5, #1
				LDR R1, [R3, R5, LSL #2]
				CMP R0, R1
				BLT INNER
				STR R0, [R3, R5, LSL #2]
				SUB R5, R5, #1
				STR R1, [R3, R5, LSL #2]
				ADD R5, R5, #1
				B INNER
OUTER_2:SUBS R4, R4, #1
		BNE OUTER

/* Before stop turn on all LEDs to show that sorting is finished*/
FINAL:	MVN R9, #0
		LDR R10, =LEDs
		STR R9, [R10]
STOP:	B STOP /*Branch unconditionally to STOP*/

DataNum: .word 10 /* Specify the number of data items. */
SortData: .word 0x7FFFFFF1, 0x7FFFFFFF, 0x00000000, 0x80000000, 0x80000001, 0xA1234332, 0x20141020, 0x6FFFFFFF, 0xA1234320, 0x20141F20
.end


/*	Pseudo-code implemented:
//	R4 = i; R5 = j; i is the right part's index, never zero. j is the left part's index, never equal to i.
int i = 9;
while(i != 0)
{
	int j = 0;
	while(j != i)
	{
		if( GT /*If left is greater than right, swap*/)
			swap();	
		j++;
	}
	i--;
}
*/

/* Line 19-22 can be replaced using stack
				PUSH {R0, R1}
				POP {R1}
				POP {R0}
				STR R1, [R3, R5, LSL #2]
				SUB R5, R5, #1
				STR R0, [R3, R5, LSL #2]
*/