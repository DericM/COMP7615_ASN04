#Deric Mccadden, A00751277
#2018-09-30

all: asm_io.o math.o
	gcc -m32 -o math math.o driver.c asm_io.o

asm_io.o: asm_io.asm
	nasm -f elf32 -d ELF_TYPE asm_io.asm

math.o: math.asm
	nasm -f elf32 math.asm

clean:
	rm -f *.o
	rm -f math
