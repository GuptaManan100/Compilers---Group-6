
%{
	#include <stdlib.h>
	#include <string.h>
	#include "y.tab.h"
	extern int count_line;
%}
b				[ ]*
identifier		{b}[0-9a-zA-Z_]*{b}
comparison_op			{b}"="{b}|{b}"<"{b}|{b}">"{b}|{b}"!="{b}|{b}"<="{b}|{b}">="{b}
operator   		{b}"AND"{b}|{b}"and"{b}|{b}"OR"{b}|{b}"or"{b}
attribute		[0-9a-zA-Z]+|[0-9a-zA-Z]+\.[0-9a-zA-Z]+
equality_condition	{b}{attribute}{b}={b}{attribute}{b}

%%
{b}"PROJECT"{b}				{return PROJECT;}
{b}"SELECT"{b}				{return SELECT;}
{b}"CARTESIAN_PRODUCT"{b}	{return CARTESIAN_PRODUCT;}
{b}"EQUI_JOIN"{b}			{return EQUI_JOIN;}
{b}"NOT"{b}					{return NOT;}
{b}"<"{b}					{return LT;}
{b}">"{b}					{return GT;}
\'[^\']*\'					{return STR;}
\"[^\"]*\"					{return STR;}
{comparison_op}					{return COMPARISON_OP;}
{operator}					{return OPERATOR;}
{equality_condition}			{return EQUALITY_CONDITION;}
{identifier}				{return ID;}
{b}","{b}					{return COMMA;}
{b}"("{b}					{return LB;}
{b}")"{b}					{return RB;}
\n							{count_line++; return NEWLINE;}
{b}";"{b}					{return COLON;}
.							{return ERR;}
%%