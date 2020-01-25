#include <stdio.h>
#include <string.h>

char token[1024];
FILE* fp;
FILE* outfp;
int tempfp = 0;
int fileEnd = 1;
int compop = 0;

void gettoken() {
    if (fscanf(fp, "%s", token) == EOF) {
        fileEnd = 0;
    };
}

// char* tocken;
int lcount = 0, st[1000] = {}, stcount = 0;
char* res[10000];

// strcpy(res, "");
int comp(char* tok, int lblval);
int readstatements(int lblval, int wval);
int readstatement(int lblval);

int loadval(char* tok) { fprintf(outfp, "MOV B %sd\n", tok); }
int loadvar(char* tok) { fprintf(outfp, "LDA %s\nMOV B A\n", tok); }
int loadacc(char* tok) { fprintf(outfp, "LDA %s\n", tok); }

int printops(char* tok, int lblval);
int comp(char* tok, int lblval);

int asmgen() {
    // get token
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

// int readcond() {
//     while (*(tocken = gettoken()) != '(')
//         ;
//     // read statements
//     readstatements();
// }

int readstatements(int lblval, int wval) {
    gettoken();
    while (token[0] != ')') {
        fseek(fp, tempfp, SEEK_SET);

        readstatement(lblval);
        tempfp = ftell(fp);

        gettoken();
    }
    if (compop == 0) {
        fprintf(outfp, "CMP A 0D\nJZ L%d\n", lblval);
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
    }

    printops(tok[1], lblval);
    fprintf(outfp, "STA %s\n", tok[0]);
}

int printops(char* tok, int lblval) {
    if (strcmp(tok, "+=") == 0) {
        fprintf(outfp, "ADD B\n");
    } else if (strcmp(tok, "-=") == 0) {
        fprintf(outfp, "SUB B\n");
    } else if (strcmp(tok, "/=") == 0) {
        fprintf(outfp, "MUL B\n");
    } else if (strcmp(tok, "*=") == 0) {
        fprintf(outfp, "DIV B\n");
    } else if (strcmp(tok, "=") == 0) {
        fprintf(outfp, "MOV A B\n");
    } else
        comp(tok, lblval);
}

int comp(char* tok, int lblval) {
    compop = 1;
    fprintf(outfp, "CMP A B\n");

    if (strcmp(tok, ">") == 0) {
        fprintf(outfp, "JLE L%d\n", lblval);
    } else if (strcmp(tok, "<") == 0) {
        fprintf(outfp, "JGE L%d\n", lblval);
    } else if (strcmp(tok, "==") == 0) {
        fprintf(outfp, "LNZ L%d\n", lblval);
    }
}

int main() {
    fp = fopen("sample.txt", "r");
    outfp = fopen("outfile.asm", "w");
    if (fp == NULL) {
        printf("EMPTY FILE\n");
        return 0;
    }
    printf("Calling asnge\n");
    asmgen();
    fclose(fp);
    fclose(outfp);
    return 0;
}
