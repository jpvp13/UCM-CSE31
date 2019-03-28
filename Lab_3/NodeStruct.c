
#include <stdio.h>
#include <stdlib.h>
//#include <malloc.h>

struct Node {
    int iValue;
    float fValue ;
    struct Node *next;
};

int main() {

    struct Node *head = (struct Node*) malloc(sizeof(struct Node));
    head->iValue = 5;
    head->fValue = 3.14;

	// Insert extra code here

  printf("%d\n", *head); //displays value of head
	printf("%p\n", &(head->iValue)); // displays address on my machine of head->iValue
  printf("%p\n", &(head ->fValue)); // displays address on my machine of head->fValue
  printf("%p\n", &(head ->next)); // displays address on my machine of head->next

	return 0;
}
