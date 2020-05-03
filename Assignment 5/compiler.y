%{
	#include<bits/stdc++.h>
	#include"additionalClasses.h"
	#include"unionStructs.h"
	using namespace std;
	const int INTREGS = 10;
	const int FLOATREGS = 10;

	int count_line = 1;
	int cttemp=0;
	extern int yylex();
	void yyerror(string s)
	{
		cout<<s<<endl<<"INVALID SYNTAX at line no "<<count_line<<"\n";
		exit(1);
	}
	int yywrap()
	{
		return 1;
	}

	int floatTemps[FLOATREGS];
	int intTemps[INTREGS];

	vector<string> instructions;
	int intVarNum;
	int floatVarNum;

	stack<int> breakInsts;
	stack<int> continueInsts;

	string genVarName(dataType dt)
	{
		string ans;
		if(dt==_float)
		{
			ans = "f" + to_string(floatVarNum++);
		}
		else{
			ans = "i" + to_string(intVarNum++);
		}
		return ans;
	}

	int findFreeFloatVariable()
	{
		for(int i=0;i<FLOATREGS;i++)
		{
			if(floatTemps[i]==0)
			{
				floatTemps[i] = 1;
				return i;
			}
		}
		cout<<"Statement Too complex. Ran out of Float Temporary Variables at line "<<count_line<<"\n";
		exit(1);
	}
	int findFreeIntVariable()
	{
		for(int i=0;i<INTREGS;i++)
		{
			if(intTemps[i]==0)
			{
				intTemps[i] = 1;
				return i;
			}
		}
		cout<<"Statement Too complex. Ran out of Int Temporary Variables at line "<<count_line<<"\n";
		exit(1);
	}
	string getTempVariable(dataType type){
		if(type==_float){
			return "tf"+to_string(findFreeFloatVariable());
		}

		return "ti"+to_string(findFreeIntVariable());
	}
	
	void freeTempVariable(string t){
		if(t[0]!='t') return;
		int k = stoi(t.substr(2));
		if(t[1]=='i') intTemps[k]=0;
		else floatTemps[k] = 0;
	}

	SymbolTable symTab;
%}
%code requires{
	#include "unionStructs.h"
}
%token MUL DIV SUB ADD SEMI COLON EQUAL MOD GT LT LTE GTE EQ NEQ OR AND LCB RCB LRB RRB NOT COM INT VOID FLOAT MAIN FOR WHILE IF ELSE SWITCH DEFAULT PRINTF CASE BREAK CONTINUE RETURN INTNUM FLOATNUM ID ERR

%start begin

%union{
	struct str * s;
	int num;
	struct vecStr * v;
	struct expr * E;
}

%type<E> exp exp_sec exp_sim exp_term
%type<s> ID op_high op_low INTNUM FLOATNUM LRB RRB
%type<num> paramType paramList paramListNonEmpty
%type<v> varNames 
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
			exp SEMI {
				freeTempVariable($1->addr);
			} |
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

func_id : paramType ID
		| VOID ID

parametersDec : parametersDecNonEmpty | 

parametersDecNonEmpty : paramDec | paramDec COM parametersDecNonEmpty

paramDec : paramType ID

paramType : INT {$$ = 0;}
			| FLOAT {$$ = 1;}

var_dec : paramType varNames SEMI{
				dataType varTypes = _int;
				if($1==1)
				{
					varTypes = _float;
				}
				for(auto vx: $2->x)
				{
					if(symTab.addVariable(vx,varTypes,genVarName(varTypes) )==1)
					{
						cout<<"Variable Redclaration of "<<vx<<" at "<<count_line<<endl;
						exit(1);
					}
				}
			}

varNames :	ID {
				struct vecStr * newVec = new struct vecStr;
				newVec->addString($1->x);
				$$ = newVec;
			}
			| ID COM varNames{
				$$ = $3;
				$$->addString($1->x);
			}

exp_rel : exp_rel OR M exp_rel_and | exp_rel_and

exp_rel_and : exp_rel_and AND M exp_rel_not | exp_rel_not

exp_rel_not : NOT exp_rel_term | exp_rel_term

exp_rel_term : LRB exp_rel RRB | exp relOp exp

relOp : GT | LT | GTE | LTE | EQ | NEQ

