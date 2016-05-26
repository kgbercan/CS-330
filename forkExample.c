#include  <stdio.h>
#include  <string.h>
#include  <sys/types.h>
#include <ctype.h>
#include <limits.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h> 

int main(void) {
  int iCounter = 0;
  printf("#1: Counter=%d\n", iCounter);
  pid_t pidFork = fork();
  if (pidFork == 0) {
    /* Child... */
    iCounter++;
  } else {
    /* Parent... */
    iCounter--;
  }
  printf("#2: Counter=%d\n", iCounter);
  pidFork = fork();
  if (pidFork == 0) {
    /* Child... */
    iCounter++;
  } else {
    /* Parent... */
    iCounter--;
  }
  printf("#3: Counter=%d\n", iCounter);
}