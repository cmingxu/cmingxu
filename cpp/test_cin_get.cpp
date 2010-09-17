#include<iostream>

using namespace std;

int main(){
    int a;

    while((a=cin.get()) != 10){
        cout << static_cast<char>(a) << "===" << a << endl;
    }
    return 0;

}
