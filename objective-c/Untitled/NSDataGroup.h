//
//  NSDataGroup.h
//  Untitled
//
//  Created by cming on 3/18/11.
//  Copyright 2011 pinpoin.cn. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@protocol NSDataItem <NSObject>
-(id) cotents;
-(NSString *) typeName;
-(NSString *) title;

@optional
-(NSString *) author;

@end


@interface NSDataGroup : NSObject
{
	
}

@property (copy) NSString* name;
@property (retain, readonly) NSMutableArray *items;
@property (assign, readonly) int itemCount;


+(id) runningApllications;
-(void) addItem: (id <NSDataItem>) item;

@end


