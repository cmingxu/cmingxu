#import <Foundation/Foundation.h>

@interface Fraction: NSObject
{
    int numerator;
    int denominator;
}

-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;

@end


@implementation Fraction
-(void) print
{
    NSLog(@"%i/%i",numerator,denominator);
}

-(void) setDenominator: (int) n
{
    numerator = n;
}

-(void) setNumerator: (int) d
{
    denominator = d;
}
@end




int main(int argc,const char *argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Fraction *fraction;
    fraction = [[Fraction alloc] init];

    [fraction setNumerator: 1];
    [fraction setDenominator: 2];

    NSLog(@"The value of myFration is:");
    [fraction print];
    [fraction release];

    [pool drain];
    return 0;

}