exp : ID EQUAL exp {
			Variable * temp = symTab.findVariable($1->x);
			if(temp==NULL)
			{
				yyerror("Undefined Variable.");
			}
			if(temp->type!=$3->type){
				string t = getTempVariable(temp->type);
				instructions.pb(t+ " = "+$3->addr);
				freeTempVariable($3->addr);
				$3->addr = t;
				// E->code.push_back(t+" = "+temp->name);
				//symTab.upgradeVariable($1->x,_float,t);
			}
			instructions.push_back( temp->name+ " = " + $3->addr);
			$$ = $3;
		}
	| exp_sim {
			$$ = $1;
		}

exp_sim : exp_sim op_high exp_sec {
			struct expr *E = new struct expr;
			E->setType($1->type,$3->type);
			E->addr = getTempVariable(E->type);

			string tc;
			if($1->type!= E->type)
			{
				tc =  getTempVariable(E->type);
				$1->type = E->type;
				instructions.push_back(tc+" = "+$1->addr);
				freeTempVariable($1->addr);
				$1->addr = tc;
			}
			if($3->type!= E->type)
			{
				tc =  getTempVariable(E->type);
				$3->type = E->type;
				instructions.push_back(tc+" = "+$3->addr);
				freeTempVariable($3->addr);
				$3->addr = tc;
			}
			freeTempVariable($1->addr);
			freeTempVariable($3->addr);
			instructions.push_back(E->addr+" = "+$1->addr+$2->x+$3->addr);
			$$ = E;
		}
		| exp_sec {
			$$ = $1;
		}

op_high : ADD {$$ = new str(" + ");} 
		| SUB {$$ = new str(" - ");}

op_low :  MUL {$$ = new str(" * ");}
		| DIV {$$ = new str(" / ");}
		| MOD {$$ = new str(" % ");}

exp_sec : exp_sec op_low exp_term {
			struct expr *E = new struct expr;
			E->setType($1->type,$3->type);
			E->addr = getTempVariable(E->type);
			string tc;
			if($1->type!= E->type)
			{
				tc =  getTempVariable(E->type);
				$1->type = E->type;
				instructions.push_back(tc+" = "+$1->addr);
				freeTempVariable($1->addr);
				$1->addr = tc;
			}
			if($3->type!= E->type)
			{
				tc =  getTempVariable(E->type);
				$3->type = E->type;
				instructions.push_back(tc+" = "+$3->addr);
				freeTempVariable($3->addr);
				$3->addr = tc;
			}

			freeTempVariable($1->addr);
			freeTempVariable($3->addr);
			instructions.push_back(E->addr+" = "+$1->addr+$2->x+$3->addr);

			$$ = E;
		}
		| exp_term{
			$$ = $1;
		}

exp_term : LRB exp RRB {
				$$ = $2;
			}
			| ID {			
				struct expr *E = new struct expr;
				Variable * temp = symTab.findVariable($1->x);
				if(temp==NULL)
					yyerror("Undefined Variable.");
				E->type = temp->type;
				E->addr = getTempVariable(E->type);
				instructions.push_back(E->addr + " = "+temp->name);
							
				$$ = E;
			}
			| INTNUM {			
				struct expr *E = new struct expr;
				E->type = _int;
				E->addr = getTempVariable(E->type);
				instructions.push_back(E->addr + " = "+$1->x);
				$$ = E;
			}
			| FLOATNUM {
				struct expr *E = new struct expr;
				E->type = _float;
				E->addr = getTempVariable(E->type);
				instructions.push_back(E->addr + " = "+$1->x);
				$$ = E;
			}
			| ID LRB paramList RRB {
				Function *temp = symTab.findFunction($1->x);
				if(!temp) yyerror("Function not defined");
				struct expr *E = new struct expr;
				E->type = temp->returnType;
				if(!(E->type == _int || E->type ==_float))
				{
					yyerror("Invalid return type of arguement");
				}
				//TODO: Check Paramter Types.
				E->addr = getTempVariable(temp->returnType);

				instructions.push_back(E->addr+" = "+to_string($3));
				$$=E;
			}

paramList : paramListNonEmpty {$$ = $1;} | {$$=0;}

paramListNonEmpty : exp COM paramListNonEmpty {
						instructions.pb("param "+$1->addr);
						$$ = $3+1;
					}
					| exp {
						instructions.pb("param "+$1->addr);
						$$=1;
					}

%%

int main()
{
	intVarNum = 0;
	floatVarNum = 0;
	for(int i=0;i<FLOATREGS;i++)
		floatTemps[i] = 0;
	for(int i=0;i<INTREGS;i++)
		intTemps[i] = 0;
	yyparse();

	for(auto c : instructions)
	{
		cout<<c<<endl;
	}

	//symTab.printVars();
} 