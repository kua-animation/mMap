#/bin/bash

run=$1

nasm -felf64 main.asm -o main.o
nasm -felf64 src/println.asm -o src/println.o
nasm -felf64 src/clear.asm -o src/clear.o

ld main.o src/println.o src/clear.o  -o a

if [[ $run == true ]] 
then
	./run.sh
fi
