#import <Foundation/Foundation.h>

@interface ClassA : NSObject
{
    int x;
}
-(void) initVar;
@end


@implementation ClassA
-(void) initVar
{
    x = 100;
}
@end

@interface ClassB : ClassA
-(void) printVar;
@end

@implementation ClassB
-(void) printVar
{
    NSLog(@"x = %i",x);
}
@end


int main(int argc, const char * argv[]){

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    ClassB *b = [[ClassB alloc] init];
    [b initVar];
    [b printVar];

    [b release];
    [pool drain];
    return 0;
}




