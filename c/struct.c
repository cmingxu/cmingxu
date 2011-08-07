#include<stdio.h>
#include "struct.h"

#define N 10;

int main(int argc, const char *argv[]){
    int i = 0;
    for(i; i<N; i++){
        no_exist[i].x = 10.0;
        no_exist[i].y = 10.0; 
    }

    for(i=0; i<N; i++){
        printf("%d x = %f, y = %f\n",i, no_exist[i].x, no_exist[i].y);
    }
    return 0;
}
