//
//  LotteryEntry.h
//  Untitled
//
//  Created by cming on 3/16/11.
//  Copyright 2011 pinpoin.cn. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface LotteryEntry : NSObject {
	NSCalendarDate *entryDate;
	int firstNumber;
	int secondNumber;

}
-(void) prepareRandomNumbers;
-(void) setEntryDate:(NSCalendarDate *)date;
-(NSCalendarDate *)entryDate;
-(int) firstNumber;
-(int) secondNumber;
-(NSString *) description;
@end
