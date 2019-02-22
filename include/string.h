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


/* string.h - String support

Support functions to work with `char*` also known as strings.

*/


#ifndef _INC_STRING_H
#define _INC_STRING_H

#include "types.h"
#include "bool.h"

#define STRING_MAX_LEN 65535

void strcpy(char* src, char* dst);
u32  strlen(const char* str);
bool strequ(const char* str, const char* _str);
u32  strchr(char* str,  char c);

#endif
