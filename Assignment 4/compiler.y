%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	int count_line = 1;
	extern int yylex();
	void yyerror(char *s)
	{
		fprintf(stderr,"INVALID SYNTAX\n");
		exit(1);
	}
	int yywrap()
	{
		return 1;
	}

	struct cond{
		int type; //0 = AND, 1=OR, 2=LT, 3 = LTE, 4 = GT, 5 = GTE, 6=EQ
		struct cond * lef;
		struct cond * rig;
		char vals[2][100];
	};

	struct condEq{
		int type; //0 = AND, 1=OR, 6=EQ
		struct condEq * lef;
		struct condEq * rig;
		char vals[2][100];
	};

	int getType(char op[100])
	{
		if(strcmp(op, "AND")==0)
			return 0;
		if(strcmp(op, "and")==0)
			return 0;
		if(strcmp(op, "OR")==0)
			return 1;
		if(strcmp(op, "or")==0)
			return 1;
		if(strcmp(op, "<")==0)
			return 2;
		if(strcmp(op, "<=")==0)
			return 3;
		if(strcmp(op, ">")==0)
			return 4;
		if(strcmp(op, ">=")==0)
			return 5;
		if(strcmp(op, "=")==0)
			return 6;
		return 0;
	} 

	struct cond * makeCondLeaf(char vals1[100], char op[100], char vals2[100])
	{
		struct cond * newCond = (struct cond *) malloc(sizeof(struct cond));
		newCond->type = getType(op);
		//printf("%d\n",newCond->type);
		strcpy(newCond->vals[0],vals1);
		strcpy(newCond->vals[1],vals2);

		return newCond;
	}

	struct cond * makeCondNonLeaf(struct cond * l, char op[100], struct cond * r)
	{
		struct cond * newCond = (struct cond *) malloc(sizeof(struct cond));
		newCond->type = getType(op);
		//printf("%d\n",newCond->type);
		newCond->lef = l;
		newCond->rig = r;

		return newCond;
	}

	struct condEq * makeCondEqLeaf(char vals1[100])
	{
		struct condEq * newCond = (struct condEq *) malloc(sizeof(struct condEq));
		newCond->type = 6;
		//printf("%d\n",newCond->type);

		int i;
		int idx = 0;
		for(int i=0;i<100;i++)
		{
			if(vals1[i]=='=')
			{
				idx++;
				continue;
			}
			if(vals1[i]=='\0')
			{
				break;
			}
			if(vals1[i]==' '||vals1[i]=='\t')
			{
				continue;
			}
			strncat(newCond->vals[idx],&vals1[i],1);
		}

		//printf("%s %s \n",newCond->vals[0],newCond->vals[1]);

		return newCond;
	}

	struct condEq * makeCondEqNonLeaf(struct condEq * l, char op[100], struct condEq * r)
	{
		struct condEq * newCond = (struct condEq *) malloc(sizeof(struct condEq));
		newCond->type = getType(op);
		//printf("%d\n",newCond->type);
		newCond->lef = l;
		newCond->rig = r;

		return newCond;
	}

	char temp[1000];
	FILE* files[2];	
	char tableName[2][100];
	int fieldCount[2];
	char fieldHeaders[2][100][100];
	char fieldValues[2][100][100];

	void loadTableHeader(char na[100], int idx);
	void projection(char fieldList[100]);
	void cartesian_product();
	void selection(struct cond * root);
	void equiJoin(struct condEq * root);
%}

%token PROJECT
%token SELECT
%token CARTESIAN_PRODUCT
%token EQUI_JOIN
%token LT
%token GT
%token LTE
%token GTE
%token LB
%token EQ
%token EQUALITY_CONDITION
%token RB
%token NEWLINE
%token COLON
%token ID
%token OPERATOR
%token COMMA
%token STR
%token ERR


%%

%union{
	char inp[100];
	struct cond * root;
	struct condEq * rootEq;
};

