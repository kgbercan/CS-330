#include<stdio.h>
#include<string.h>

struct Book{

   char title[250];
   char author[250];
   int year;

};

void printBook(struct Book);
// void changeTitle(struct Book*);
void changeTitle(struct Book*,char []);
void changeAuthor(struct Book*, char []);
void changeYear(struct Book*, int);

int main(void){

   int NUM = 3;
   int i = 0;
   
   struct Book first;
   struct Book second;
   struct Book third;
   struct Book library[] = {first,second,third};
   
   for(i=0; i<NUM; i++){
      printf("Title of book %d: ",(i+1));
      char t[250];
      scanf("%[^\n]%*c",t);
      changeTitle(&library[i],t);
      
      printf("Author of book %d: ",(i+1));
      char a[250];
      scanf("%[^\n]%*c",a);
      changeAuthor(&library[i],a);
      
      printf("Year of book %d: ",(i+1));
      int y;
      scanf("%d",&y);
      getchar();
      changeYear(&library[i],y);

   }
   
 //  changeTitle(&b);
   printf("\n\nYour library has: \n");
   for(i=0; i<NUM; i++){
      printBook(library[i]);
      printf("\n");
   }
}

void printBook(struct Book b){
   printf("%s by %s published in %d",b.title,b.author,b.year);
}

/*
void changeTitle(struct Book *b){
   // parentheses around *b is necessary
   strcpy((*b).title,"americanah");
}*/

void changeTitle(struct Book *b, char t[]){
   // this is the better way to do it
   strcpy(b -> title,t);
   
}

void changeAuthor(struct Book *b, char a[]){
   strcpy(b -> author,a);
   
}

void changeYear(struct Book *b, int y){
   b -> year=y;
   
}