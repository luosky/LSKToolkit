//
//  DateUtils.h
//  Eden
//
//  Created by luosky on 11/24/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DateUtils : NSObject {

}

+(NSString*) dateStringFromDate:(NSDate*) date;
+(NSString*) datetimeStringFromDate:(NSDate*) date;

+(NSDate*) dateFromString:(NSString*)str;

@end
