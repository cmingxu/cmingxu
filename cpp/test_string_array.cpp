#include<iostream>
#include<string>

using namespace std;

int main(){
    char str[10] = "sssssss";
    char str1[] = "aaaa";

    cout << str << endl;
    cout << str1 << endl;
    cout << strlen(str1) << endl;
    cout << strcmp(str1,"aaaa") << endl;
    cout << strcpy(str1,str) << endl;
    cout << str << str1 << endl;

    for(int i=0; i<10; i++){
        cout << str[i] << endl;
    }
    cout << endl;
    return 0;
}
