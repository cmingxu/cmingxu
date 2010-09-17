#include<iostream>

using namespace std;

void p_array(int arr[],int length){
   for(int i=0; i<length; i++){
    cout << arr[i] << "  " << endl;
    arr[i] = -arr[i];
   } 
}

int main(){
    int arr[] = {1,3,4,5,6};
    p_array(arr,5);
    p_array(arr,5);
    return 0;
}
