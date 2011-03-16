#import <Foundation/Foundation.h>

@interface Fraction: NSObject
{
   int numerator;
   int delimator; 
}

-(void) print;
-(void) setNumerator: (int) n;
-(void) setDelimator: (int) d;

-(int) numerator;
-(int) delimator;
@end

@implementation Fraction
-(void) setNumerator: (int) n
{
    numerator = n;
}

-(void) setDelimator: (int) d
{
    delimator = d;
}

-(int) numerator
{
    return numerator;
}

-(int) delimator
{
    return delimator;
}

-(void) print
{
    NSLog(@"%i/%i",numerator,delimator);
}
@end


int main(int argc,const char *argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    Fraction * f = [[Fraction alloc] init];
    [f setNumerator: 1];
    [f setDelimator: 2];

    [f print];


    [f release];

    [pool drain];
    return 0;

}
