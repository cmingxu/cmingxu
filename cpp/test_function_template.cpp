#include<iostream>

using namespace std;

template<class T>
T maximum(T val1,T val2,T val3){
    T max = val1;
    if(val2 > max){
        max = val2;
    }

    if(val3 > max){
        max = val3;
    }

    return max;
}


int main(){
    int i1,i2,i3;
    double d1,d2,d3;
    cin >> i1 >> i2 >> i3;
    cout << maximum(i1,i2,i3);


    cin >> d1 >> d2 >> d3;
    cout << maximum(d1,d2,d3);
    return 0;
}
