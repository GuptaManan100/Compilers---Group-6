if [ $# == 1 ]
then
	bison -d compiler.y
	flex compiler.l
	gcc lex.yy.c compiler.tab.h compiler.tab.c -lfl
	./a.out < $1
	rm lex.yy.c
	rm compiler.tab.*
	rm a.out
else
	echo "Provide the input file only"
fi