#import <Foundation/Foundation.h>

@interface Complex : NSObject
{
    double real;
    double imaginary;
}

@property double  real,imaginary;
-(void) print;
-(void) setReal: (double) r andImaginary: (double) i;
-(Complex *) add: (Complex *) f;
@end


@implementation Complex
@synthesize real,imaginary;

-(void) print{
    NSLog(@"%d and %d",real,imaginary);
}


-(void) setReal: (double) r andImaginary: (double) d
{
    self.real - r;
    self.imaginary = d;
}

-(Complex *) add: (Complex *) f
{
    Complex *result = [[Complex alloc] init];
    [result setReal: real + [f real] andImaginary: imaginary + [f imaginary]];
   return result; 
}
@end


int main(int argc, const char* argv[]){
    Complex *a = [[Complex alloc] init];
    Complex *b = [[Complex alloc] init];
    [a setReal: 1 andImaginary: 2];
    [b setReal: 3 andImaginary: 4];
    Complex *c ;
    c = [a add: b];
    [c print];
    return 0;
}

