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


#include "malloc.h"
#include "types.h"


/* Note

Must implement a systemcall `malloc` that takes only u32 size and then calls
an internal function to get the current task, then the heap location

*/

void* malloc(u32 size);
void* calloc(u32 size);
void  free(void* addr);

