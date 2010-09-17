#include<iostream>
#include<new>

using namespace std;

int main(){
    int i,n;
    int *p;
    cout << "How many numbers would you like to type?";
    cin >> i;

    p = new (nothrow) int[i];
    if(p == 0){
        cout << "Error happen" << endl;
    }
    else
    {
        cout << "Alloc right" << endl;
        delete [] p;
    }

    return 0;
}
