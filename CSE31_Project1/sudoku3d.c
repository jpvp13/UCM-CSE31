/*
FINAL CODE BELOW
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _
*/

#include <stdio.h>
#include <stdlib.h>
//#include <stdbool.h>


// Declare printSudoku function
void printSudoku(int***);
// Declare solveSudoku function
int solveSudoku(int***);

//Helper functions. You can define any functions that can help your solve the problem



int checkCol (int *** blocks, int i, int j, int num){
	if(i%3 == 0){
        i=0;
    }
    else if ( i%3 == 1){
        i=1;
    }
    else{
        i=2;
    }


    for( i = i; i<9; i+=3){
        for( int k =0; k<3; k++){
            if(  *(*(*(blocks+ i)+k)+j)   == num  ){
                return 1;  //
            }
        }
    }

    return 0;
}

int checkRow (int *** blocks, int c, int k, int num){     // this will traverse along a row to check all its values
   if (c < 3){
      c = 0;
       for( int i = c; i<3; i++){
         for(int j =0; j<3; j++) {
             if(   *(*(*(blocks + i)+ k)+j)  == num  ){
                 return 1;
             }
         }
     }
 }
 else if(c >= 3 && c < 6){
   c = 3;
   for( int i = c; i < 6; i++){
     for(int j =0; j < 3; j++) {
         if(   *(*(*(blocks + i)+ k)+j)  == num  ){
             return 1;
         }
     }
 }
 }  else {
	if (c >= 6 && c < 9){
   c = 6;
   for( int i = c; i < 9; i++){
    for(int j =0; j < 3; j++) {
        if(  *(*(*(blocks + i)+ k)+j) == num  ){
            return 1;
		}
        }
    }
}
}
return 0;
}

int checkSquare(int *** blocks, int i, int num){      // will check to see if a square is "legal".
    for(int k = 0; k< 3; k++){             // meaning it will make sure a 3x3 grid was outputted
        for(int j = 0; j<3; j++){
            //if(  blocks[i][k][j] == num  ){
              if(*(*(*(blocks + i)+ k)+ j) == num){
                return 1;
            }
        }
    }
    return 0;
}

int StillZero(int*** blocks){   // returns true or false if the entire block in solved correctly
    int i =0, j=0, k =0, a=0;
    for(i=0; i<9; i++){     // checks which position we are in
        for(j=0; j<3; j++){  // checks which row we are once
            for(k=0; k<3; k++){ // checks which column we are on
                a = *(*(*(blocks+i)+j)+k);
                if(a == 0){
                    return 0;
                }
            }
        }
    }
    return 1;
}

int legal(int ***blocks, int i, int k, int j, int num){
    if(!checkCol(blocks, i, j, num) && !checkRow(blocks, i, k,num) && !checkSquare(blocks, i, num)   ){
        return 1;
    }
    else{
       return 0;
   }
}

// The main program reads a text file containing the block values of the Sudoku grid.
// It then saves each 3x3 block into a 2D array. The Sudoku grid is composed of 9 3x3 blocks.
// DO NOT MODIFY THE MAIN FUNTION!!!
// */
int main(int argc, char **argv) {
	if (argc != 2) {
		fprintf(stderr, "Usage: %s <file name>\n", argv[0]);
		return 2;
	}
    int i, j;
    FILE *fptr;
    int ***blocks = (int***)malloc(9 * sizeof(int**));

    // Open file for reading
    fptr = fopen(argv[1], "r");
    if (fptr == NULL) {
        printf("Cannot Open File!\n");
        return 0;
    }

	// Read 9x9 blocks into 2D arrays
    for(i=0; i<9; i++)
    {
        *(blocks+i) = (int**)malloc(3 * sizeof(int*));
        printf("Reading numbers in block %d... \n", i+1);
        for(j=0; j<3; j++)
        {
            *(*(blocks+i)+j) = (int*)malloc(3 * sizeof(int));

                fscanf(fptr, "%d %d %d", *(*(blocks+i)+j), *(*(blocks+i)+j)+1, *(*(blocks+i)+j)+2);
                printf("%d %d %d\n", *(*(*(blocks+i)+j)), *(*(*(blocks+i)+j)+1), *(*(*(blocks+i)+j)+2));
        }
    }

	// Print out original Sudoku grid
    printf("Printing Sudoku before being solved:\n");
    printSudoku(blocks);

	// Call solveSudoku and print out result
    printf("\nSolving Sudoku...\n\n");
    if(solveSudoku(blocks)){
        printf("Sudoku solved!\n");
        printSudoku(blocks);
    }
    else
        printf("This Sudoku cannot be solved!\n");

    return 0;
}


