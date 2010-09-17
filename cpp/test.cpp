#include <iostream>
#include <iomanip>

using namespace std;

void p(const char *str);
int fic(int i);
int main(){
    cout << "this is cpp" << endl;
    p("this is ooo");
    int c = fic(10);
    int d = fic(20);
    cout << c << endl;
    cout << d << endl;
    cout << "========================\n";
    double dou = 1.2222;
    double d1 = static_cast<double>(1/3.0);
    cout << dou << endl;
    cout << setw(14) << setfill('.') << setprecision(1) << d1 << endl;
    cout << setw(20) << setprecision(2) << setiosflags(ios::fixed | ios::showpoint) << 2.3333333 << endl; 
    return 0;
}

void p(const char *str){
    cout << str;
}


int fic(int i){
    if(i == 0){
        return 0;
    }

    else if(i == 1){
        return 1;
    }
    else{
        return fic(i-1) + fic(i-2);
    }


}
