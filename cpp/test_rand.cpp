#include<iostream>
#include<stdlib.h>

const int NUM = 5;
const int TOTAL =  100;


using namespace std;

int main(){
    int occounce[] = new int[5];
    
    for(int i=0; i < TOTAL ; i++){
        occounce[rand() % NUM] ++;
    }
}