void printSudoku(int*** arr){
	// This function will print out the complete Sudoku grid (arr). It must produce the output in the SAME format as the samples in the instructions.

	// Your implementation here
	int row, col, block = 0;

	for (row = 0; row < 3; row++){ 							//this segment will print out the first row of 3x3 gride
					for (col = 0; col < 3; col++){
							for (block = 0; block < 3; block++){

									printf("%d ", *(*(*(arr + col) + row) + block));
									if(block == 2){
									printf("|");
									//printf("TEST: 1");
								}
							}
					}

					printf("\n");
			}
				printf("_ _ _ _ _ _ _ _ _ _ _ _");		//will print the dotted line to seperate the rows
					printf("\n\n");			 //double tab to even out spacing

			for (row = 0; row < 3; row++){									//this segment will print out the second row of 3x3 grid
					for (col = 3; col < 6; col++){
							for (block = 0; block < 3; block++){
									printf("%d ", *(*(*(arr + col) + row) + block));
									if(block == 2){
											printf("|");
									}
									//printf("TEST: 2 ");
							}
					}
					printf("\n");
			}
			printf("_ _ _ _ _ _ _ _ _ _ _ _"); //will print the dotted line to seperate the rows
				printf("\n\n");  //double tab to even out spacing

			for (row = 0; row < 3; row++){										//this segment will print out the thrid row of 3x3 grid
					for (col = 6; col < 9; col++){
							for (block = 0; block < 3; block++){
									printf("%d ", *(*(*(arr + col) + row) + block));
									if(block == 2){
										printf("|");
									}
									//printf("TEST: 3 ");
							}
					}
					printf("\n");
			}
	}






int solveSudoku(int*** blocks){
	// This is the function to solve the Sudoku (blocks). Feel free to use any helper functions.
	// YOU MUST NOT USE ANY ARRAY NOTATION ([])!

	//Your implementation here
  //int num, i, j, k = 0;


    if(StillZero(blocks)){
        //printf("Test:6 ");
      return 1;
    }
      for(int i = 0; i < 9; i++){     //index for all values from 0-8
        for(int j = 0; j < 3; j++){   //index for each row in a 3x3 grid
          for(int k = 0; k < 3; k++){ // index for each column in a 3x3 grid
            if(*(*(*(blocks + i)+ j)+ k) == 0){   //0 in this case means the value has not been updated

                  for(int num = 1; num <= 9; num++){

                    if(legal(blocks, i, j, k, num)){

                      *(*(*(blocks + i)+ j)+ k) = num; // checking values 1-9
                      if(solveSudoku(blocks)){
                        return 1;
                      }
                    }
                  }
                  *(*(*(blocks + i)+ j)+ k) = 0;  //reset value to 0, so it can check against other values
                  return 0;
            }
          }
        }
      }
      return 1;
    }


