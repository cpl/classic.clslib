#    Copyright 2018 Alexandru-Paul Copil
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

# ARM GNU Compiler
COMPILER ?= arm-none-eabi

# C FLAGS
CFLAGS := -std=c99 -fpack-struct -fno-builtin -Wno-packed-bitfield-compat -fshort-wchar -Wall -c

# Output name
LIBNAME ?= libcls.a

# Directories
BUILD ?= build
INCLD ?= include
SOURCE ?= src

# Objects
OBJECTS := $(patsubst $(SOURCE)/%.s, $(BUILD)/%.o, $(shell find $(SOURCE) -type f -name '*.s'))
OBJECTS += $(patsubst $(SOURCE)/%.c, $(BUILD)/%.o, $(shell find $(SOURCE) -type f -name '*.c'))

all: $(LIBNAME)

# Generate - Library
$(LIBNAME): $(OBJECTS)
	@rm -rf $(LIBNAME)
	@echo "==== Generating lib: $@"
	@$(COMPILER)-gcc-ar rc $(LIBNAME) $(OBJECTS)
	@md5 $@

# Generate - Objects - ASM
$(BUILD)/%.o: $(SOURCE)/%.s
	@echo "==== Generating ASM object: $@"
	@mkdir -p $(@D)
	@$(COMPILER)-as --reduce-memory-overheads -I $(INCLD)/ $< -o $@

# Generate - Objects - C
$(BUILD)/%.o: $(SOURCE)/%.c
	@echo "==== Generating C   object: $@"
	@mkdir -p $(@D)
	@$(COMPILER)-gcc $(CFLAGS) -I$(INCLD) $< -o $@

clean:
	@rm -rf $(BUILD)/*
	@rm -rf $(LIBNAME)
	@echo "==== CLEAN LIBCLS"
