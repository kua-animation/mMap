#/bin/bash



run=$1

clear 

nasm -felf64 ani-Mmap/text.asm -o ani-Mmap/text.o
nasm -felf64 Mmap/println.asm -o Mmap/println.o
nasm -felf64 Mmap/block2.asm -o Mmap/block2.o
#nasm -felf64 Mmap/block.asm -o Mmap/block.o
#nasm -felf64 ani-Mmap/character.asm -o ani-Mmap/character.o

#ld ani-Mmap/text.o ani-Mmap/character.o Mmap/println.o Mmap/block.o -o a
#ld ani-Mmap/text.o Mmap/println.o Mmap/block.o -o a
ld ani-Mmap/text.o Mmap/println.o Mmap/block2.o -o a


if [[ $run == true ]] 
then
	./a
fi
