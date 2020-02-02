#!/bin/bash

make
if [ $# == 1 ]
then
	./only_lex.out < $1
	./parser.out < $1 > intermediateCode.txt
	./asmConv.out
else
	echo "Provide the input file only"
fi