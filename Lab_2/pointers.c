

int main(){

int x, y, *px, *py;


int arr[10];
int i = 0;

px = x;
py = y;

printf("Value of x: \n");
printf("%d\n", x);
printf("%p\n", &x);
printf("Value of y: \n");
printf("%d\n", y);
printf("%p\n", &px );
printf("%p\n", &py );

for (sizeof i; i < sizeof(arr); i++) {
  printf("%d\n", &arr );
}

return 0;


}
