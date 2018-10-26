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


@ u8 god_number_of_set_bits(u32 val)
.globl god_number_of_set_bits
god_number_of_set_bits:
	LSR	R3, R0, #1
	BIC	R3, R3, #0xAAAAAAAA
	SUBS	R1, R0, R3
	LSR	R3, R1, #2
	BIC	R2, R3, #0xCCCCCCCC
	BIC	R3, R1, #0xCCCCCCCC
	ADD	R3, R3, R2
	ADD	R2, R3, R3, LSR #4
	BIC	R2, R3, #0xF0F0F0F0
	MVN	R3, #0xFEFEFEFE
	MUL	R3, R2, R3
	LSR	R0, R3, #0x18
	BX	LR
