// libraries
#include <stdio.h>
#include <stdlib.h>

// struct called node
struct node{
   // attributes
   // data holds an int
   int data;
   // next holds the memory address of another node
   struct node * next;
};

// function declarations
void push(int, struct node **);
struct node* pop(struct node*);
void printStack(struct node *);
void pushBroken(int, struct node**);
int stackSize(struct node*);

// main
int main(){
   // top is a pointer to a node struct
   // holds null
   struct node* top = NULL;
   // size is 0
   int size=0;
   
   printf("in main");
   // prints "size = 0, top = [something that indicates it's null]"
   printf("\nsize = %d, *top = %p",size,top);
   
   // sends top (currently null) to printStack()
   printStack(top);
   
   printf("\nThe size of the stack is %d.\n", stackSize(top));
   pop(top);
   
   // sends the location of top (bc of the &)
   // to push() w the value 4
   push(4,&top);
   pop(top);
   
   printf("\nThe size of the stack is %d.\n", stackSize(top));
   
   // size is the size of the stack, top is the address of the node
   // top -> data is the value for data held in the node's address
   // top -> is the value for the next node held in the current node's address
   printf("\nsize = %d, *top = %p, top data = %d, top next = %p",size,top,top->data,top->next);
   printStack(top);
   //printf("\nsize = %d, *top = %p, top data = %d, top next = %p",size,top,top->data,top->next);
   push(5,&top);
   
   printf("\nThe size of the stack is %d.\n", stackSize(top));
   

   //printf("\nsize = %d, *top = %p, top data = %d, top next = %p",size,top,top->data,top->next);
   printStack(top);
   push(6,&top);
   
   printf("\nThe size of the stack is %d.\n", stackSize(top));
   

   printStack(top);
   return (0);
}

// takes an int and a pointer to a pointer called t and returns void
void push(int s, struct node ** t){
   printf("\n\npushing %d",s);
   // n is a pointer to a node (holds a memory address)
   // malloc() allocates memory space of the size needed for a node
   // and the first set of stuff in parentheses makes the address hold a pointer to a node
   struct node* n = (struct node*) malloc(sizeof(struct node));
   // goes to the address n and finds the attriute data and sets it to s
   n->data = s;
   // goes to the address n and finds the attribute next (which is an address also)
   // and sets it to the address of node t
   n->next=*t;
   // changes the address of t to the address of n
   *t=n;

}

// This next bit of code doesn't work: structs are passed by value,
// so for any changes to take place (without returning) you have to
// pass the memory locations, not just the values.
//
//
// pushBroken takes an int and a pointer to a pointer called t and returns void
void pushBroken(int s, struct node ** t){ 
   printf("\n\npushing %d",s);
   // n is a node
   struct node n;
   // the attribute data of n is s
   n.data = s;
   // the attribute next of n is an address to t
   n.next = *t;
   // the address to t is changed to the address of n
   *t = &n;
}

struct node* pop(struct node* t){
   struct node* top = NULL;
   if (t==NULL){
      printf("\n\nThe list is empty!");
   }
   else{
      top = t;
      printf("\nThe node you are popping off holds %d.\n",top -> data);
      t = t->next;
   }
   return(top);
}

// takes pointer to a node, returns void
void printStack(struct node* n){
   printf("\nprinting");
   // if the address sent in holds NULL
   if (n== NULL){
      // says the list is empty
      printf("\n\nThe list is empty!");
   }
   // if the address holds a node
   else{
      // while the value of next in the node that was sent in is not NULL
      // meaning, while the address sent in is a node and has a next node
      while(n->next != NULL){
         // prints the int held in the current node
         // and the address of the next node
         printf("\nN->data: %d, N->next = %p",n->data, n->next);
         // set the current node to the next node
         // this will alter the conditions that keeps us in the loop, eventually
         n = n->next;
      }
      // prints the int held in the node
      // and the location of the next node
      printf("\nn->data: %d, n->next = %p",n->data, n->next);
   }
}


int stackSize(struct node* n){
   int size = 0;
   if (n==NULL){
      // says the list is empty
      printf("\n\nThe list is empty!");
   }
   // if the address holds a node
   else{
      size++;
      // while the value of next in the node that was sent in is not NULL
      // meaning, while the address sent in is a node and has a next node
      while(n->next != NULL){
         // increment the count
         size++;
         // set the current node to the next node
         // this will alter the conditions that keeps us in the loop, eventually
         n = n->next;
      }
   }
   return(size);
}