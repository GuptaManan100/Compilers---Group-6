if [ $# == 1 ]
then
	if [ ! -f $1 ]
	then
		echo "File does not exist"
		exit 1
	fi

	filename=`echo "$1" | cut -f 1 -d '.'`
	extension=`echo "$1" | cut -f 2 -d '.'`

	ext="_intermediateCode.txt"
	newfilename=${filename}${ext}

	if [ ! $extension == "c" ]
	then
		echo "Please provide a C file only."
		exit 1
	fi

	bison -d compiler.y
	flex compiler.l
	g++ -ggdb lex.yy.c compiler.tab.c -ll
	./a.out < $1

	if [ $? -eq 1 ]; then
	    echo "Compiler gives syntax error"
	fi

	rm lex.yy.c
	rm compiler.tab.*
	rm a.out
else
	echo "Provide the input file only"
fi