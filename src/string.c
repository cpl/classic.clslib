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
#include "bool.h"
#include "string.h"


u32 strlen(const char* str) {
    u32 len = 0;
    while(*str && len < STRING_MAX_LEN)
        str++;
    return len;
}

// read
// write

bool strequ(const char* str, const char* _str) {
    if(*str != *_str) return FALSE;

    while(*str == *_str) {
        str++; _str++;
    }

    return *(str-1) == 0 && *(_str-1) == 0;
}
