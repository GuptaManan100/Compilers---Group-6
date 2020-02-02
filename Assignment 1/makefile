all: clean generate

generate:
	gcc -w parser.c lex.c main.c name.c -o parser.out
	gcc -w only_lex.c -o only_lex.out
	gcc -w asm.c -o asmConv.out

clean:
	rm -f parser.out
	rm -f only_lex.out
	rm -f asmConv.out
