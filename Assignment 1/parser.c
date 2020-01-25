/* Revised parser  */

#include <stdio.h>
#include "lex.h"
#include "name.h"

void  statements();
void stmt();
char * d();
char * expr();
char * E();
char * S();
int legal_lookahead( int first_arg , ... );


void statements()
{
    /*  statements -> statements' | epsilon 
        statements' -> stmt SEMI statements' | stmt
        stmt -> id AS expr | if E then stmt | while E do stmt | begin X
        X -> statements' END | END
    */
    //char * a = newname();

    while( !match(EOI) )
    {
        stmt();
        //printf("New statement\n");
        if( match( SEMI ) )
            advance();
        else if(match(EOI))
            continue;
        else
            fprintf( stderr, "%d: Inserting missing semicolon\n", yylineno );
        //printf("Manan\n");
    }
}

void stmt()
{
    char *tempvar;
    char *tempvar2;
    
    if(!legal_lookahead( ID , IF , WHILE , BEGIN ,0))
        return;
    if( match(ID) )
    {
        tempvar = d();
        if( match(AS) )
        {
        	advance();
            tempvar2 = expr();
            printf("%s = %s \n",tempvar,tempvar2 );
            freename(tempvar);
            freename(tempvar2);
        }
        else
        {
            fprintf(stderr,"%d: Missing assignment operator\n",yylineno);
            freename(tempvar);
        }
    }

    else if( match(IF) )
    {
        printf("if (\n");
        advance();
        tempvar = E();
        freename(tempvar);
        printf(")\n");

        if( match(THEN) ) 
        {
            printf("{\n");
        	advance();
            stmt();
            printf("}\n" );
        }

        else
        {
            fprintf(stderr,"%d: Every If must have a corresponding Then\n",yylineno);
            printf("{\n}\n");
        }
    }

    else if( match(WHILE) )
    {
        printf("while ( \n");
        advance();
        tempvar = E();
        freename(tempvar);
        printf(")\n" ) ;
        if( match(DO) ) 
        {
            printf("{\n");
        	advance();
            stmt();
            printf("}\n");
        }

        else
        {
            fprintf(stderr, "%d: Every WHILE must have a corresponding DO\n",yylineno);
            printf("{\n}\n");
        }
    }

    else if( match(BEGIN) )
    {
        printf("{\n");

        advance();
        while( !match(END) && !match(EOI)) 
        {
            stmt();
            //printf("New statement\n");
            if( match( SEMI ) )
                advance();
            else if(match(EOI) || match(END))
                continue;
            else
                fprintf( stderr, "%d: Inserting missing semicolon\n", yylineno );
            //printf("Manan\n");
        }

        if(match(END))
        {
            advance();
        }
        else
        {
            fprintf(stderr, "%d: Every BEGIN must have a corresponding END\n",yylineno);
        }
        printf("}\n");

    }

    else
    {
        fprintf(stderr,"%d: Syntax Error\n",yylineno);
    }
}

char *S()
{
    /* S  -> d S'
     * S' -> TIMES d S' | DIV d S'  | epsilon
     */

    if( !legal_lookahead( NUM, ID, LP, 0 ) )
    {
    	fprintf(stderr, "%d: Missing operator\n",yylineno);
        return "ERROR";

	}
    char *tempvar;
    tempvar = d();

    while( match( TIMES ) || match (DIV) )
    {
        char *tempvar2;
        char operator = *yytext;
        advance();
        tempvar2 = d();
        printf("%s %c= %s \n", tempvar , operator , tempvar2 );
        freename(tempvar2);
    }
    return tempvar;
}


char *expr()
{
    /* expr  -> S expr'
     * expr' -> PLUS S expr' | SUB S expr'  | epsilon
     */

    char *tempvar;
    if( !legal_lookahead( NUM, ID, LP, 0 ) )
    {
    	fprintf(stderr, "%d: Missing operator\n",yylineno);
    	return "ERROR";
    }

    tempvar = S();
    while( match( PLUS ) || match (SUB) )
    {
        char operator = *yytext;
        advance();
        char *tempvar2 = S();
        printf("%s %c= %s \n", tempvar , operator , tempvar2 );
        freename(tempvar2);
    }
    return tempvar;
}

char *E()
{
    /* E  -> expr E'
     * E' -> GT expr | LT expr  | EQ expr |  epsilon
     */

    if( !legal_lookahead( NUM, ID, LP, 0 ) )
    {
    	fprintf(stderr, "%d: Missing expression\n",yylineno);
    	return "ERROR";
	}
    char *tempvar = expr();
    if( match( GT ) || match (LT) || match(EQ) )
    {
        char *tempvar2;
        char operator = *yytext;
        int flag=1;
        if( match(EQ))
            flag++;
        advance();
        tempvar2 = expr();
        if(flag==1)
            printf("%s %c %s \n", tempvar , operator , tempvar2 );
        else
            printf("%s == %s \n", tempvar , tempvar2 );

        freename(tempvar2);
    }
    return tempvar;

}

char *d()
{
    char *tempvar;

    if( !legal_lookahead( NUM, ID ,LP, 0 ))
    {
    	fprintf(stderr, "%d: Missing operand\n",yylineno);
        return "ERROR";
	}
	
    if( match(NUM) ){
        tempvar = newname();
        printf("%s = %0.*s\n", tempvar ,yyleng,yytext);
        advance();
        return tempvar;
    }

    else if(match(ID) ){
        tempvar = newname();
        printf("%s = _%0.*s\n", tempvar ,yyleng,yytext);
        advance();
        return tempvar;
    }

    else if( match(LP) )
    {
        advance();
        tempvar = expr();
        if( match(RP) )
            advance();
        else{
            fprintf( stderr, "%d: Mismatched parenthesis\n", yylineno );
            tempvar = "ERROR";
        }
        return tempvar;
    }
    else
    	fprintf( stderr, "%d: Number or identifier expected\n", yylineno );
    return "ERROR";

}
#include <stdarg.h>

#define MAXFIRST 16
#define SYNCH	 SEMI

int	legal_lookahead( int first_arg , ... )
{
    /* Simple error detection and recovery. Arguments are a 0-terminated list of
     * those tokens that can legitimately come next in the input. If the list is
     * empty, the end of file must come next. Print an error message if
     * necessary. Error recovery is performed by discarding all input symbols
     * until one that's in the input list is found
     *
     * Return true if there's no error or if we recovered from the error,
     * false if we can't recover.
     */

    va_list  	args;
    int		tok;
    int		lookaheads[MAXFIRST], *p = lookaheads, *current;
    int		error_printed = 0;
    int		rval	      = 0;

    va_start( args, first_arg );

    if( !first_arg )
    {
	if( match(EOI) )
	    rval = 1;
    }
    else
    {
	*p++ = first_arg;
	while( (tok = va_arg(args, int)) && p < &lookaheads[MAXFIRST] )
	    *p++ = tok;

	while( !match( SYNCH ) && !match(EOI) )
	{
	    for( current = lookaheads; current < p ; ++current )
		if( match( *current ) )
		{
		    rval = 1;
		    goto exit;
		}

	    if( !error_printed )
	    {
		fprintf( stderr, "Line %d: Syntax error\n", yylineno );
		error_printed = 1;
	    }

	    advance();
	}
    }

exit:
    va_end( args );
    return rval;
}