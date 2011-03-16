#import <Foundation/Foundation.h>

@interface IdTest : NSObject
{
    int d,s;
}

-(void) print;
-(void) setD: (int) vard;
-(void) setS: (int) vars;
@end

@implementation IdTest
-(void) print
{
    NSLog(@"%i,%i",d,s);
}

-(void) setD: (int) vard
{
    d = vard;
}

-(void) setS: (int) vars
{
    s = vars;
}
@end


int main(int argc,const char* argv[]){
    id o = [[IdTest alloc] init];
    [o setS: 1];
    [o setD: 2];
    [o print];
    return 0;
}

