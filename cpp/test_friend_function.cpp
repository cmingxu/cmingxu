#include<iostream>
using namespace std;

class CRectangle{
    int width,height;

    public:
    void set_values(int,int);
    int area(){ return height * width;}
    friend CRectangle duplicate(CRectangle);
};

void CRectangle::set_values(int w,int h){
    width = w;
    height = h;
}


//friend function can access private fields
CRectangle duplicate(CRectangle rectparam){
    CRectangle rect;
    rect.width = rectparam.width;
    rect.height = rectparam.height;
    return(rect);
}

int main(){
    CRectangle recta,rectb;
    recta.set_values(2,3);
    rectb = duplicate(recta);

    cout << rectb.area();

    return 0;

}

