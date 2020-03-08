if [ $# == 1 ]
then
	flex parser.l;
	gcc lex.yy.c -lfl;
	./a.out < $1
	flex parser2.l;
	gcc lex.yy.c -lfl;
	./a.out < $1
	rm ./a.out;
	rm lex.yy.c;
	rm parser2.l;
else
	echo "Provide the input file only"
fi