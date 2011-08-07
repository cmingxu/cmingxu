#include<stdio.h>

int main(){
    int a = 1, b = 0;

    printf("1 & 0 =  %10d\n", 1 & 0);
    printf("1 ^ 0 =  %10d\n", 1 & 0);
    printf("2 | 3 =  %10d\n", 2 | 3);
    printf("1 | 0 =  %10d\n", 1 | 0);
    printf("1 << 1 =  %10d\n", 1 << 1);
    printf("1 << 12 =  %10d\n", 1 << 12);
    printf("1 >> 1 =  %10d\n", 1 >> 1);
    printf("1 >> 2 =  %10d\n", 1 >> 2);
    printf("1 >> 12 =  %10d\n", 1 >> 12);
    printf("1 >> 31 =  %10d\n", 1 >> 31);

    return 0;
}
