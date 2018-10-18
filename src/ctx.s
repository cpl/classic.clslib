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


@ void ctx_switch(ctx* save, ctx* load)
@ STMDB, LDMIA
.globl ctx_switch
ctx_switch:
	STMIA	R0, {R0-R15}
	LDMDB	R1, {R0-R15}


@ void ctx_save(ctx* save)
.globl ctx_save
ctx_save:
	STMIA	R0, {R0-R15}
	BX	LR

@ void ctx_load(ctx* load)
.globl ctx_load
ctx_load:
	LDMIA	R0, {R0-R15}
