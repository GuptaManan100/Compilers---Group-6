#include <stdio.h>
#include <ctype.h>
#include <stdlib.h> 
#include <stdbool.h>

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

char* yytext = ""; /* Lexeme (not '\0'
                      terminated)              */
int yyleng   = 0;  /* Lexeme length.           */
int yylineno = 0;  /* Input line number        */

int lex(void){

   static char input_buffer[1024];
   char        *current;

   current = yytext + yyleng; /* Skip current
                                 lexeme        */

   while(1){       /* Get the next one         */
      while(!*current ){
         /* Get new lines, skipping any leading
         * white space on theI line,
         * until a nonblank line is found.
         */

         current = input_buffer;
         if(!gets(input_buffer)){
            *current = '\0' ;

            return EOI;
         }
         ++yylineno;
         while(isspace(*current))
            ++current;
      }
      for(; *current; ++current){
         /* Get the next token */
         yytext = current;
         yyleng = 1;
         switch( *current ){
           case ';':
            return SEMI;
           case '+':
            return PLUS;
           case '-':
            return SUB;
           case '*':
            return TIMES;
           case '/':
            return DIV;
           case '(':
            return LP;
           case ')':
            return RP;
           case '<':
            return LT;
           case '>':
            return GT;
           case '=':
            return EQ;
           // case ':':
           //  return AS;
           case '\n':
           case '\t':
           case ' ' :
            break;
           default:

            if (*current == ':' && *(current+1) == '='){
                yyleng++;
                return AS;
            }
            else if(!isalnum(*current))
               fprintf(stderr, "Not alphanumeric <%c>\n", *current);

            else{
              if(isdigit(*current)){
                while(isdigit(*current))
                   ++current;
                yyleng = current - yytext;
                return NUM;
              }
              else{

                 while(isalnum(*current))
                    ++current;
                 yyleng = current - yytext;

                   if( yyleng==2 && *(current-2) == 'i' && *(current-1) =='f'  )
                   {
                     return IF;
                   }

                  if( yyleng==4 && *(current-4) == 't' && *(current-3) =='h' && *(current-2) == 'e' && *(current-1) == 'n'  )
                  {
                    return THEN;
                  }
                  if( yyleng==5 && *(current-5) == 'w' && *(current-4) =='h' && *(current-3) == 'i' && *(current-2) == 'l' && *(current-1) == 'e'  )
                  {
                   return WHILE;
                  }
                  if( yyleng==2 && *(current-2) == 'd' && *(current-1) =='o'  )
                  {
                    return DO;
                  }
                  if( yyleng==5 && *(current-5) == 'b' && *(current-4) =='e' && *(current-3) == 'g' && *(current-2) == 'i' && *(current-1) == 'n'  )
                  {
                   return BEGIN;
                  }
                  if( yyleng==3 && *(current-3) == 'e' && *(current-2) =='n' && *(current-1) =='d'  )
                  {
                    return END;
                  }
                 return ID;
              }
            }
            break;
         }
      }
   }
}

struct LinkedList{
    char elem[1025];
    struct LinkedList *next;
 };

typedef struct LinkedList *node; //Define node as pointer of data type struct LinkedList

node head;
FILE *symp, *tokp;

node createNode(){
  node temp; // declare a node
  temp = (node)malloc(sizeof(struct LinkedList)); // allocate memory using malloc()
  temp->next = NULL;// make next point to NULL
  for(int i=0;i<yyleng;i++)
  	temp->elem[i] = *(yytext+i);
  temp->elem[yyleng] = '\0';
  fprintf(symp,"%0.*s\n", yyleng,yytext);
  return temp;//return the new node
}

bool isEqual(node x)
{
	for(int i=0;i<yyleng;i++)
	{
		if(*(yytext+i)!=x->elem[i])
			return false;
	}
	if(x->elem[yyleng]=='\0')
		return true;
	return false;
}

int findSymbol()
{
	if(head == NULL)
	{
		head = createNode();
		return 1;
	}
	int count = 1;
	node x = head;
	node prev = head;
	while(x!=NULL)
	{
		if(isEqual(x))
			return count;
		prev = x;
		x = x->next;
		count++;
	}
	x = createNode();
	count++;
	prev->next = x;
	return count;
}

static int Lookahead = -1; /* Lookahead token  */

void advance(void){
/* Advance the lookahead to the next
   input symbol.                               */

    Lookahead = lex();
}

int match(int token){
   /* Return true if "token" matches the
      current lookahead symbol.                */

   if(Lookahead == -1)
      advance();

   return token == Lookahead;
}

int main()
{
	symp = fopen("symbolTable.txt", "w");
	tokp = fopen("tokens.txt", "w");
	head = NULL;
	int entry;
  while(1)
  {
    advance();
    if(Lookahead == 0)
    {
      return 0;
    }
    if(Lookahead == 7)
    {
    	entry = findSymbol();
    	fprintf(tokp, "%d, %d\n", Lookahead, entry);
    }
    else if(Lookahead == 6)
    {
    	fprintf(tokp,"%d , %0.*s\n", Lookahead ,yyleng,yytext);
    }
    else
			fprintf(tokp,"%d\n", Lookahead);
  }
}
