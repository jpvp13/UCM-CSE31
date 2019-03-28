
#include <stdio.h>
//#include <malloc.h>
#include <stdlib.h>

int** matMult(int **a, int **b, int size){
	// (4) Implement your matrix multiplication here. You will need to create a new matrix to store the product.

	int **matC = (int**)malloc(size * sizeof(int*)); //allocates dynamic memory for the product of array1 & array2
																										//also, rename "n" to size since they represent the same thing
	int i, j, k;


	for(i = 0; i < size; i++){

		*(matC+i) = (int*)malloc(size * sizeof(int));


		for(j = 0; j < size; j++){

			*(*(matC + i)+ j) = 0;


			for(k = 0; k < size; k++){

				*(*(matC + i)+ j) = *(*(a + i) + k) * (*(*(b + k) + j)); // this cross multiplies the two matrices
			}
		}
	}




return matC; // this will return the product of multipling array1 and array2
}

void printArray(int **arr, int n){
	// (2) Implement your printArray function here
	//printf("array: \n");
	int i, j = 0;
	int **matD = arr; // array double pointer gets on the values of arr
	//printf("TEST ARRAY\n");


for(i = 0; i < n; i++){ // each row iterates
	for(j = 0; j < n; j++){ // each column

	printf("%d ", *(*(matD+i)+j));
	//printf("\n");
	//printf("TEST");

				}
printf("\n");

		}

}

int main() {
	int n = 10;
	int **matA, **matB, **matC;
	// (1) Define 2 n x n arrays (matrices).

	int i, j;


	matA = (int**)malloc(n * sizeof(int*));
	matB = (int**)malloc(n * sizeof(int*));
	matC = (int**)malloc(n * sizeof(int*));


for(i = 0; i < n; i++){
	*(matA + i) = (int*)malloc(n * sizeof(int));
	for(j=0; j < n; j++){
		*(*(matA + i)+j) = 2;
	}
}


for(i = 0; i < n; i++){
	*(matB + i) = (int*)malloc(n * sizeof(int));
	for(j= 0; j < n; j++){
		*(*(matB + i)+j) = 6;
	}
}


for(i = 0; i < n; i++){
	*(matC + i) = (int*)malloc(n * sizeof(int));
	for(j= 0; j < n; j++){
		*(*(matC + i)+j) = 1;
	}
}



	// (3) Call printArray to print out the 2 arrays here.
	printf("Array 1: \n");
	printArray(matA, n);
	printf("Array 2: \n");
	printArray(matB, n);

	//(5) Call matMult to multiply the 2 arrays here.
	//matMult(matA, matC, n);
	matC = matMult(matA, matB, n);

	//(6) Call printArray to print out resulting array here.
	printf("Array 3: \n");
	printArray(matC, n);



    return 0;
}

//https://stackoverflow.com/questions/46993711/multiplying-matrices-in-c-using-pointers





// #include <stdlib.h>
// #include <stdio.h>
//
// int** matMult(int **a, int **b, int size){
// 	// (4) Implement your matrix multiplication here. You will need to create a new matrix to store the product.
//
// 	int **arr3 = (int**)malloc(size * sizeof(int*));
// 	int i, j, k;
//
// 	for(i = 0; i < size; i ++){
// 	*(arr3 + i) = (int*)malloc(size*sizeof(int));
// 		for(j = 0; j < size; j ++){
//
// 		*(*(arr3 + i)+j) = 0;
//
// 			for(k = 0; k < size; k++){
//
// 				*(*(arr3 + i)+j)= (*(*(a + i)+k)) * (*(*(b+ k) + j));
//
// 			}
// 		}
// 	}
// 	return arr3;
//
// }
//
// void printArray(int **arr, int n){
// 	// (2) Implement your printArray function here
// 	int **arr4 = arr;
//
// 	for( int i =0; i < n; i ++){ //each row
// 		for(int j = 0; j<n;j++){
// 			printf("%d ", *(*(arr + i)+j));
// 		}
// 	printf("\n");
// 	}
//
// }
//
// int main() {
// 	int n = 2;
// 	int **matA, **matB, **matC;
// 	// (1) Define 2 n x n arrays (matrices).
// 	int i, j, k;
// 	int sum;
//
// 	int **arr1 = (int**)malloc(n * sizeof(int*));
// 	int **arr2 = (int**)malloc(n * sizeof(int*));
// 	int **arr3 = (int**)malloc(n * sizeof(int*));
//
//
// 	for( i = 0; i < n; i ++){
// 		*(arr1 + i) = (int*)malloc(n*sizeof(int));
// 		for(j=0;j<n;j++){
// 			*(*(arr1 + i)+j) = 2;
// 		}
// 	}
//
//
// 	for( i = 0; i < n; i ++){
// 		*(arr2 + i) = (int*)malloc(n*sizeof(int));
// 		for(j=0;j<n;j++){
// 			*(*(arr2 + i)+j) = 1;
// 		}
// 	}
//
// 	for( i = 0; i < n; i ++){
// 		*(arr3 + i) = (int*)malloc(n*sizeof(int));
// 		for(j=0;j<n;j++){
// 			*(*(arr3 + i)+j) = 1;
// 		}
// 	}
//
//
//
// 	// (3) Call printArray to print out the 2 arrays here.
// 	printArray(arr1, n);
// 	printArray(arr2, n);
//
//
// 	//(5) Call matMult to multiply the 2 arrays here.
//
// 	 arr3 = matMult(arr1, arr2, n);
//
// 	//(6) Call printArray to print out resulting array here.
//
// 	printArray(arr3, n);
//
//
//
//     return 0;
// }
