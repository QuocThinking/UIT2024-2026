#include<stdio.h>

int main() {
    int n;
    int i = 2;
    int prime = 0;
    printf("Nhap vao so nguyen to : ");
    scanf("%d", &n);
    while (n > i)
    {
        if(n % i == 0){
            prime++;
        }
        i++;
    }
    if(prime == 0){
        printf("\n This number is Prime ");
    }else {
        printf("\n This number is Not Prime");
    }
    return 0;
}