statements 			: statement NEWLINE ;
statement 			: SELECT LT conditions GT LB ID RB{
							loadTableHeader($<inp>6,0);
							selection($<root>3);
						} | 
					  PROJECT LT attribute_lists GT LB ID RB {
					  		loadTableHeader($<inp>6,0);
					  		projection($<inp>3);
					  }|
					  LB ID RB CARTESIAN_PRODUCT LB ID RB {
					  		loadTableHeader($<inp>2,0);
					  		loadTableHeader($<inp>6,1);
					  		cartesian_product();
					  }|
					  LB ID RB EQUI_JOIN LT equi_conditions GT LB ID RB {
					  		loadTableHeader($<inp>2,0);
					  		loadTableHeader($<inp>9,1);
					  		equiJoin($<rootEq>6);
					  };
attribute_lists		: attribute_lists COMMA ID {
						strcpy($<inp>$,$<inp>1);
						strncat($<inp>$,",",1);
						strncat($<inp>$,$<inp>3,100);
					}|
					  ID;
conditions 			: conditions OPERATOR condition{
							$<root>$ = makeCondNonLeaf($<root>1, $<inp>2, $<root>3);
					} |
			 		  condition{ 
			 		  		$<root>$ = $<root>1;
			 		  };
condition 			: ID COMPARISON_OP ID {
							$<root>$ = makeCondLeaf($<inp>1,$<inp>2,$<inp>3);
						}
						| ID COMPARISON_OP STR {
							$<root>$ = makeCondLeaf($<inp>1,$<inp>2,$<inp>3);
						}	
					;
COMPARISON_OP		: LT | GT | LTE | GTE | EQ;
equi_conditions		: equi_conditions OPERATOR EQUALITY_CONDITION{
							$<rootEq>$ = makeCondEqNonLeaf($<rootEq>1,$<inp>2,makeCondEqLeaf($<inp>3));
						} |
					  EQUALITY_CONDITION { 
					  		$<rootEq>$ = makeCondEqLeaf($<inp>1);
					  };

%%

void loadTableHeader(char na[100], int idx)
{
	strcpy(tableName[idx],na);
	strncat(na,".txt",4);
	FILE *fptr;
	fptr = fopen(na,"r");
	if(fptr==NULL)
	{
		printf("Table not found\n");	
		exit(0);
	}
	files[idx] = fptr;

	char c;
	int x = 0;
	fieldHeaders[idx][0][0] = '\0';
	while ( 1 )
	{
		c = fgetc ( fptr ) ;
		if(c=='\n' || c==EOF)
			break;
		if(c==',')
		{
			x++;
			fieldHeaders[idx][x][0] = '\0';
		}
		else if(c==' '||c=='\t')
		{
			continue;
		}
		else
		{
			strncat(fieldHeaders[idx][x],&c,1);
		}
	}

	fieldCount[idx] = x+1;

}

int verifyFieldHeader(int idx)
{
	for(int i=0;i<fieldCount[0];i++)
	{
		//printf("%s, %s -> %d",fieldHeaders[1][idx], fieldHeaders[0][i],strcmp(fieldHeaders[1][idx], fieldHeaders[0][i]));
		if(strcmp(fieldHeaders[1][idx], fieldHeaders[0][i])==0)
			return 1;
	}
	return 0;
}

void printField(int idx)
{
	for(int i=0;i<fieldCount[0];i++)
	{
		if(strcmp(fieldHeaders[1][idx], fieldHeaders[0][i])==0)
		{
			printf("%s",fieldValues[0][i]);
			return;
		}
	}
}

int readLine(int idx)
{
	char c;
	int x = 0;
	fieldValues[idx][0][0] = '\0';
	while ( 1 )
	{
		c = fgetc ( files[idx] ) ;
		if(c=='\n')
			return 1;
		if(c==EOF)
			return 0;
		if(c==',')
		{
			x++;
			fieldValues[idx][x][0] = '\0';
		}
		else if(c==' '||c=='\t')
		{
			continue;
		}
		else
		{
			strncat(fieldValues[idx][x],&c,1);
		}
	}

	return 1;
}

