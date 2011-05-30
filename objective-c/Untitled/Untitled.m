#import <Foundation/Foundation.h>
#import "LotteryEntry.h"

int main (int argc, const char * argv[]) {
    
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	NSMutableArray *colors = [[NSMutableArray alloc] init];
	
	[colors addObject:@"red"];
	[colors addObject:@"yellow"];
	
	NSLog(@"%@" ,colors);
	
	
	[colors removeAllObjects];
	NSLog(@"%@",colors);
	
	NSArray * number1 = [[NSArray alloc] initWithObjects:@"blue",@"green"];
	
	[colors addObjectsFromArray:number1];
	
	
	NSMutableIndexSet *set = [[NSMutableIndexSet alloc] init];
	[set addIndex:0];
	[set addIndex:1];
	
	NSLog(@"%@",[colors objectsAtIndexes:set]);
	
	NSLog(@"%@",colors);
	
	
    [pool drain];
    return 0;
}
