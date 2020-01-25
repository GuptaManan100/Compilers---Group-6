#include<stdio.h>
#include<string.h>

char token[1024];
FILE *fp;

void getToken(){
  fscanf(fp,"%s",next_token);
}

int main(){
  fp = fopen("intermediate_representation.txt","r");

  if(fp==NULL){
    return 0;
  }



  fclose(fp);
  return 0;
}
