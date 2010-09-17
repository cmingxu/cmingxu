#include <iostream>

using namespace std;
int add(int &ref);

int main(){
    int x = 1;
    add(x);
    cout << x << endl;
    add(x);
    cout << x << endl;
    return 0;
}

int add(int &ref){
    ref += 1;
    return ref;
}
