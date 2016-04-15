#include <stdio.h>

int main(void){

   int a = 5;
   int *p;
   p=&a;
   
   printf("a is %d, p is %p, &a is is %p",a,p,&a);
   
   printf("\n\np is pointing to the value: %d",*p);
   
   int *s, t, u;
   
   t = 10;
   s = &t;
   u = *s;
//   printf("\n\nt is at: %p, u is at: %p",&t, &u);
   u = u+1;
 // &u = &t;  //this doesn't work
 //  printf("\n\n\nt = %d, s = %p, u = %d",t,s,u);
//   printf("\n\nt is at: %p, u is at: %p",&t, &u);

   addOne(&u);
   printf("\n\n\nt = %d, s = %p, u = %d @ %p",t,s,u,&u);
   swap(&u,&t);
   printf("\n\n\nt = %d, s = %p, u = %d @ %p",t,s,u,&u);
   
   int ary [10];
   printf("\n\n\n%d",ary[12]);
   
   printf("\n\nary[12] @ %p, a @ %p", &ary[12], &a);
   
   ary[12] = 1000;
   
   printf("\n\nary[12] @ %d, a @ %d", ary[12], a);
}

swap(int *x, int *y){
   int z;
   z = *x;
   *x = *y;
   *y = z;

}

addOne(int *x){
printf("\n\nx = %d, at %p",*x,&x);
   *x = *x+1;
   //(*x)++;
   //++*x;
   printf("\n\nx = %d",*x);
}