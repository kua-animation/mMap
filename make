#/bin/bash



run=$1

clear 

nasm -felf64 src/text.asm -o src/text.o
nasm -felf64 src/map/println.asm -o src/map/println.o
nasm -felf64 src/map/block.asm -o src/map/block.o

ld src/text.o src/map/println.o src/map/block.o -o a

if [[ $run == true ]] 
then
	./a
fi
