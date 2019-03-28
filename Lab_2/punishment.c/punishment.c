#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {
  int PunNum = 0;
  int typo = 0;




  printf("Enter the number of lines for the punishment: ");
  scanf("%d", &PunNum);
  //printf("number = %d" ,number); // this way to print out the given value

  if (PunNum <= 0) {
    printf("You entered an incorrect value for the number of lines!\n");
    exit(0); //need to include its own library, but exits the program completely once ran
  }


  printf("Enter the line for which we want a typo:");
  scanf("%d", &typo);


  if(typo < 0){
    printf("You entered an incorrect value for the line typo!\n");
    exit(0);

  }

for (size_t i = 1; i < PunNum + 1; i++) {
  if(typo == i){
      printf("C Programming language is the bet!\n");

    } else {
      printf("C Programming language is the best!\n");
}
}










  return 0;
}
