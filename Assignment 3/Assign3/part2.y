%{
	#include <stdlib.h>
	#include <stdio.h>
	int count_line = 1;
	extern int yylex();
	void yyerror(char *s)
	{
		fprintf(stderr,"INVALID SYNTAX at line %d\n",count_line);
		exit(1);
	}
	int yywrap()
	{
		return 1;
	}
%}

%token PROJECT
%token SELECT
%token CARTESIAN_PRODUCT
%token EQUI_JOIN
%token NOT
%token LT
%token GT
%token LB
%token RB
%token NEWLINE
%token COLON
%token ID
%token OPERATOR
%token COMPARISON_OP
%token EQUALITY_CONDITION
%token COMMA
%token STR
%token ERR


%%
statements 			: statements NEWLINE statement COLON | statement COLON ;
statement 			: SELECT LT conditions GT LB ID RB | 
					  PROJECT LT attribute_lists GT LB ID RB |
					  LB ID RB CARTESIAN_PRODUCT LB ID RB |
					  LB ID RB EQUI_JOIN LT equi_conditions GT LB ID RB ;
attribute_lists		: attribute_lists COMMA ID |
					  ID;
conditions 			: conditions OPERATOR condition |
			 		  condition;
condition 			: EQUALITY_CONDITION | NOT temp | temp;
temp 				: ID COMPARISON_OP ID | ID COMPARISON_OP STR | ID LT ID | ID LT STR | ID GT ID 							 | ID GT STR;
equi_conditions		: equi_conditions OPERATOR EQUALITY_CONDITION |
					  EQUALITY_CONDITION;

%%

int main()
{
	yyparse();
	printf("VALID\n");
}