void projection(char fieldList[100])
{
	char c;
	int idx = 0;
	int x = 0;
	fieldHeaders[1][0][0] = '\0';
	while ( 1 )
	{
		if(idx==100)
			break;
		c = fieldList[idx++] ;
		if(c=='\n' || c==EOF || c=='\0')
			break;
		if(c==',')
		{
			x++;
			fieldHeaders[1][x][0] = '\0';
		}
		else if(c==' '||c=='\t')
		{
			continue;
		}
		else
		{
			strncat(fieldHeaders[1][x],&c,1);
		}
	}

	fieldCount[1] = x+1;

	for(int i=0;i<fieldCount[1];i++)
	{
		if(verifyFieldHeader(i)==0)
		{
			printf("Column %s not found\n",fieldHeaders[1][i]);
			exit(0);
		}
	}

	printf("%s\n",fieldList);
	while(1)
	{
		x = readLine(0);
		for(int i=0;i<fieldCount[1];i++)
		{
			printField(i);
			if(i<fieldCount[1]-1)
				printf(",");
		}
		printf("\n");
		if(x==0)
			break;
	}

}

void cartesian_product()
{
	for(int i=0;i<fieldCount[0];i++)
	{
		printf("%s,",fieldHeaders[0][i]);
	}

	for(int i=0;i<fieldCount[1];i++)
	{
		printf("%s",fieldHeaders[1][i]);
		if(i<fieldCount[1]-1)
			printf(",");
	}
	printf("\n");

	char na[100];
	strcpy(na,tableName[1]);
	strncat(na,".txt",4);
	files[1] = fopen(na,"r");

	int x,y;
	while(1)
	{
		x = readLine(0);
		files[1] = fopen(na,"r");
		y = readLine(1);


		while(1)
		{
			y = readLine(1);

			for(int i=0;i<fieldCount[0];i++)
			{
				printf("%s,",fieldValues[0][i]);
			}

			for(int i=0;i<fieldCount[1];i++)
			{
				printf("%s",fieldValues[1][i]);
				if(i<fieldCount[1]-1)
					printf(",");
			}
			printf("\n");

			if(y==0)
				break;
		}
		if(x==0)
			break;
	}

}

int isNumber(char val[100])
{
	for(int i=0;i<100;i++)
	{
		if(val[i]=='\0')
			return 1;
		if(val[i]>='0' && val[i]<='9')
			continue;
		return 0;
	}
	return 0;
}

int findValUtil(struct cond * root)
{
	char oper[2][100];
	char temp[100];
	strcpy(temp,"");
	strcpy(oper[0],"");
	strcpy(oper[1],"");

	int x = 0;
	//printf("%s %d %s\n",root->vals[0], root->type, root->vals[1]);
	strcpy(temp,root->vals[0]);
	for(int i=0;i<fieldCount[0];i++)
	{
		if(strcmp(temp, fieldHeaders[0][i])==0){
			strcpy(oper[0],fieldValues[0][i]);
			x = 1;
			break;
		}
	}

	if(x==0)
	{
		printf("No Column %s Found\n",temp);
		exit(1);
	}

	x = 0;
	strcpy(temp,root->vals[1]);
	if(isNumber(temp))
	{
		x = 1;
		strcpy(oper[1],temp);
	}

	if(x==0 && temp[0]=='\'')
	{
		x = strlen(temp);
		for(int i=1;i<x-1;i++)
		{
			oper[1][i-1] = temp[i];
		}
		oper[1][x-2] = '\0';
		x = 1;
	}
	if(x==0 && temp[0]=='\"')
	{
		x = strlen(temp);
		for(int i=1;i<x-1;i++)
		{
			oper[1][i-1] = temp[i];
		}
		oper[1][x-2] = '\0';
		x = 1;
	}

	if(x==0)
	{
		for(int i=0;i<fieldCount[0];i++)
		{
			if(strcmp(temp, fieldHeaders[0][i])==0){
				strcpy(oper[1],fieldValues[0][i]);
				x = 1;
				break;
			}
		}
	}

	if(x==0)
	{
		printf("No Column %s Found\n",temp);
		exit(1);
	}


	int y;

	if(isNumber(oper[0]) && isNumber(oper[1]))
	{
		x = atoi(oper[0]);
		y = atoi(oper[1]);

		if(root->type == 2)
		{
			if(x<y)
				return 1;
			return 0;
		}
		if(root->type == 3)
		{
			if(x<=y)
				return 1;
			return 0;
		}
		if(root->type == 4)
		{
			if(x>y)
				return 1;
			return 0;
		}
		if(root->type == 5)
		{
			if(x>=y)
				return 1;
			return 0;
		}
		if(root->type == 6)
		{
			if(x==y)
				return 1;
			return 0;
		}
	}

	x = strcmp(oper[0],oper[1]);
	y = 0;
	if(root->type == 2)
	{
		if(x<y)
			return 1;
		return 0;
	}
	if(root->type == 3)
	{
		if(x<=y)
			return 1;
		return 0;
	}
	if(root->type == 4)
	{
		if(x>y)
			return 1;
		return 0;
	}
	if(root->type == 5)
	{
		if(x>=y)
			return 1;
		return 0;
	}
	if(root->type == 6)
	{
		if(x==y)
			return 1;
		return 0;
	}
	return 1;
}

