#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int increment(int i){
      i+=1;
      printf("in increment(), a is %d\n",i);
      return(i);
}

void fizzBuzz(){
   for(int i=1;i<100;i++){
      //if %3 print fizz
      if(i%3==0){
         printf("fizz");
      }
      //if %5 print buzz
      if(i%5==0){
         printf("buzz");
      }
      if(i%3!=0 && i%5!=0){
         printf("%d",i);
      }
      printf("\n\n");
   }
}

int decrement(int i){
   i--;
   printf("%d ",i);
   if(i>0){
      decrement(i);
   }
   return(i);
}



int main(void){
// PART I: FIZZBUZZ
   fizzBuzz();   
   
// PART II: 
   // 1) C passes parameters by value
   int a = 9;
   printf("a is originally %d\n",a);
   increment(a);
   printf("after increment, a is %d\n\n",a);
   
   // 2) C assigns values to variables by value
   int b = a;
   printf("b is %d\n",b);
   a = 7;
   printf("a is now %d\n",a);
   printf("b is still %d\n\n",b);
   
   // 3) Variables are static and strongly-typed
   // the following throws an error, undeclared identifier
   // c = 3;
   //
   // and you can't switch from type to type
   // a = "tree";
   
   // 4) C supports widening conversions, so you can put an int into a float
   //    but it doesn't support narrowing conversions, so you cannot put a
   //    float into an int. Actually, you can assign a float value to an int
   //    variable, but it is rounded down to the nearest whole number.
   int c = 3;
   printf("int c is 3: %d\n",c);
   float d = c;
   printf("float d with value c: %f\n",d);
   d = 4.83333;
   printf("float d is reassigned 4.83333: %f\n",d);
   c = d;
   printf("int c is reassigned d: %d\n\n",c);
   
   // 5) C does support recursion.
   decrement(10);
   printf("\n\n");
   
// Part III: Guessing Game
   //user has 7 chances to guess
   int count = 0;
   //number b/w 0 and 10
   srand(time(NULL));
   int num = rand()%10;
   int guess = 11;
   //loop control variable
   int guesses[7];
   
   //game
   while(guess!=num && count<7){
      if(count>0){
         printf("You've already guessed: ");
         for(int i=0; i<count; i++){
            int g = guesses[i];
            printf("%d ",g);
         }
      }
      printf("\nGuess a number: ");
      scanf("%d",&guess);
      guesses[count]=guess;
      if(guess!=num){
         printf("That's not right.\n\n");
      }
      count++;
   }
   
   printf("You guessed: ");
   for(int i=0; i<count; i++){
      int g = guesses[i];
      printf("%d ",g);
   }
   if(guess==num){
      printf("You won.\n");
      printf("It took you %d tries to get it right.",count);
   }
   else{
      printf("You lost. The right answer was %d.",num);
   }
 
}
