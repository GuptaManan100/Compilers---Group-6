#include "lex.h"
#include <stdio.h>
#include <ctype.h>


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
                current++;
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


static int Lookahead = -1; /* Lookahead token  */

int match(int token){
   /* Return true if "token" matches the
      current lookahead symbol.                */

   if(Lookahead == -1)
      Lookahead = lex();

   return token == Lookahead;
}

void advance(void){
/* Advance the lookahead to the next
   input symbol.                               */

    Lookahead = lex();
}

int main()
{
  while(1)
  {
    advance();
    if(Lookahead == 0)
    {
      return 0;
    }
    printf("%d\n", Lookahead);
  }
}
