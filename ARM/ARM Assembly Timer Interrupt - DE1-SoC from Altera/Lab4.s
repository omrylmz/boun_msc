.include "address_map_arm.s"

.section .vectors, "ax"
LDR PC, =SERVICE_RESET 				// reset vector
LDR PC, =SERVICE_UND 				// undefined instruction vector
LDR PC, =SERVICE_SVC 				// software interrrupt vector
LDR PC, =SERVICE_ABT_INST			// aborted prefetch vector
LDR PC, =SERVICE_ABT_DATA 			// aborted data vector
.word 0 							// unused vector
LDR PC, =SERVICE_IRQ 				// IRQ interrupt vector
LDR PC, =SERVICE_FIQ 				// FIQ interrupt vector

.text
.global _start
_start:
MOV R1, #0b11010010
MSR CPSR_c, R1 						// change to IRQ mode with interrupts disabled
LDR SP, =0xFFFFFFFF - 3 			// set IRQ stack to top of A9 on-chip memory

MOV R1, #0b11010011
MSR CPSR_c, R1 						// change to SVC mode with interrupts disabled
LDR SP, =0x3FFFFFFF - 3 			// set SVC stack to top of DDR3 memory

BL CONFIG_GIC 						// configure the ARM generic interrupt controller
BL CONFIG_INTERVAL_TIMER 			// configure the FPGA interval timer

MOV R8, #0
MOV R9, #0

MOV R10, #0
LDR R1, =0xFF202000 
STR R10, [R1]
MOV R1, #0b01010011 				// IRQ unmasked, MODE = SVC
MSR CPSR_c, R1

MOV R4, #0
MOV R7, #1
LDR R5, =0xFF200000
STR R7, [R5]

RET:
LDR R6, =50000000
BL DELAY
CMP R4, #0
LSLEQ R7, #1
LSRNE R7, #1
CMP R7, #1024
MOVEQ R7, #256
MOVEQ R4, #1
CMP R7, #0
MOVEQ R7, #2
MOVEQ R4, #0
STR R7, [R5]
B RET

DELAY:	STMFD SP!, {R7, R5, R14}
		INNER:	SUB R6, #1
				CMP R6, #0
				BNE INNER
		LDMFD SP!, {R7, R5, R15}

LOOP: B LOOP


		
CONFIG_GIC:
/* configure the FPGA interval timer*/
LDR R0, =0xFFFED848 				// ICDIPTRn: processor targets register
LDR R1, =0x00000001 				// set targets to cpu0
STR R1, [R0]
LDR R0, =0xFFFED108 				// ICDISERn: set enable register
LDR R1, =0x00000100 				// set interrupt enable
STR R1, [R0]

/* configure the GIC CPU interface */
LDR R0, =0xFFFEC100 				// base address of CPU interface

/* Set Interrupt Priority Mask Register (ICCPMR) */
LDR R1, =0xFFFF 					// enable interrupts of all priorities levels
STR R1, [R0, #0x04] 				// ICCPMR

/* Set the enable bit in the CPU Interface Control Register (ICCICR).*/
MOV R1, #1
STR R1, [R0, #0x00] 				// ICCICR

/* Set the enable bit in the Distributor Control Register (ICDDCR).*/
LDR R0, =0xFFFED000
STR R1, [R0, #0x00] 				// ICDDCR
BX LR

CONFIG_INTERVAL_TIMER:
LDR R0, =0xFF202000 				// Interval timer base address
LDR R1, =100000000					// 1/(100 MHz) ×(100000000) = 1000 msec
STR R1, [R0, #0x8] 					// store the low half word of counter start value
LSR R1, R1, #16
STR R1, [R0, #0xC] 					// high half word of counter start value

// start the interval timer, enable its interrupts
MOV R1, #0x7 						// START = 1, CONT = 1, ITO = 1
STR R1, [R0, #0x4]
BX LR



SERVICE_IRQ:
STMFD SP!, {R1-R7, LR} 				// save registers
/* get the interrupt ID from the GIC */
LDR R4, =0xFFFEC100 				// GIC CPU interface
LDR R5, [R4, #0x0C] 				// read the ICCIAR

INTERVAL_TIMER_CHECK:
CMP R5, #72 						// check for FPGA timer interrupt
BNE EXIT_IRQ
BL TIMER_ISR
B EXIT_IRQ

EXIT_IRQ:
STR R5, [R4, #0x10] 				// Write to end-of-interrupt register (ICCEOIR)
LDMFD SP!, {R1-R7, LR}
SUBS PC, LR, #4



TIMER_ISR:
STMFD SP!, {R4-R7}
LDR R1, =0xFF202000 				// interval timer base address
STR R0, [R1]

LDR R1, =0xFF200020 				// 7 segment base address

ADD R8, R8, #1
CMP R8, #10
MOVEQ R8, #0
ADDEQ R9, R9, #1
CMP R9, #6
MOVEQ R9, #0

CMP R8, #0
MOVEQ R10, #0b00111111
STR R10, [R1]

CMP R8, #1
MOVEQ R10, #0b00000110
STR R10, [R1]

CMP R8, #2
MOVEQ R10, #0b01011011
STR R10, [R1]

CMP R8, #3
MOVEQ R10, #0b01001111
STR R10, [R1]

CMP R8, #4
MOVEQ R10, #0b01100110
STR R10, [R1]

CMP R8, #5
MOVEQ R10, #0b01101101
STR R10, [R1]

CMP R8, #6
MOVEQ R10, #0b01111101
STR R10, [R1]

CMP R8, #7
MOVEQ R10, #0b00000111
STR R10, [R1]

CMP R8, #8
MOVEQ R10, #0b01111111
STR R10, [R1]

CMP R8, #9
MOVEQ R10, #0b01101111
STR R10, [R1]

CMP R9, #0
ADDEQ R10, R10, #0b0011111100000000
STR R10, [R1]

CMP R9, #1
ADDEQ R10, R10, #0b0000011000000000
STR R10, [R1]

CMP R9, #2
ADDEQ R10, R10, #0b0101101100000000
STR R10, [R1]

CMP R9, #3
ADDEQ R10, R10, #0b0100111100000000
STR R10, [R1]

CMP R9, #4
ADDEQ R10, R10, #0b0110011000000000
STR R10, [R1]

CMP R9, #5
ADDEQ R10, R10, #0b0110110100000000
STR R10, [R1]


LDMFD SP!, {R4-R7}
BX LR



SERVICE_RESET:
B _start

SERVICE_UND:
B SERVICE_UND

SERVICE_SVC:
B SERVICE_SVC

SERVICE_ABT_DATA:
B SERVICE_ABT_DATA

SERVICE_ABT_INST:
B SERVICE_ABT_INST

SERVICE_FIQ:
B SERVICE_FIQ
.end