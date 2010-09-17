#include<iostream>

using namespace std;

int main(){
    int aInt;
    double aDouble;


    cout << "Enter an int:\n" ;
    cin >> aInt;


    cout << "The int you just entered is :" << aInt << endl;

    cout << "Enter an double: \n";
    cin >> aDouble;

    cout << "The double value u just entered is : " << aDouble << endl;

    cout << static_cast<float>(aDouble) << static_cast<float>(aInt) << endl;

    int aChar;
    aChar = cin.get();
    cout << aChar << endl;
    return 0;
}
