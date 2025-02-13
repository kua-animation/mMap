#/bin/bash



run=$1

clear 

nasm -felf64 main.asm -o main.o
nasm -felf64 src/println.asm -o src/println.o
nasm -felf64 src/block.asm -o src/block.o

ld main.o src/println.o src/block.o -o a

if [[ $run == true ]] 
then
	./run.sh
fi
