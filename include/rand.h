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


/* rand.h - Random number generation

Random number generation function definiton standards.

*/




#ifndef _INC_RAND_H
#define _INC_RAND_H

#include "types.h"

extern void rand_init(u32 value);
extern u32  rand();
extern u32  rand_range(u32 min, u32 max);

#endif
