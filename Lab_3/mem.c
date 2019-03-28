
#include <stdio.h>
#include <stdlib.h>
//#include <malloc.h>

 int main() {
	int num;
	int *ptr; // int
	int **handle; // int8

	num = 14;
	ptr = (int *)malloc(2 * sizeof(int));
	*ptr = num; // *(ptr + 1) = 5
	handle = (int **)malloc(1 * sizeof(int *));
	*handle = ptr;

	 //**handle = 5; // *mem2 = 5


	// Insert extra code here
	 printf("%p\n", ptr);
   printf("%p\n", handle);
   printf("%p\n", &num);

	return 0;
}
