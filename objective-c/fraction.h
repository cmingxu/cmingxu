#import <Foundation/Foundation.h>

@interface Fraction: NSObject
{
    unsigned int numerator;
    unsigned int denominator;
}

-(void) print;
-(void) setNumerator: (int) n;
-(void) setDenominator: (int) d;
-(int) getNumerator;
-(int) getDenominator;
-(double) convertToNum;
-(Fraction *) add: (Fraction *) b;
@end
