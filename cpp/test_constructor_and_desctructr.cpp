#include<iostream>

using namespace std;

class CRectangle{
    int *width,*height;
    public:
    CRectangle(int,int);
    ~CRectangle();
    int area(){
        return(*width * *height);
    }

};


CRectangle::CRectangle(int w,int h){
    width = new int;
    height = new int;
    *height = h;
    *width  = w;
}

CRectangle::~CRectangle(){
    delete width;
    delete height;
}

int main(){
    CRectangle rect(1,4),recta(2,5);
    cout << "Rect Area" << rect.area() << endl;
    cout << "Rect Area" << recta.area() << endl;
    return 0;
}
