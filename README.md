# libc-assembly
16 libc (C standard library) functions recoded in assembly (bzero, memcpy, memmove, memset, 
rindex, strcasecmp, strchr, strcmp, strcpy, strcspn, strlen, strncmp, strnlen,
strpbrk, strrchr, strstr).

**Requirements :**

gcc

nasm

**Usage :**

1. git clone https://github.com/neoski/libc-assembly.git

2. cd libc-assembly && make

3. You can use the `libasm.so`

A script is provided (`test.sh`) which compile C files testing the functions 
in a hidden directory (`.test_files`) and make a `diff` of the standard output 
and the one generated when the lib is loaded.

To run it : `./test.sh`

*Note : The current Makefile is correctly setted for MAC OS X.
For Linux, change `CFLAGS = -f macho64` to `CFLAGS = -f elf64`.

**Authors :** Sebastien S. and Benoit Sida

**Github repository :** https://github.com/neoski/libc-assembly

**Made in april 2016.**
