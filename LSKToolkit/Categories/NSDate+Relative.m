//
//  NSDate+Relative.m
//  aizheke
//
//  Created by Luosky on 12-7-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSDate+Relative.h"

@implementation NSDate (Relative)


-(NSString*) timeIntervalFromNowInChinese
{
	NSDate* now = [NSDate date];
	int distance = [now timeIntervalSinceDate:self];
	NSString* timestamp;
	
	if (distance < 0) distance = 0;
    
    if (distance < 60) {
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"秒前"];
    }
    else if (distance < 60 * 60) {
        distance = distance / 60;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"分钟前"];
    }
    else if (distance < 60 * 60 * 24) {
        distance = distance / 60 / 60;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"小时前"];
    }
    else if (distance < 60 * 60 * 24 * 7) {
        distance = distance / 60 / 60 / 24;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"天前"];
    }
    else if (distance < 60 * 60 * 24 * 7 * 5) {
        distance = distance / 60 / 60 / 24 / 7;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"周前"];
    }
    else if (distance < 60 * 60 * 24 * 365) {
        distance = distance / 60 / 60 / 24 / 30;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"月前"];
    }
    else {
        distance = distance / 60 / 60 / 24 / 365;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"年前"];
    }
	return timestamp;
}


-(NSString*) futureTimeIntervalFromNowInChinese
{
	NSDate* now = [NSDate date];
	int distance = [self timeIntervalSinceDate:now];
	NSString* timestamp;
	
	if (distance < 0) distance = 0;
    
    if (distance < 60) {
        timestamp = [NSString stringWithFormat:@"还有%d%@", distance, @"秒"];
    }
    else if (distance < 60 * 60) {
        distance = distance / 60;
        timestamp = [NSString stringWithFormat:@"还有%d%@", distance, @"分钟"];
    }
    else if (distance < 60 * 60 * 24) {
        distance = distance / 60 / 60;
        timestamp = [NSString stringWithFormat:@"还有%d%@", distance, @"小时"];
    }
    else {
        distance = distance / 60 / 60 / 24;
        timestamp = [NSString stringWithFormat:@"还有%d%@", distance, @"天"];
    }
	return timestamp;
}


-(NSString*) timeDistanceFromNowInChinese
{
	NSDate* now = [NSDate date];
	int distance = [now timeIntervalSinceDate:self];
	NSString* timestamp;
	
	if (distance < 0) distance = -distance;
    
    if (distance < 60) {
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"秒"];
    }
    else if (distance < 60 * 60) {
        distance = distance / 60;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"分钟"];
    }
    else if (distance < 60 * 60 * 24) {
        distance = distance / 60 / 60;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"小时"];
    }
    else if (distance < 60 * 60 * 24 * 7) {
        distance = distance / 60 / 60 / 24;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"天"];
    }
    else if (distance < 60 * 60 * 24 * 7 * 5) {
        distance = distance / 60 / 60 / 24 / 7;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"周"];
    }
    else if (distance < 60 * 60 * 24 * 365) {
        distance = distance / 60 / 60 / 24 / 30;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"月"];
    }
    else {
        distance = distance / 60 / 60 / 24 / 365;
        timestamp = [NSString stringWithFormat:@"%d%@", distance, @"年"];
    }
	return timestamp;
}

@end
