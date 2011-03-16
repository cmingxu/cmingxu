
-(Fraction *) initWith: (int) a and: (int) b
{

    self = [ super init];
    if(self)
        {
            [self setReal: a andImaginary: b];
        }

        return self;
}


@interface Fraction (Math)
-(Fraction *) add: (Fraction*) anotherFraction;
-(Fraction *) remove: (Fraction*) anotherFraction;
@end

@implementation Fraction (Math)
@end
