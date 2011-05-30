//
//  LotteryEntry.m
//  Untitled
//
//  Created by cming on 3/16/11.
//  Copyright 2011 pinpoin.cn. All rights reserved.
//

#import "LotteryEntry.h"


//
//  LotteryEntry.h
//  Untitled
//
//  Created by cming on 3/16/11.
//  Copyright 2011 pinpoin.cn. All rights reserved.
//

#import "LotteryEntry.h"

@implementation LotteryEntry 

-(void) prepareRandomNumbers{
	firstNumber = random() % 100 + 1;
	secondNumber = random() % 100 + 1;
}
-(void)setEntryDate:(NSCalendarDate *)date{
	entryDate = date;
}
-(NSCalendarDate *)entryDate{
	return entryDate;
}
-(int) firstNumber{
	return firstNumber;
}
-(int) secondNumber{
	return secondNumber;
}

-(NSString *) description{
	return [[NSString alloc] initWithFormat:@"%d %d %@",[self firstNumber],[self secondNumber],[self entryDate]];
}


@end