int findVal(struct cond * root)
{
	int x,y;
	if(root->type == 0)
	{
		//AND
		x = findVal(root->lef);
		y = findVal(root->rig);
		return x&y;
	}
	else if(root->type == 1)
	{
		//OR
		x = findVal(root->lef);
		y = findVal(root->rig);
		return x|y;
	}
	return findValUtil(root);
}

int findValEqUtil(struct condEq * root)
{
	char oper[2][100];
	char temp[2][100];

	strcpy(temp[0],"");
	strcpy(temp[1],"");
	strcpy(oper[0],"");
	strcpy(oper[1],"");

	int idx = 0;
	for(int i=0;i<100;i++)
	{
		if(root->vals[0][i]=='.')
		{
			idx++;
			continue;
		}
		if(root->vals[0][i]=='\0')
		{
			break;
		}
		if(root->vals[0][i]==' '||root->vals[0][i]=='\t')
		{
			continue;
		}
		strncat(temp[idx],&(root->vals[0][i]),1);
	}

	int x = 0;
	idx = -1;

	if(strcmp(temp[0],tableName[0])==0)
		idx=0;
	if(strcmp(temp[0],tableName[1])==0)
		idx=1;

	if(idx==-1)
	{
		printf("No Table %s Found\n",temp[0]);
		exit(1);
	}

	
	for(int i=0;i<fieldCount[idx];i++)
	{
		//printf("%s\n",fieldHeaders[idx][i]);
		if(strcmp(temp[1], fieldHeaders[idx][i])==0){
			strcpy(oper[0],fieldValues[idx][i]);
			x = 1;
			break;
		}
	}

	if(x==0)
	{
		printf("No Column %s Found in Table %s\n",temp[1],temp[0]);
		exit(1);
	}
	
	x = 0;
	strcpy(temp[0],"");
	strcpy(temp[1],"");
	idx = 0;
	for(int i=0;i<100;i++)
	{
		if(root->vals[1][i]=='.')
		{
			idx++;
			continue;
		}
		if(root->vals[1][i]=='\0')
		{
			break;
		}
		if(root->vals[1][i]==' '||root->vals[1][i]=='\t')
		{
			continue;
		}
		strncat(temp[idx],&(root->vals[1][i]),1);
	}

	if(isNumber(temp[0]))
	{
		x = 1;
		strcpy(oper[1],temp[0]);
	}

	
	if(x==0 && temp[0][0]=='\'')
	{
		x = strlen(temp[0]);
		for(int i=1;i<x-1;i++)
		{
			oper[1][i-1] = temp[0][i];
		}
		oper[1][x-2] = '\0';
		x = 1;
	}

	if(x==0 && temp[0][0]=='\"')
	{
		x = strlen(temp[0]);
		for(int i=1;i<x-1;i++)
		{
			oper[1][i-1] = temp[0][i];
		}
		oper[1][x-2] = '\0';
		x = 1;
	}

	if(x==0)
	{
		idx = -1;

		if(strcmp(temp[0],tableName[0])==0)
			idx=0;
		if(strcmp(temp[0],tableName[1])==0)
			idx=1;

		if(idx==-1)
		{
			printf("No Table %s Found\n",temp[0]);
			exit(1);
		}

		
		for(int i=0;i<fieldCount[idx];i++)
		{
			if(strcmp(temp[1], fieldHeaders[idx][i])==0){
				strcpy(oper[1],fieldValues[idx][i]);
				x = 1;
				break;
			}
		}
	}

	if(x==0)
	{
		printf("No Column %s Found in Table %s\n",temp[1],temp[0]);
		exit(1);
	}

	//printf("%s, %s\n",oper[0],oper[1]);

	int y;

	if(isNumber(oper[0]) && isNumber(oper[1]))
	{
		x = atoi(oper[0]);
		y = atoi(oper[1]);

		if(root->type == 2)
		{
			if(x<y)
				return 1;
			return 0;
		}
		if(root->type == 3)
		{
			if(x<=y)
				return 1;
			return 0;
		}
		if(root->type == 4)
		{
			if(x>y)
				return 1;
			return 0;
		}
		if(root->type == 5)
		{
			if(x>=y)
				return 1;
			return 0;
		}
		if(root->type == 6)
		{
			if(x==y)
				return 1;
			return 0;
		}
	}

	x = strcmp(oper[0],oper[1]);
	y = 0;
	if(root->type == 2)
	{
		if(x<y)
			return 1;
		return 0;
	}
	if(root->type == 3)
	{
		if(x<=y)
			return 1;
		return 0;
	}
	if(root->type == 4)
	{
		if(x>y)
			return 1;
		return 0;
	}
	if(root->type == 5)
	{
		if(x>=y)
			return 1;
		return 0;
	}
	if(root->type == 6)
	{
		if(x==y)
			return 1;
		return 0;
	}
	return 0;
}

