%{
	FILE * fptr;
	char className[1024];
	int classes = 0;
	int inher_classes =0;
	void error(char * s)
	{
		printf("%s\n",s);
		exit(1);
	}

	void printRegex()
	{
		fprintf(fptr,"(\"public\"|\"private\"|\"protected\"){SPACES}\"%s\"\t{construc++;}\n",className);
		fprintf(fptr,"\"%s\"{SPACES}{ID}{SPACE}(\",\"|\";\"|\"=\")\t{obje++;}\n",className);
	}

	void extractClassName(char *s)
	{
		sscanf(s,"%*s %s",className);
		printf("%s\n",className);
		printRegex();
	}

	void extractClassNameFollow(char *s)
	{
		sscanf(s,"%*s %*s %s",className);
		printf("%s\n",className);
		printRegex();
	}
%}

DIGIT [0-9]
DIGITS [0-9]+
SPACE [[:space:]]*
SPACES [[:space:]]+
ID [a-zA-Z_][a-zA-Z_0-9]*

%%

"//".*  {/* Do Nothing Single Line Comment */}
"/*"[^*]*[*]+([^*/][^*]*[*]+)*[/]	{ /* Do Nothing Multi Line Comment */ }
"/*" 	{ error("Unterminated comment"); }
"class"{SPACES}{ID}{SPACES}"extends"{SPACES}{ID} { classes++; inher_classes++; extractClassName(yytext);}
("public"|"private"|"protected"){SPACES}"class"{SPACES}{ID}{SPACES}"extends"{SPACES}{ID} { classes++; inher_classes++; extractClassNameFollow(yytext);}
"class"{SPACES}{ID} { classes++; extractClassName(yytext);}
("public"|"private"|"protected"){SPACES}"class"{SPACES}{ID} { classes++; extractClassNameFollow(yytext);}
.|\n {}
%%

int main(int argc, char** argv)
{
 	fptr = fopen("parser2.l", "w"); 
 	fprintf(fptr,"%%{\n");
 	fprintf(fptr,"\tint construc = 0;\n");
 	fprintf(fptr,"\tint obje = 0;\n");
 	fprintf(fptr,"%%}\n\n");

 	fprintf(fptr,"DIGIT [0-9]\n");
 	fprintf(fptr,"DIGITS [0-9]+\n");
 	fprintf(fptr,"SPACE [[:space:]]*\n");
 	fprintf(fptr,"SPACES [[:space:]]+\n");
 	fprintf(fptr,"ID [a-zA-Z_][a-zA-Z_0-9]*\n");

 	fprintf(fptr,"\n%%%%\n\n");
 	fprintf(fptr,"\"//\".*  {}\n");
 	fprintf(fptr,"\"/*\"[^*]*[*]+([^*/][^*]*[*]+)*[/]	{}\n");
 	yylex();
 	fprintf(fptr,".|\\n {}\n");
 	fprintf(fptr,"\n%%%%\n\n");

 	fprintf(fptr,"int main(int argc, char ** argv)\n");
 	fprintf(fptr,"{\n");
 	fprintf(fptr,"\tyylex();\n");
 	fprintf(fptr,"\tprintf(\"Objects:- %%d\\n\", obje);\n");
 	fprintf(fptr,"\tprintf(\"Constructors:- %%d\\n\", construc);\n");
 	fprintf(fptr,"}\n");

 	printf("Classes:- %d\n", classes);
 	printf("Inherited Classes:- %d\n", inher_classes);
}