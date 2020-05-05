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
	void yyerror(string s="")
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
	int lc;

	vector<string> instructions;
	int intVarNum;
	int floatVarNum;
	int funcNum;
	int lblNum;

	vector<vector <int>> breakInsts, contInsts;
	stack<string> switchExpr;

	string getFuncName()
	{
		return "func" + to_string(funcNum++);
	}

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

	string genParameterName(dataType dt, int num)
	{
		string ans;
		if(dt==_float)
		{
			ans = "pf" + to_string(num);
		}
		else{
			ans = "pi" + to_string(num);
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
		if(type==_void)
		{
			return "nottouse";
		}
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

	string getLabel(){
		return "L" + to_string(lblNum++); 
	}

	list<int> *mergelist(list<int> *a,list<int> *b){
		if(!a){
			return b;
		}
		if(!b){
			return a;
		}
        list<int> *temp = new list<int>;
        temp->merge(*a);
        temp->merge(*b);
        return temp;
    }

    list<int> *makelist(int i){
        list<int> *temp = new list<int>;
        temp->push_back(i);
        return temp;
    }

    void backpatch(list<int> *a,int i){
		if(!a){
			return;
		}
		string label = getLabel();
        for(auto x: *a){
            instructions[x] += "goto " + label;
        }
		while(instructions.size()<=i){
			instructions.push_back("");
		}
		instructions[i] = label + ": " + instructions[i];
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
	struct stmt * S;
	struct Params * p;
}

%type<E> exp exp_sec exp_sim exp_term switchStart switch_body
%type<s> ID op_high op_low INTNUM FLOATNUM LRB RRB relOp
%type<num> paramType M defaultBegin
%type<v> varNames
%type<S> exp_rel for_cond for_endLoop for_init exp_rel_and exp_rel_not exp_rel_term ifStart statement statements body N case case_list caseBegin Default_case 
%type<p> parametersDecNonEmpty paramDec parametersDec func_id paramList paramListNonEmpty
%%

begin : declaration_list INT main LRB RRB body {
				int intCoun = instructions.size();
				instructions.push_back("func end");
				backpatch($6->nextlist,intCoun);
				symTab.reduceLevel();
			}

main 	: MAIN{
				instructions.push_back("func begin main");
				symTab.addLevel();
			}

statements : statements M statement {
				backpatch($1->nextlist,$2);
				$$ = $3;
			 }
			 | { struct stmt *S = new struct stmt;
			 	 S->nextlist = NULL;
				 $$ = S;	
			 }

statement : ifStart M body {
				struct stmt *S = new struct stmt;
				backpatch($1->truelist,$2);
				S->nextlist = mergelist($1->falselist,$3->nextlist);
				$$ = S;
				symTab.reduceLevel();
			}
			| ifStart M body N elseStart M body {
				struct stmt *S = new struct stmt;
				backpatch($1->truelist,$2);
				backpatch($1->falselist,$6);
				S->nextlist = mergelist($3->nextlist,$4->nextlist);
				S->nextlist = mergelist(S->nextlist,$7->nextlist);
				$$ = S;
				symTab.reduceLevel();
			}
			| BREAK SEMI {
				if(lc==-1) yyerror();
				breakInsts[lc].pb(instructions.size());
				instructions.pb("");
				$$ = new struct stmt;
				$$->nextlist = NULL;
			}
			| CONTINUE SEMI {
				if(lc==-1) yyerror();
				contInsts[lc].pb(instructions.size());
				instructions.pb("");
				$$ = new struct stmt;
				$$->nextlist = NULL;
			}
			| whileStart M LRB exp_rel RRB M body N{
				struct stmt *S = new struct stmt;
				backpatch($4->truelist,$6);
				for(auto it: breakInsts[lc]) $4->falselist->pb(it);
				for(auto it: contInsts[lc]) $8->nextlist->pb(it);
				S->nextlist = $4->falselist;
				backpatch(mergelist($8->nextlist,$7->nextlist),$2);
				$$ = S;
				lc--;
				breakInsts.pop_back();
				contInsts.pop_back();
				symTab.reduceLevel();

			}
			| switchStart switch_body {
				symTab.reduceLevel();
				freeTempVariable(switchExpr.top());
				switchExpr.pop();
				struct stmt *S = new struct stmt;
				S->nextlist = NULL;
				$$ = S;
			}
			| RETURN exp SEMI {
				if($2->type==_void)
				{
					yyerror("Invalid Use of Void Return Type");
				}
				instructions.push_back("return "+ $2->addr);
				freeTempVariable($2->addr);
				struct stmt *S = new struct stmt;
				S->nextlist = NULL;
				$$ = S;
			}
			| exp SEMI {
				freeTempVariable($1->addr);
				struct stmt *S = new struct stmt;
				S->nextlist = NULL;
				$$ = S;
			} 
			| var_dec {
				struct stmt *S = new struct stmt;
				S->nextlist = NULL;
				$$ = S;
			}
			| forStart LRB for_init M for_cond M for_endLoop N RRB M body N{
				struct stmt *S = new struct stmt;
				backpatch($5->truelist,$10);
				for(auto it: breakInsts[lc]) $5->falselist->pb(it);
				for(auto it: contInsts[lc]) $12->nextlist->pb(it);
				S->nextlist = $5->falselist;
				backpatch(mergelist($12->nextlist,$11->nextlist),$6);
				backpatch($8->nextlist,$4);
				$$ = S;
				lc--;
				breakInsts.pop_back();
				contInsts.pop_back();
				symTab.reduceLevel();

			}
			| PRINTF LRB ID RRB SEMI {
				Variable * temp = symTab.findVariable($3->x);
				if(temp==NULL)
					yyerror("Undefined Variable.");
				instructions.push_back("printf( " + temp->name + " )" );
				struct stmt *S = new struct stmt;
				S->nextlist = NULL;
				$$ = S;
			}

ifStart : IF LRB exp_rel RRB {$$ = $3; symTab.addLevel(); }

elseStart : ELSE {symTab.reduceLevel(); symTab.addLevel(); }

switchStart: SWITCH LRB exp RRB { $$ = $3;
									if($3->type==_void)
									{
										yyerror("Invalid Use of Void Return Type");
									}
								  if($3->type != _int){
									  cout<<"Incompatible type for SWITCH expression. Integer expected at "<<count_line<<endl;
									  exit(1);
								  }
								  symTab.addLevel();
								  switchExpr.push($3->addr);
								}

body : LCB statements RCB {$$ = $2;}

forStart : FOR {
				symTab.addLevel();
				lc++;
				breakInsts.pb({});
				contInsts.pb({});
			}
whileStart : WHILE {
				symTab.addLevel();
				lc++;
				breakInsts.pb({});
				contInsts.pb({});
			}

for_init : exp SEMI{
				freeTempVariable($1->addr);
				struct stmt *S = new struct stmt;
				S->nextlist = NULL;
				$$ = S;
			}

for_cond : exp_rel SEMI {$$ = $1;}

for_endLoop : exp {
				freeTempVariable($1->addr);
				struct stmt *S = new struct stmt;
				S->nextlist = NULL;
				$$ = S;
			}

switch_body : LCB case_list Default_case RCB {
				 backpatch($2->truelist,$3->start);
				 int nextInstr = instructions.size();
				 instructions.push_back("");
				 backpatch($2->nextlist,nextInstr);
			  }

case_list : case case_list {
				struct stmt *S = new struct stmt;
				backpatch($1->truelist,$2->start);
				S->truelist = $2->truelist;
				S->nextlist = mergelist($1->nextlist,$2->nextlist);
				S->start = $1->start;
				$$ = S;
			}
		    | case {$$ = $1;}

case : caseBegin statements {
		struct stmt *S = new struct stmt;
		int nextInstr = instructions.size();
		instructions.push_back("");
		S->truelist = $1->truelist;
		S->nextlist = makelist(nextInstr);
		S->start = $1->start;
		$$ = S;
	 }

caseBegin : CASE INTNUM COLON {
			struct stmt *S = new struct stmt;
			S->start = instructions.size();
			string var = getTempVariable(_int);
			instructions.push_back(var + " = " + $2->x);
			S->truelist = makelist(instructions.size());
			instructions.push_back("if " + switchExpr.top() + " != " + var + " ");
			freeTempVariable(var);
			$$ = S;
		  }

Default_case : defaultBegin statements {
				 struct stmt *S = new struct stmt;
				 S->truelist = NULL;
				 S->nextlist = NULL;
				 S->start = $1;
				 $$ = S;
			   }
			   | { 
				 struct stmt *S = new struct stmt;
				 S->truelist = NULL;
				 S->nextlist = NULL;
				 S->start = instructions.size();
				 instructions.push_back("");
				 $$ = S; 
				}

defaultBegin : DEFAULT COLON {  $$ = instructions.size(); instructions.push_back(""); } 

M : {$$ = instructions.size();}

N : {	struct stmt *S = new struct stmt;
		int nextInstr = instructions.size();
		S->nextlist = makelist(nextInstr);
		instructions.push_back("");
		$$ = S;
	}

declaration_list : declaration_list declaration |

declaration : var_dec | func_dec

func_dec : func_head body {
				symTab.reduceLevel();
				int intCoun = instructions.size();
				instructions.push_back("func end");
				backpatch($2->nextlist,intCoun);
			}

func_head : func_id LRB parametersDec RRB{
				symTab.addLevel();
				string newFun = getFuncName();
				if(symTab.addFunction($1->nm[0],$1->dt[0],newFun)==1)
					yyerror("Function Name Already In Use");
				Function * fctn = symTab.findFunction($1->nm[0]);
				for(auto cx : $3->dt)
				{
					fctn->addParameter(cx);
				}

				for(int i=0;i<($3->dt).size();i++)
				{
					if(symTab.addVariable(($3->nm)[i],($3->dt)[i],genParameterName(($3->dt)[i],i+1))==1)
					{
						yyerror("Parameter Redclaration");
					}
				}

				instructions.push_back("func begin " + newFun);

			}

func_id : paramType ID {
				struct Params * ps = new struct Params;
				ps->nm.push_back($2->x);
				if($1==0)
				{
					ps->dt.push_back(_int);
				}
				else
					ps->dt.push_back(_float);
				$$ = ps;
			}
			| VOID ID{
				struct Params * ps = new struct Params;
				ps->nm.push_back($2->x);
				ps->dt.push_back(_void);
				$$ = ps;
			}

parametersDec : parametersDecNonEmpty {$$ = $1; } | {
				struct Params * ps = new struct Params;
				$$ = ps;
			}

parametersDecNonEmpty : paramDec {$$ = $1;} | paramDec COM parametersDecNonEmpty {
				$$ = $1;
				for(auto cx : $3->nm)
					$$->nm.push_back(cx);
				for(auto cx : $3->dt)
					$$->dt.push_back(cx);
			}

paramDec : paramType ID {
				struct Params * ps = new struct Params;
				ps->nm.push_back($2->x);
				if($1==0)
				{
					ps->dt.push_back(_int);
				}
				else
					ps->dt.push_back(_float);
				$$ = ps;
			}

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
				instructions.pb("");
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

exp_rel : exp_rel OR M exp_rel_and {
				struct stmt *S = new struct stmt;
				backpatch($1->falselist,$3);
				S->truelist = mergelist($1->truelist,$4->truelist);
				S->falselist = $4->falselist;
				$$ = S;
			} 
		  | exp_rel_and { $$ = $1;}

exp_rel_and : exp_rel_and AND M exp_rel_not {
				struct stmt *S = new struct stmt;
				backpatch($1->truelist,$3);
				S->truelist = $4->truelist;
				S->falselist = mergelist($1->falselist,$4->falselist);
				$$ = S;
			  }
			 | exp_rel_not {$$ = $1;}

exp_rel_not : NOT exp_rel_term {
				struct stmt *S = new struct stmt;
				S->truelist = $2->falselist;
				S->falselist = $2->truelist;
				$$ = S;
			  } 
			  | exp_rel_term {$$ = $1;}

exp_rel_term : LRB exp_rel RRB { $$ = $2; } 
			   | exp relOp exp {
				   if($1->type==_void || $3->type==_void)
				   {
						yyerror("Invalid Use of Void Return Type");
				   }
				   struct stmt *S = new struct stmt;
				   int nextInstr = instructions.size();
				   S->truelist = makelist( nextInstr );
				   S->falselist = makelist( nextInstr+1 );
				   instructions.push_back("if "+ $1->addr + $2->x + $3->addr + " ");
				   freeTempVariable($1->addr);
				   freeTempVariable($3->addr);
				   instructions.push_back("");
				   $$ = S;
			   }

relOp : GT { struct str *newStr = new struct str(" > "); 
			 $$ = newStr;
		} 
		| LT { struct str *newStr = new struct str(" < "); 
			 $$ = newStr;
		} 
		| GTE { struct str *newStr = new struct str(" <= "); 
			 $$ = newStr;
		} 
		| LTE { struct str *newStr = new struct str(" >= "); 
			 $$ = newStr;
		} 
		| EQ { struct str *newStr = new struct str(" == "); 
			 $$ = newStr;
		} 
		| NEQ { struct str *newStr = new struct str(" != "); 
			 $$ = newStr;
		}

exp : ID EQUAL exp {
			if($3->type==_void)
			{
				yyerror("Invalid Use of Void Return Type");
			}
			Variable * temp = symTab.findVariable($1->x);
			if(temp==NULL)
			{
				yyerror(" Undefined Variable . ");
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
			if($1->type==_void || $3->type==_void)
			{
				yyerror("Invalid Use of Void Return Type");
			}
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
			if($1->type==_void || $3->type==_void)
			{
				yyerror("Invalid Use of Void Return Type");
			}
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
				E->addr = getTempVariable(temp->returnType);
				
				int parCount = temp->params.size();
				int passed = $3->nm.size();
				if(passed!=parCount)
				{
					yyerror("Incorrect Number of Arguements");
				}
				string tc;
				for(int i=0;i<parCount;i++)
				{
					if(temp->params[i] != $3->dt[i])
					{
						tc =  getTempVariable(temp->params[i]);
						instructions.push_back(tc+" = "+$3->nm[i]);
						freeTempVariable($3->nm[i]);
						$3->nm[i] = tc;
					}
					instructions.push_back("param "+$3->nm[i]);
					freeTempVariable($3->nm[i]);
				}
				tc = "";
				if(E->type != _void)
				{
					tc = E->addr + " = ";
				}
				tc = tc + "call " + temp->name + ", " + to_string(parCount);
				instructions.push_back(tc);
				$$=E;
			}

paramList : paramListNonEmpty {$$ = $1;} | {
						struct Params * ps = new struct Params;
						$$ = ps;
					}

paramListNonEmpty : exp COM paramListNonEmpty {
						if($1->type==_void)
						{
							yyerror("Invalid Use of Void Return Type");
						}
						struct Params * ps = new struct Params;
						ps->nm.push_back($1->addr);
						ps->dt.push_back($1->type);
						for(auto cx : $3->nm)
							ps->nm.push_back(cx);
						for(auto cx : $3->dt)
							ps->dt.push_back(cx);
						$$ = ps;
					}
					| exp {
						if($1->type==_void)
						{
							yyerror("Invalid Use of Void Return Type");
						}
						struct Params * ps = new struct Params;
						ps->nm.push_back($1->addr);
						ps->dt.push_back($1->type);
						$$ = ps;
					}

%%

int main()
{
	funcNum = 0;
	intVarNum = 0;
	floatVarNum = 0;
	lblNum = 0;
	lc=-1;
	for(int i=0;i<FLOATREGS;i++)
		floatTemps[i] = 0;
	for(int i=0;i<INTREGS;i++)
		intTemps[i] = 0;
	yyparse();

	for(auto c : instructions)
	{
		if(c=="")
			continue;
		cout<<c<<endl;
	}

	//symTab.printVars();
} 