#import <Foundation/Foundation.h>

@interface Fraction: NSObject
{
    int numerator;
    int denominator;
}

@property int numerator, denominator;

-(void) print;
-(void) setTo: (int) n over: (int) d;
-(double) convertToNum; 
@end

@implementation Fraction

@synthesize numerator,denominator;

-(void) print
{
    NSLog(@"%i/%i", numerator,denominator);
}

-(double) convertToNum
{
    if(denominator != 0)
        return (double) numerator / denominator;
    else
        return 1.0;
}

-(void) setTo: (int) n over: (int) d
{
    numerator = n;
    denominator = d;
}

@end


int main(int argc,const char* argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Fraction *f = [[Fraction alloc] init];
    [f setTo: 1 over: 2];
    [f print];
    [f release];
    [pool drain];
}
