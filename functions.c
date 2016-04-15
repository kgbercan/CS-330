#include <stdio.h>
#include <string.h>

void fillArray2(int [], int);
void fillArray(int [], int);
void printArray(int [], int);

int main(void){

   int aryLen = 10;
   int ary [aryLen];
   printArray(ary,aryLen);
   fillArray(ary,aryLen);
   printArray(ary,aryLen);
   
   fillArray2(ary,aryLen);
   printArray(&ary[0],aryLen);
   
}

void fillArray2(int *pa, int len){
   
   int i;
   for(i=0; i<len; i++){
      *pa=i*3;
      ++pa;
   }
   
}

void fillArray(int a[], int len){

   int i;
   for(i=0; i<len; i++){
      a[i]=i*2;
   }

}

void printArray(int a[], int len){

   int i;
   for(i=0;i<len;i++){
      printf("%d ", a[i]);
   }
   printf("\n\n");
   
}
