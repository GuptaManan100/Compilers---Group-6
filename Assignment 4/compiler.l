
%{
	#include <stdlib.h>
	#include <string.h>
	#include "compiler.tab.h"
	extern int count_line;
%}

b				[ ]*
identifier		[0-9a-zA-Z_]*
operator   		"AND"|"and"|"OR"|"or"
attribute		[0-9a-zA-Z]+\.[0-9a-zA-Z]+
equality_condition	{b}{attribute}{b}={b}{attribute}{b}

%%
{b}"PROJECT"{b}				{return PROJECT;}
{b}"SELECT"{b}				{return SELECT;}
{b}"CARTESIAN_PRODUCT"{b}	{return CARTESIAN_PRODUCT;}
{b}"EQUI_JOIN"{b}			{return EQUI_JOIN;}
"<"							{strcpy(yylval.inp,yytext);return LT;}
">"							{strcpy(yylval.inp,yytext);return GT;}
"<="						{strcpy(yylval.inp,yytext);return LTE;}
">="						{strcpy(yylval.inp,yytext);return GTE;}
"="							{strcpy(yylval.inp,yytext);return EQ;}
\'[^\']*\'					{strcpy(yylval.inp,yytext);return STR;}
\"[^\"]*\"					{strcpy(yylval.inp,yytext);return STR;}
{operator}					{strcpy(yylval.inp,yytext);return OPERATOR;}
{equality_condition}		{strcpy(yylval.inp,yytext);return EQUALITY_CONDITION;}
{identifier}				{strcpy(yylval.inp,yytext);return ID;}
{b}","{b}					{return COMMA;}
{b}"("{b}					{return LB;}
{b}")"{b}					{return RB;}
\n							{count_line++; return NEWLINE;}
{b}";"{b}					{return COLON;}
{b}							{}
.							{return ERR;}
%%