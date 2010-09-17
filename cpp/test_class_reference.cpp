#include<iostream>
#include<string>

using namespace std;

class Count{
    public:
        int x;
        void print(){ cout << x << endl;}
};

int main(){
    Count count,
          *countPtr = &count,
          &countRef = count;

    count.x = 1;
    count.print();

    countRef.x = 2;
    count.print();

    countPtr->x  = 3;
    countPtr->print();

    return 0;
}
