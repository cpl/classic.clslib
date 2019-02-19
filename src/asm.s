/*
   Copyright 2018-2019 Alexandru-Paul Copil

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


.section .text.usr


@ void PUT32(u32 addr, u32 val)
.globl PUT32
PUT32:
	STR	R1, [R0]
	BX	LR


@ void PUT16(u32 addr, u16 val)
.globl PUT16
PUT16:
	STRH	R1, [R0]
	BX	LR


@ void PUT08(u32 addr, u8 val)
.globl PUT08
PUT08:
	STRB	R1, [R0]
	BX	LR


@ u32 GET32(u32 addr)
.globl GET32
GET32:
	LDR	R0, [R0]
	BX	LR


@ u16 GET16(u32 addr)
.globl GET16
GET16:
	LDRH	R0, [R0]
	BX	LR


@ u8 GET08(u32 addr)
.globl GET08
GET08:
	LDRB	R0, [R0]
	BX	LR


@ u32 GETPC(void)
.globl GETPC
GETPC:
	MOV	R0, PC
	BX	LR


@ u32 GETSP(void)
.globl GETSP
GETSP:
	MOV	R0, SP
	BX	LR


@ u32 GETLR(void)
.globl GETLR
GETLR:
	MOV	R0, LR
	BX	LR


@ void CPUSH(u32 val)
.globl CPUSH
CPUSH:
	PUSH {R0}
	BX LR


@ u32 POP(void)
.globl CPOP
CPOP:
	POP {R0}
	BX LR
