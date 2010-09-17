#include<iostream>
using namespace std;

class CPolygon{
    protected:
        int width,height;
    public:
        void set_values(int a,int b){width = a;height =b;}
};

class COutput{
    public:
        void output(int i);
};
    

