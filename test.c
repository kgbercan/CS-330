#include <stdio.h>

int main(void){
   for(int i=0;i<100;i++){
      #if %3 print fizz
      if(i%3==0){
         printf("fizz");
      }
      #if %5 print buzz
      if(i%5==0){
         printf("buzz");
      }
      if(!i%3 && !i%5){
         printf("%d",i);
      }
   }
}