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


#include "types.h"
#include "ctype.h"
#include "conv.h"


// convert string to unsigned 32 bit integer, not checking for overflow
u32 conv_str_u32(const char* str) {
    u32 ret = 0;

    while(*str)
        ret = ret*10 + (*(str++)-'0');

    return ret;
}


// convert hex string to unsigned 32 bit integer, not checking for anything
u32 conv_hex_u32(const char* hex) {
    return (
        chartou8(hex[2]) << 28 |
        chartou8(hex[3]) << 24 |
        chartou8(hex[4]) << 20 |
        chartou8(hex[5]) << 16 |
        chartou8(hex[6]) << 12 |
        chartou8(hex[7]) <<  8 |
        chartou8(hex[8]) <<  4 |
        chartou8(hex[9])
    );
}