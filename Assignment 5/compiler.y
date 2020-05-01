%{
	#include<bits/stdc++.h>
	#include"additionalClasses.h"
	using namespace std;

	int count_line = 1;
	extern int yylex();
	void yyerror(string s)
	{
		cout<<"INVALID SYNTAX at line no "<<count_line<<"\n";
		exit(1);
	}
	int yywrap()
	{
		return 1;
	}
%}

%token MUL DIV SUB ADD SEMI COLON EQUAL MOD GT LT LTE GTE EQ NEQ OR AND LCB RCB LRB RRB NOT COM INT VOID FLOAT MAIN FOR WHILE IF ELSE SWITCH DEFAULT PRINTF CASE BREAK CONTINUE RETURN INTNUM FLOATNUM ID ERR

%start begin

%%

begin : declaration_list INT MAIN LRB RRB body

statements : statements M statement | 

statement : ifStart body |
			ifStart body N ELSE M body |
			BREAK SEMI |
			CONTINUE SEMI |
			whileStart body |
			switchStart switch_body |
			RETURN exp SEMI |
			exp SEMI |
			var_dec|
			forStart body |
			PRINTF LRB ID RRB SEMI |
			LevelInc body

ifStart : IF LRB exp_rel RRB

LevelInc :

whileStart : WHILE M LRB exp_rel RRB

forStart: FOR LRB for_init for_cond for_endLoop RRB

switchStart: SWITCH LRB exp RRB

body : LCB statements RCB

for_init : exp SEMI

for_cond : exp_rel SEMI

for_endLoop : exp 

switch_body : LCB case_list Default_case RCB

case_list : case case_list | case

case : CASE INTNUM COLON statements

Default_case : DEFAULT COLON statements | 

M : 

N : 

declaration_list : declaration_list declaration |

declaration : var_dec | func_dec

func_dec : func_head body

func_head : func_id LRB parametersDec RRB

func_id : paramType ID | VOID ID

parametersDec : parametersDecNonEmpty | 

parametersDecNonEmpty : paramDec | paramDec COM parametersDecNonEmpty

paramDec : paramType ID

paramType : INT | FLOAT

var_dec : paramType varNames SEMI

varNames : ID | ID COM varNames

exp_rel : exp_rel OR M exp_rel_and | exp_rel_and

exp_rel_and : exp_rel_and AND M exp_rel_not | exp_rel_not

exp_rel_not : NOT exp_rel_term | exp_rel_term

exp_rel_term : LRB exp_rel RRB | exp relOp exp

relOp : GT | LT | GTE | LTE | EQ | NEQ

exp : ID EQUAL exp | exp_sim

exp_sim : exp_sim op_high exp_sec | exp_sec

op_high : ADD | SUB

op_low : MUL | DIV | MOD

exp_sec : exp_sec op_low exp_term | exp_term

exp_term : LRB exp RRB | ID | INTNUM | FLOATNUM | ID LRB paramList RRB

paramList : paramListNonEmpty | 

paramListNonEmpty : exp COM paramListNonEmpty | exp

%%

int main()
{
	yyparse();
} 