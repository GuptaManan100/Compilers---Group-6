#include <stdio.h>
#include <string.h>

struct Map {
    char elem[1024];
};

struct Map var[1000];
char token[1024];
FILE *fp, *outfp;
int idx, tempfp = 0, fileEnd = 1, compop = 0, lcount = 0;

int comp(char* tok, int lblval);
int readstatements(int lblval, int wval);
int readstatement(int lblval);
int printops(char* tok, int lblval);
int comp(char* tok, int lblval);
int loadval(char* tok) { fprintf(outfp, "MOV BX, %sD\n", tok); }
int loadvar(char* tok) { fprintf(outfp, "MOV BX, [%s]\n", tok); }
int loadacc(char* tok) { fprintf(outfp, "MOV AX, [%s]\n", tok); }

void gettoken() {
    if (fscanf(fp, "%s", token) == EOF) {
        fileEnd = 0;
    };
}

int findVar(char* tok) {
    for (int i = 0; i < 1000 && var[i].elem[0] != '\0'; i++) {
        if (strcmp(var[i].elem, tok) == 0) {
            return 1;
        }
    }
    return 0;
}

int asmgen() {
    tempfp = ftell(fp);
    gettoken();
    for (; fileEnd; gettoken()) {
        if (token[0] == '}') {
            return 0;
        } else if (token[0] == '{') {
            asmgen();
        } else if (strcmp(token, "if") == 0) {
            gettoken();
            tempfp = ftell(fp);
            readstatements(++lcount, 0);
        } else if (strcmp(token, "while") == 0) {
            gettoken();
            tempfp = ftell(fp);
            fprintf(outfp, "\n\tL%d:\n", ++lcount);
            int wval = lcount;
            readstatements(++lcount, wval);
        } else {
            fseek(fp, tempfp, SEEK_SET);
            readstatement(0);
        }
        tempfp = ftell(fp);
    }
}

int readstatements(int lblval, int wval) {
    gettoken();
    while (token[0] != ')') {
        fseek(fp, tempfp, SEEK_SET);

        readstatement(lblval);
        tempfp = ftell(fp);

        gettoken();
    }
    if (compop == 0) {
        fprintf(outfp, "CMP AX, 00D\nJZ L%d\n", lblval);
    } else {
        compop = 0;
    }
    gettoken();
    asmgen();
    if (wval) {
        fprintf(outfp, "JMP L%d\n", wval);
    }
    fprintf(outfp, "\n\tL%d:\n", lblval);
    return 0;
}

int readstatement(int lblval) {
    char tok[3][1024];
    gettoken();
    strcpy(tok[0], token);
    gettoken();
    strcpy(tok[1], token);
    gettoken();
    strcpy(tok[2], token);
    if (tok[2][0] >= '0' && tok[2][0] <= '9') {
        loadval(tok[2]);
        loadacc(tok[0]);
    } else {
        loadvar(tok[2]);
        loadacc(tok[0]);
		if (!findVar(tok[2])) {
		    strcpy(var[idx++].elem, tok[2]);
		    var[idx].elem[0] = '\0';
		}
    }
    printops(tok[1], lblval);
    fprintf(outfp, "MOV [%s], AX\n\n", tok[0]);

    if (!findVar(tok[0])) {
	    strcpy(var[idx++].elem, tok[0]);
	    var[idx].elem[0] = '\0';
	}
}

int printops(char* tok, int lblval) {
    if (strcmp(tok, "+=") == 0) {
        fprintf(outfp, "ADD AX, BX\n");
    } else if (strcmp(tok, "-=") == 0) {
        fprintf(outfp, "SUB AX, BX\n");
    } else if (strcmp(tok, "/=") == 0) {
        fprintf(outfp, "MUL BX\n");
    } else if (strcmp(tok, "*=") == 0) {
        fprintf(outfp, "DIV BX\n");
    } else if (strcmp(tok, "=") == 0) {
        fprintf(outfp, "MOV AX, BX\n");
    } else {
        comp(tok, lblval);
    }
}

int comp(char* tok, int lblval) {
    compop = 1;
    fprintf(outfp, "CMP AX, BX\n");
    if (strcmp(tok, ">") == 0) {
        fprintf(outfp, "JLE L%d\n", lblval);
    } else if (strcmp(tok, "<") == 0) {
        fprintf(outfp, "JGE L%d\n", lblval);
    } else if (strcmp(tok, "==") == 0) {
        fprintf(outfp, "LNZ L%d\n", lblval);
    }
}

int main() {
    idx = 0;
    var[0].elem[0] = '\0';
    fp = fopen("intermediateCode.txt", "r");
    outfp = fopen("outfile.asm", "w+");
    if (fp == NULL) {
        printf("NO FILE EXISTS FILE\n");
        return 0;
    }
    fprintf(outfp, "section .text\n global _start\n_start:\n");
    asmgen();
    fprintf(outfp, "\nmov ebx,0\nmov eax,1\nint 0x80");
    fprintf(outfp, "\n\nsection .bss\n");
    for (int i = 0; i < idx; i++) {
        fprintf(outfp, "%s resb 2\n", var[i].elem);
    }
    fclose(fp);
    fclose(outfp);
    return 0;
}
