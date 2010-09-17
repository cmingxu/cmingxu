#include<iostream>

const int size = 10;

using namespace std;

int main(){
    int n[size] = {0};

    for(int i=0; i<10; i++){
        cout << n[i] << "  " ;

    }


int p[size] = {1,3,4,5,6};

    for(int i=0; i<10; i++){
        cout << p[i] << "  " ;

    }




    for(int i=0; i<10; i++){
        n[i] = i*i;
    }

    cout << sizeof(n) << endl;
    cout << sizeof(int) << endl;

    for(int i=0; i<10; i++){
        cout << n[i] << "  " ;

    }
    cout << endl;
    return 0;
}
