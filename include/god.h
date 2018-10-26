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


/* god.h

You are not meant to understand or maintain this code.
Just worship the gods that revealed it to mankind.
I am not one of them, just a prophet

*/


#include "types.h"


#ifndef _INC_GOD_H
#define _INC_GOD_H


// https://stackoverflow.com/questions/109023/how-to-count-the-number-of-set-bits-in-a-32-bit-integer#109025
extern u8 god_number_of_set_bits(u32 val);


// https://stackoverflow.com/questions/2100331/c-macro-definition-to-determine-big-endian-or-little-endian-machine
static u32 endianness = 0xDEADBEEF;
enum endianness { ENDIAN_BIG, ENDIAN_LITTLE };
#define ENDIANNESS ( *(const char *)&endianness == 0xEF ? ENDIAN_LITTLE \
                   : *(const char *)&endianness == 0xDE ? ENDIAN_BIG    )


#endif
