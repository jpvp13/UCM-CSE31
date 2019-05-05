#include <stdio.h>
//#include <malloc.h>
#include <stdlib.h>




int newBars(int initial,int n){
    int bars = initial/n;             //this will set the amount of bars that the user can afford to initial
    int totAmount;
    if(bars == 0){         //this will run a check to find out when the user is out of money/wrappers
      return 0;
    }
    else{
      printf("Then, you will get another %d bars!\n", bars);       //gives us the amount of bars the user gets per recursive call
      totAmount = bars + newBars(bars, n);                  //this adds the ammount of current bars plus adding it recursively to totAmount
      return totAmount;       //returns total number of bars via exchange of wrappers for candies to maxBars
    }
  }


  int maxBars(int n, int price, int totalMoney ){
    int initial = totalMoney/price;   //this will set the amount of bars that the user can afford to initial
    int max, totalAmount;
    // if(totalMoney > 0){
    //   newBars(totalBars, exchange);
    // }
  //printf("Your total bars is: %d\n", exchange);

  totalAmount = newBars(initial, n);    //this will recursively call newBars to find out how many additional bars the user can get
  max = initial + totalAmount;          //will add and set the total amount of bars to max


  return printf("With $%d, you will receive a maximum of %d BobCat bars.\n", totalMoney, max);
  }


int main(){
int price;
int n;
int totalMoney;
int totalBars;
int initial;

printf("Welcome to BobCat Candy, home to the famous BobCat Bars!\n");
printf("Please enter the price of a BobCat Bar:\n");
scanf("%d", &price);    //passes the number inputed into price

//printf("%d\n", price);

printf("Please enter the number of wrappers needed to exchange for a new bar:\n");
scanf("%d", &n);   //passes the number inputed into exchange

//printf("%d\n", exchange);


printf("How, how much do you have?\n");
scanf("%d", &totalMoney); //passes the number inputed into totalMoney


//printf("%d\n", totalMoney);



printf("Good! Let me run the number ...\n");

initial = totalMoney/price;     //lets the user know how many initial bars they can afford
printf("You first buy %d bars.\n", initial);
maxBars(n, price, totalMoney);   //n represents the exchange amount

return 0;


}
