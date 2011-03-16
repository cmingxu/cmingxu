#import <Foundation/Foundation.h>

@interface Rectangle : NSObject
{
    int width,height;
}

@property int width,height;

-(int) area;
-(int) perimter;
-(void) setWidth: (int) w andHeight: (int) h;
@end

@implementation Rectangle

@synthesize width,height;

-(int) area
{
    return height * width;
}

-(int) perimter
{
    return (height * width) * 2;
}

-(void) setWidth: (int) w andHeight: (int) h
{
    height = h;
    width = w;
}
@end



int main(int argc, const char * argv[]){
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Rectangle * r = [[Rectangle alloc] init];
    [r setWidth: 1 andHeight: 2];
    NSLog(@"width %i and height %i", [r width],[r height]);
    NSLog(@"area %i and perimter %i",[r area],[r perimter]);
    [r release];
    [pool drain];
    return 0;
}
