//
//  NSURLRequest+Parameters.m
//  aizheke
//
//  Created by Luosky on 12-4-24.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "NSURLRequest+Parameters.h"
#import "NSDictionary+Extend.h"

@implementation NSURLRequest (Parameters)

- (NSDictionary*)parameterDictionary
{
    
	NSMutableDictionary* result = [NSMutableDictionary dictionary];
    if ([self.HTTPMethod isEqualToString:@"POST"]) {
        NSString *parametersStr = [[NSString alloc] initWithData:[self HTTPBody] encoding:NSASCIIStringEncoding];
        result = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithParametersStr:parametersStr]] ;

    }else {
        NSString* queryStr = [self.URL query];
        NSArray* parameterArrs = [queryStr componentsSeparatedByString:@"&"];
        for (NSString* pair in parameterArrs) {
            NSArray* pairArr = [pair componentsSeparatedByString:@"="];
            if ([pairArr count] > 1) {
                [result setValue:[pairArr objectAtIndex:1] forKey:[pairArr objectAtIndex:0]];
            }
        }
    }
	return result;
}

@end
