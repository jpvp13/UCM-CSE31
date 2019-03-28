#include <stdio.h>
#include <stdlib.h>


int main(int argc, char const *argv[]) {
  int enteredNum, neg_Sum, neg_Pos, pos_Sum, neg_Tot, pos_Tot = 0;





printf("Please enter an integer:");

while(scanf("%d",&enteredNum ) == 1 &&  enteredNum != 0){ // reference to this line was from GitHub user DaoistDuck for the need to have the inputted number to be checked if true. Check reference 2)
  printf("Please enter an integer:");

  if (enteredNum < 1) { // checks the entered number to see if that number should be added to the positive or negative variable
    neg_Sum = neg_Sum + enteredNum;
    neg_Tot++; // keeps a running total of number of postive numbers have be inputted. Not their total amount, but how many physical pos numbers were inputted
  } else {

    pos_Sum = pos_Sum + enteredNum;
    pos_Tot++; // keeps a running total of number of negative numbers have be inputted. Not their total amount, but how many physical neg numbers were inputted
}
}
//  printf("test");




//Need a algo that takes neg and pos numbers for avg " divide by 2"


printf("Positive average: %d\n", pos_Tot == 0 ? 0 : pos_Sum/pos_Tot); // the / is a condition check statment that means "If then", can be referenced to link 1)
printf("Negative average: %d\n", neg_Tot == 0 ? 0 : neg_Sum/neg_Tot);





  return 0;
}
//Was used in user DaoistDuck GitHub reference code, used as well to understand why the comparisons are true
// 1) https://stackoverflow.com/questions/21706345/what-does-mean-in-java-001
// 2) https://github.com/DaoistDuck/UCM_CSE_31/blob/master/Lab1/averages.c
// 3) https://stackoverflow.com/questions/44116502/c-programming-conversion-of-type-condition-to-simple-if-else
// 4) https://stackoverflow.com/questions/26094119/create-a-c-program-that-sums-up-the-positive-and-negative-numbers-without-arrays
