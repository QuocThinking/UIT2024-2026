#include<stdio.h>
int main(){
   int x = 5;
   int *p, *a;
   p = &x;
   a=p;
   
   printf("%d,%d, %d",x, *p,*a);
	return 0;
}
