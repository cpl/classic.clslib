/*
   Copyright 2018 Alexandru-Paul Copil

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


.section .text


@ void ctx_load(ctx* from)
@ .globl ctx_load
@ ctx_load:
@ 	LDR	R1, [R0, #0x40]
@ 	MSR	SPSR, R1
@ 	LDMIA	R0, {R0-R14}


@ void ctx_copy(ctx* from, ctx* to)
.globl ctx_copy
ctx_copy:
	PUSH	{R0, R1}

	LDMIA	R0!, {R2-R12}				@ Copy one context
	STMIA	R1!, {R2-R12}				@ to another
	LDMIA	R0,  {R2-R7 }				@
	STMIA	R1,  {R2-R7 }				@

	POP	{R0, R1}				@
	BX	LR					@ Return


@ void ctx_scpu(ctx* from, ctx* to)
.globl ctx_scpu
ctx_scpu:
	PUSH	{R0-R3}
	MRS	R3, CPSR				@ Save initial mode

	MOV	R2, #(0b00011111|0b10000000|0b01000000)	@ Switch to SYS mode
	MSR	CPSR_c, R2				@ disable interrupts

	MOV	R2, SP					@ Get  USR SP
	STR	R2, [R0, #0x34]				@ Save USR SP in CTX
	MOV	R2, LR					@ Get  USR LR
	STR	R2, [R0, #0x38]				@ Save USR LR in CTX

	LDR	R2, [R1, #0x34]				@ Get CTX SP
	MOV	SP, R2					@ Set USR SP
	LDR	R2, [R1, #0x38]				@ Get CTX LR
	MOV	LR, R2					@ Set USR LR

	MSR	CPSR, R3				@ Restore initial mode
	POP	{R0-R3}					@
	BX	LR					@ Return


@ void ctx_load(ctx* from)
.globl ctx_load
ctx_load:
	LDMIA	R0, {R0-R15}

