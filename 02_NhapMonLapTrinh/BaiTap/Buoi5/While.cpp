#include<stdio.h>

int main() {
    int n;
     int i = 1;
    while(i <=100){
        if(i % 5 != 0){
            continue;
            i++
        }
        printf("%d ", i);
    }
    return 0;
}