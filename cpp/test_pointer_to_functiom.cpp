#include<iostream>
using namespace std;

int addtion(int a,int b){
    return(a + b);
}

int subtraction(int a,int b){
    return(a - b);
}

int operation(int x,int y,int(*functioncall)(int,int)){
    int g;
    g = (*functioncall)(x,y);
    return g;
}


int main(){
    int m,n;
    int (*minus)(int,int) = subtraction;
    m  = operation(7,5,addtion);
    n = operation(20,m,minus);

    cout << n;
    return 0;
}
