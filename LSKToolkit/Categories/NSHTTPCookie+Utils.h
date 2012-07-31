//
//  NSHTTPCookie+Utils.h
//  aizheke_html
//
//  Created by Luosky on 11-6-22.
//  Copyright 2011年 Renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSHTTPCookie (NSHTTPCookie_Utils)
//domain : i.aizheke.com
+(NSHTTPCookie*)cookieWithKey:(NSString*)key value:(NSString*)value domain:(NSString*) domain;
+ (NSHTTPCookie*)cookieWithKey:(NSString*)key forURLString:(NSString*)url;
@end
