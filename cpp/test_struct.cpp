#include<iostream>
#include<string>
#include "struct.h"

using namespace std;


void p(struct Time &t){

        cout << t.hour << endl;
        cout << t.minute << endl;
        cout << t.pm_am << endl;

        t.hour = 1;


}
int main()
{
        Time t;
        t.hour = 10;
        t.minute = 10;
        strcpy(t.pm_am,"am");

        p(t);
        p(t);
        return 0;

}