/*
    	NOTE: these where previous ideas/ attempts to replicate the expected output. all created/thought up by John Villalvazo with reference to pseudocodes from google in varying coding languages
    	see references at the bottom of the code



        // while (num < 9) {
        // 	for(i = 0; i < 3; i++){
        // 		for(j = 0; j < 3; j++){
        //
        //
        // 		if(*(*(*(blocks + i)+ j)+ k) == 0){
        // 			return 1;
        // 		}
        // 		num++;
        // 	}


      // int checkArgu(int ***blocks, int i, int num){ //this will checked each 3x3 square for conflicts
      //     //1 means conflic and 0 means no conflict
      // 	for(int k = 0; k < 3; k++){
      // 		for(int j = 0; j < 3; j++){
      // 					if(*(*(*(blocks + i)+ k)+ j) == num){
      // 						return 1;
      // 					}
      // 		    }
      // 	    }
      // 	return 0;
      // }




      int checkgrid(int ***blocks, int row, int col){
      	int i, j;
      		row = (row / 3 )* 3;
      		col = (col / 3)* 3;

      		for(i =0; i < 3; i++){
      			for(j = 0; j < 3; j++){
      				if(*(*(*(arr + (*(*(*(blocks + i)))) == grid)){
      					return 0;
      				}
      			}
      			return 1;
      		}

      }



      void Move(int row, int col){

      if(col < 8){
      	solveSudoku(row, col + 1);
      } else {
      	solveSudoku(row + 1, 0);
      }




      void findunAssigned(int ***arr, int row, int col) { // will check

      for(row = 0; row < 9; row++){
      	for(col = 0; col < 9; col++){
      		if(*(*(*(arr + row)+ col)) == 0){
      			return 1;
      		}
      	}
      }
      return 0;
      }

      int checkIfFull(){


      	return 1;

      }



    	int num = sizeof(arr);
    for()
    	for(block = 0; block < 9; block++){ // this will serve as the column
    		if(block < 3){
    		printf("%d |\n", *(*(*(arr+block))));

    	//	printf("TEST:1 \n");
    	}
    		for(j = 0; j < 9; j++){
    				if(j < 3){ //j is the columnm, so it checks if this position is present then it prints a " | " to match expected output

    				printf("%d |\n", *(*(*(arr+j))));

    				printf("TEST:1\n");

    			if (j == 8) {// if position j equals 8 then this means that its at the end of the expect print output, so it tabs down 1 line while still printing last value
    				printf("%d\n", *(*(*(arr+block)+j)));
    				printf("TEST:2\n");
    			} else { // if no other condition is reached, then this line will just print values inbetween to match expected output
    				printf("%d", *(*(*(arr+block)+j)));
    				printf("TEST:2\n");
    			}
    		}
    	}
    }


    	printf("%d\n", num);  // *TEST*  Printing out the value of arr




    			for(block=0; block < 3; block++){ // responsable for entire row
    	        for(j=0; j < 9; j++){ // responsable for determining where the "|" goes
    					for(k = 0; k < 3;k++ ){ // responsable for printing the values that don't have any special
    					if(j)
    						if(j > 0 && j == 3 ){
    							//printf("\n");
    					 printf("%d|", *(*(*(arr+(block))+j)+k));
    				 } else if(j > 3 && j == 6){
    					 printf("%d|", *(*(*(arr+(block))+j)+k));
    				 }
    				  // if(block <= 6){
    					//  printf("%d\n", *(*(*(arr+(block+k))+j)+k));
    					//  printf("_ _ _ _ _ _ _ _ _ _ _ _ _");
    				 // }
    				 // else {
    					//  printf("%d", *(*(*(arr+block)+j)+k));
    				 // }
    	    }
  		}
    }

   else {
      while (i < 9) {
        for(j = 0; j < 3; j++){
          for( = 0; k < 3; k++){

            if(checkRow(checkCol(blocks, num, i, k) == 0 && checkRow(blocks, num, i, j) == 0 && squareArg(blocks, num, i) == 0){
              *(*(*(blocks+i)+j)+k) = num;
                  if(solveSudoku(blocks) == 0){
          }
        }
        i++;
      }
      }
    }



		Move(row,col);
} else {
		for(grid = 1; grid <= 9; grid++){


				*(*(*(blocks + row)+ col)) = grid;
				Move(row, col);
			}
		}
		*(*(*(blocks + row)+ col)) = 0;
	}
	return 0;
}

for(number = 1; number < 10; number++){
		if(SafeNumber(arr, row, col)){
			*(*(*(arr + row)+ col)) == number;

			if(solve(arr)){
				return ;
			}
			*(*(*(arr + row)+ col)) = UNASSIGNED;
		}

}
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

Reference Section (used for guidance/understadning/brain-farts/problem-resolving)
https://softwareengineering.stackexchange.com/questions/80167/how-do-i-safely-write-code-in-my-own-words-and-not-plagiarize
https://medium.com/@george.seif94/solving-sudoku-using-a-simple-search-algorithm-3ac44857fee8
https://stackoverflow.com/questions/21198303/backtracking-sudoku-solver-in-c



*/