int findValEq(struct condEq * root)
{
	int x,y;
	if(root->type == 0)
	{
		//AND
		x = findValEq(root->lef);
		y = findValEq(root->rig);
		return x&y;
	}
	else if(root->type == 1)
	{
		//OR
		x = findValEq(root->lef);
		y = findValEq(root->rig);
		return x|y;
	}
	return findValEqUtil(root);
}

void selection(struct cond * root)
{
	int numRows = 0;

	int x;
	while(1)
	{	
		x = readLine(0);

		if(findVal(root)==1)
		{
			if(numRows==0)
			{
				for(int i=0;i<fieldCount[0];i++)
				{
					printf("%s",fieldHeaders[0][i]);
					if(i<fieldCount[0]-1)
						printf(",");
				}
				printf("\n");
			}
			numRows++;
			for(int i=0;i<fieldCount[0];i++)
			{
				printf("%s",fieldValues[0][i]);
				if(i<fieldCount[0]-1)
					printf(",");
			}
			printf("\n");
		}

		if(x==0)
			break;
	}

	if(numRows==0)
	{
		printf("No rows selected\n");
	}
}

void equiJoin(struct condEq * root)
{
	int numRows = 0;

	char na[100];
	strcpy(na,tableName[1]);
	strncat(na,".txt",4);

	int x,y;
	while(1)
	{
		x = readLine(0);
		files[1] = fopen(na,"r");
		y = readLine(1);


		while(1)
		{
			y = readLine(1);

			if(findValEq(root)==1)
			{

				if(numRows==0)
				{
					for(int i=0;i<fieldCount[0];i++)
					{
						printf("%s,",fieldHeaders[0][i]);
					}

					for(int i=0;i<fieldCount[1];i++)
					{
						printf("%s",fieldHeaders[1][i]);
						if(i<fieldCount[1]-1)
							printf(",");
					}
					printf("\n");
				}
				numRows++;
				for(int i=0;i<fieldCount[0];i++)
				{
					printf("%s,",fieldValues[0][i]);
				}

				for(int i=0;i<fieldCount[1];i++)
				{
					printf("%s",fieldValues[1][i]);
					if(i<fieldCount[1]-1)
						printf(",");
				}
				printf("\n");
			}

			if(y==0)
				break;
		}
		if(x==0)
			break;
	}

	if(numRows==0)
	{
		printf("No rows printed\n");
	}

}

int main()
{
	yyparse();
	//printf("VALID\n");

	/*for(int i=0;i<5;i++)
	{
		printf("%s\n",fieldHeaders[0][i]);
	}*/
}