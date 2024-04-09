int main() {
    int n, i = 1;
    while(i <=100){
        if(i % 5 != 0){
            continue;
        }
        printf("%d ", i);
    }
    return 0;
}