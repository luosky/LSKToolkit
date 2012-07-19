//
//  NSDictionaryExtend.h
//  Eden
//
//  Created by luosky on 11/24/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (extend)
-(NSString*)stringForKey:(id)key;
+(NSDictionary*)dictionaryWithParametersStr:(NSString*)parameters;
-(NSString*)parametersString;
@end
