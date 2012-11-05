//
//  EGOImageURLSafeButton.m
//  aizheke
//
//  Created by Luosky on 12-4-23.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "EGOImageURLSafeButton.h"

@implementation EGOImageURLSafeButton
- (void)fetchImageAtUrlStr:(NSString*)urlStr{
    if (urlStr&&[urlStr isKindOfClass:[NSString class]] && urlStr.length > 0) {
        [self setImageURL:[NSURL URLWithString:urlStr]];
    }
}

- (void)setImageURLStr:(NSString*)urlStr {
    if (urlStr&&[urlStr isKindOfClass:[NSString class]] && urlStr.length > 0) {
        [self setImageURL:[NSURL URLWithString:urlStr]];
    }
}

@end
