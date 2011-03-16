#import <Foundation/Foundation.h>

int main(int argc,const char *argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int sum;
    sum = 1 + 2;
    NSLog(@"1 + 2 is %i",sum);

    [pool drain];
    return 0;    

}
