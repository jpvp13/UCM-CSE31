#include <stdio.h>
//#include <malloc.h>
#include <stdlib.h>

void printArray(int**, int);

int main() {
	int i = 0, j = 0, n = 5;
	int **arr = (int**)malloc(n * sizeof(int*));

	// (3) Add your code to complete allocating and initializing the 2-D array here. The content should be all 0.


printf("TEST \n");
	for(i = 0; i < n; i++){
		*(arr+i) =(int*)malloc(n * sizeof(int*));
				//	arr[i][j]= (i*0)+(j*0);
				for(j = 0; j < n; j++){
					//*(arr+j) = 0;
					*(*(arr+i)+j) = 0;
		}
	}


    // This will print our your array
	printArray(arr, n);

    //(6) Add your code to make arr a diagonal matrix
		for(i = 0; i< n; i++){
			*(*(arr+i)+i) = i+1;

}
	// (7) All printArray to print array
    printArray(arr, n);

	return 0;
}

void printArray(int ** array, int size){
    // (5) Implement your printArr here:

		printf("array: \n");
int ** arr = array;
int n = size;

for(int i = 0; i < n; i++){ // each row iterates
	for(int j = 0; j < n; j++){ // each column
		printf("%d ", *(*(arr+i)+j));
		//printf("\n");

	}
printf("\n");

 }
 }
