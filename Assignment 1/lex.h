#define EOI		0	/* End of input			*/
#define SEMI	1	/* ; 				*/
#define PLUS 	2	/* + 				*/
#define TIMES	3	/* * 				*/
#define LP		4	/* (				*/
#define RP		5	/* )				*/
#define NUM	6	/* Decimal Number or Identifier */
#define ID 7
#define SUB 8 /* Subtract */
#define DIV 9   /* Divide */
#define GT 10   /* Greater than */
#define LT 11   /*lesser tham */
#define EQ 12   /*equal to*/
#define AS 13   /* assignment */
#define IF 14   /* if statement */
#define THEN 15   /* assignment */
#define WHILE 16   /* while */
#define DO 17   /* do */
#define BEGIN 18   /* begin */
#define END 19   /* end */ 

extern char *yytext;		/* in lex.c			*/
extern int yyleng;
extern int yylineno;
