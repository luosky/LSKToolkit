//
//  DateUtils.m
//  Eden
//
//  Created by luosky on 11/24/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import "DateUtils.h"


@implementation DateUtils

static NSDateFormatter *dateFormatter = nil;
static NSDateFormatter *simpleDateFormatter = nil;

+(NSDateFormatter*) formater
{
	if (dateFormatter == nil) {
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	}
	return dateFormatter;
}

+(NSDateFormatter*) simpleFormater
{
	if (simpleDateFormatter == nil) {
		simpleDateFormatter = [[NSDateFormatter alloc] init];
		[simpleDateFormatter setDateFormat:@"yyyy-MM-dd"];
	}
	return simpleDateFormatter;
}

+(NSString*) dateStringFromDate:(NSDate*) date{
    return [[self simpleFormater] stringFromDate:date];
}

+(NSString*) datetimeStringFromDate:(NSDate*) date{
    return [[self formater] stringFromDate:date];
}

+(NSDate*) dateFromString:(NSString*)str
{
	return [[self formater] dateFromString:str];
}

@end
