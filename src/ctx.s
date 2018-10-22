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


@ void ctx_copy(ctx* from, ctx* to)
.globl ctx_copy
ctx_copy:
	LDMIA	R0!, {R2-R12}		@ Load R0-R10  in R2-R12
	STMIA	R1!, {R2-R12}		@ Save R2-R12  as R0-R10
	LDMIA	R0,  {R2-R6}		@ Load R11-R15 in R2-R6
	STMIA	R1,  {R2-R6}		@ Save R2-R6   as R11-R15
	BX	LR


@ void ctx_load(ctx* from)
.globl ctx_load
ctx_load:
	LDMIA	R0, {R0-R15}


@ void ctx_user(ctx* from, ctx* to)
.globl ctx_user
ctx_user:
	MRS	R3, CPSR				@ Store proc mode

	MOV	R2, #(0b00011111|0b10000000|0b01000000)	@ Switch to USR mode
	MSR	CPSR_c, R2				@ disable IRQ and FIQ

	MOV	R2, SP					@ Get SP from USR
	STR	R2, [R0, #-8]				@ Set SP in task CTX
	MOV	R2, LR					@ Get LR from USR
	STR	R2, [R0, #-4]				@ Set LR in task CTX

	LDR	R2, [R1, #-8]				@ Get SP from task CTX
	MOV	SP, R2					@ Set SP in USR mode
	LDR	R2, [R1, #-4]				@ Get LR from task CTX
	MOV	LR, R2					@ Set LR in USR mode

	MSR	CPSR_c, R3				@ Restore proc mode
	BX	LR					@ Return
