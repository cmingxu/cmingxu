#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];


	NSNumber *one = [[NSNumber alloc] initWithInt:1];
	NSNumber *two = [[NSNumber alloc] initWithInt:2];
	
	[one release];
	[two release];
 	
	NSMutableArray *numbers = [[NSMutableArray alloc] initWithObjects:one,two,nil];
	
	printf("%d",[[numbers objectAtIndex:0] intValue] + [[numbers objectAtIndex:1] intValue]);
	
	NSArray *colors = [[NSArray alloc] initWithObjects:@"red",@"green",nil];
	
	NSMutableArray *m_array = [[NSMutableArray alloc] initWithCapacity:2];
	[m_array addObject:@"ddd"];
	[m_array addObject:@"ddd"];
	[m_array addObject:@"dds"];
	
	
	

	NSString *dotSepareateString = [[NSString alloc] initWithString:@"this.is.stirng.seperate.by.dot"];
	NSArray *string_array = [[NSArray alloc] initWithArray:[dotSepareateString componentsSeparatedByString:@"."]];
	
	for(NSString *word in string_array){
		NSLog(@"%s",word);
	}
	
	
	for(NSString *color in colors){
		printf("%s",[color UTF8String]);
	}
	
	
	// nsfilemanage
    [pool drain];
    return 0;
}
