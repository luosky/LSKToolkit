//
//  NSHTTPCookie+Utils.m
//  aizheke_html
//
//  Created by Luosky on 11-6-22.
//  Copyright 2011年 Renjian.com. All rights reserved.
//

#import "NSHTTPCookie+Utils.h"


@implementation NSHTTPCookie (NSHTTPCookie_Utils)


+(NSHTTPCookie*)cookieWithKey:(NSString*)key value:(NSString*)value domain:(NSString*) domain{
    if(value==nil) value=@"";
    
    NSDictionary *cookieDictionary = [NSDictionary dictionaryWithObjectsAndKeys:key,NSHTTPCookieName,
                                      value,NSHTTPCookieValue,
                                      [[[domain stringByReplacingOccurrencesOfString:@"http://" withString:@""] componentsSeparatedByString:@":"] objectAtIndex:0],NSHTTPCookieDomain,
                                      @"/",NSHTTPCookiePath,
                                      [NSDate dateWithTimeIntervalSinceNow:60*60*24*365],NSHTTPCookieExpires,
                                      nil];
    return [NSHTTPCookie cookieWithProperties:cookieDictionary];
    
}


+ (NSHTTPCookie*)cookieWithKey:(NSString*)key forURLString:(NSString*)url
{
    for (NSHTTPCookie* cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:url]]) {
        if ([cookie.name isEqualToString:key]) {
            return cookie;
        }
    }
    return nil;
}

@end
