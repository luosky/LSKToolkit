//
//  NSDictionaryExtend.m
//  Eden
//
//  Created by luosky on 11/24/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import "NSDictionary+Extend.h"


@implementation NSDictionary (extend)

-(NSString*)stringForKey:(id)key
{
	id obj = [(NSDictionary*)self objectForKey:key];
	if (![obj isKindOfClass:[NSString class]]) {
		return @"";
	}else {
		return (NSString*)obj;
	}
}



+(NSDictionary*)dictionaryWithParametersStr:(NSString*)parameters
{

	NSMutableDictionary* result = [NSMutableDictionary dictionary];
	NSArray* parameterArrs = [parameters componentsSeparatedByString:@"&"];
	for (NSString* pair in parameterArrs) {
		NSArray* pairArr = [pair componentsSeparatedByString:@"="];
		if ([pairArr count] > 1) {
			[result setValue:[pairArr objectAtIndex:1] forKey:[pairArr objectAtIndex:0]];
		}
	}
	return result;
}

-(NSString*)parametersString{
    NSMutableArray* arr = [NSMutableArray array];
    for (NSString* key in [self allKeys]) {
//        NSString* valueStr = [[self valueForKey:key] string];
        if ([self valueForKey:key]) {
            [arr addObject:[NSString stringWithFormat:@"%@=%@",key,[self valueForKey:key]]];
        }
    }
    return [arr componentsJoinedByString:@"&"];
}

@end
