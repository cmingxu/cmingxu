#include<iostream>
#include<string>

using namespace std;


class Time{
    private:
    int hour;
    int minute;
    char am[3];

    public:
    Time();
    void setTime(int,int,const char*);
    void print();
};

Time::Time(){
    hour = minute = 0;
    strcpy(am,"am");
}

void Time::setTime(int h,int m,const char* a){
    hour = h;
    minute = m;
    strcpy(am,a);
}

void Time::print(){
    cout << hour << endl;
    cout << minute << endl;
    cout << am << endl;
}

int main(){
    Time time;
    time.setTime(10,10,"pm");
    time.print();
    return 0;
}
