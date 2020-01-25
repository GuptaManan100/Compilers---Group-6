/* Revised parser  */

#include <stdio.h>
#include "lex.h"

void statements();
void stmt();
void d();
void expr();
void E();
void S();
int legal_lookahead( int first_arg , ... );


void statements()
{
    /*  statements -> stmt SEMI statements | epsilon 
        stmt -> id AS expr | if E then stmt | while E do stmt | begin statements end
    */

    while( !match(EOI) )
    {
        stmt();
        if( match( SEMI ) )
            advance();
        else
            fprintf( stderr, "%d: Inserting missing semicolon\n", yylineno );
    }
}

void stmt()
{
    if(!legal_lookahead( ID , IF , WHILE , BEGIN ,0))
        return;
    if( match(ID) )
    {
        d();
        if( match(AS) )
        {
        	advance();
            expr();
        }

    }

    else if( match(IF) )
    {
        advance();
        E();
        
        if( match(THEN) ) 
        {
        	advance();
            stmt();
        }

        else
        {
            fprintf(stderr,"%d: Every If must have a corresponding Then\n",yylineno);
        }
    }

    else if( match(WHILE) )
    {
        advance();
        E();
        
        if( match(DO) ) 
        {
        	advance();
            stmt();
        }

        else
        {
            fprintf(stderr, "%d: Every WHILE must have a corresponding DO\n",yylineno);
        }
    }

    else if( match(BEGIN) )
    {
        advance();
        E();
        
        if( match(END) ) 
        {
        	advance();
            statements();
        }

        else
        {
            fprintf(stderr, "%d: Every BEGIN must have a corresponding END\n",yylineno);
        }
    }

    else
    {
        printf("Syntax Error\n");
    }
}

void S()
{
    /* S  -> d S'
     * S' -> PLUS d S' | MINUS d S'  | epsilon
     */

    if( !legal_lookahead( NUM, ID, LP, 0 ) )
    {
    	fprintf(stderr, "%d: Missing operator\n",yylineno);
    	return;
	}
    d();
    while( match( PLUS ) || match (SUB) )
    {
        advance();
        d();
    }
}


void expr()
{
    /* expr  -> S expr'
     * expr' -> TIMES S expr' | DIV S expr'  | epsilon
     */

    if( !legal_lookahead( NUM, ID, LP, 0 ) )
    {
    	fprintf(stderr, "%d: Missing operator\n",yylineno);
    	return;
    }

    S();
    while( match( TIMES ) || match (DIV) )
    {
        advance();
        S();
    }
}

void E()
{
    /* E  -> expr E'
     * E' -> GT expr | LT expr  | EQ expr |  epsilon
     */

    if( !legal_lookahead( NUM, ID, LP, 0 ) )
    {
    	fprintf(stderr, "%d: Missing expression\n",yylineno);
    	return;
	}
    expr();
    if( match( GT ) || match (LT) || match(EQ) )
    {
        advance();
        expr();
    }
}

void d()
{
    if( !legal_lookahead( NUM, ID ,LP, 0 ) )
    {
    	fprintf(stderr, "%d: Missing operand\n",yylineno);
        return;
	}
	
    if( match(NUM) || match(ID) )
        advance();

    else if( match(LP) )
    {
        advance();
        expr();
        if( match(RP) )
            advance();
        else
            fprintf( stderr, "%d: Mismatched parenthesis\n", yylineno );
    }
    else
    	fprintf( stderr, "%d: Number or identifier expected\n", yylineno );
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

	while( !match( SYNCH ) )
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

int main()
{
    return 0;
}
