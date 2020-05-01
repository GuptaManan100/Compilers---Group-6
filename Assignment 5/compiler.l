%{
	#include<bits/stdc++.h>
	extern int count_line;
	#include "compiler.tab.h"
	#include"unionStructs.h"
	using namespace std;
%}

%%


"*"			{return MUL;}
"/"			{return DIV;}
"-"			{return SUB;}
"+"			{return ADD;}
";"			{return SEMI;}
":"			{return COLON;}
"="			{return EQUAL;}
"%"			{return MOD;}
">"			{return GT;}
"<"			{return LT;}
">="		{return LTE;}
"<="		{return GTE;}
"=="		{return EQ;}
"!="		{return NEQ;}
"<>"		{return NEQ;}
"||"		{return OR;}
"&&"		{return AND;}
"{"			{return LCB;}
"}"			{return RCB;}
"("			{return LRB;}
")"			{return RRB;}
"!"			{return NOT;}
","			{return COM;}
"int"		{return INT;}
"void"		{return VOID;}
"float"		{return FLOAT;}
"main"		{return MAIN;}
"for"		{return FOR;}
"while"		{return WHILE;}
"if"		{return IF;}
"else"		{return ELSE;}
"switch"	{return SWITCH;}
"default"	{return DEFAULT;}
"case"		{return CASE;}
"break"		{return BREAK;}
"continue"	{return CONTINUE;}
"return"	{return RETURN;}
"printf"	{return PRINTF;}
([0-9]+)	{yylval.s = new struct str(yytext);return INTNUM;}
([0-9]+\.[0-9]+)	{yylval.s = new struct str(yytext);return FLOATNUM;}
[_a-zA-Z]([a-zA-Z0-9_]*)	{yylval.s = new struct str(yytext);return ID;}
([ \t\r]+)	{ }
\n			{count_line++;}
.			{return ERR;}

%%
