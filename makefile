# Specify the assembler and its flags
ASM = nasm
AMFLAGS = -f elf64
LD = ld
LDFLAGS =
SRCDIRS = src lib

SRCS := $(wildcard $(addsuffix /*.asm, $(SRCDIRS)))
OBJS = $(SRCS:.asm=.o)
TARGET = program

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

%.o: %.asm
	$(ASM) $(AMFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

