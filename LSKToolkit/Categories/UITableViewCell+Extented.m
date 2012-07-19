//
//  UITableViewCell+Extented.m
//  aizheke
//
//  Created by Luosky on 12-5-10.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "UITableViewCell+Extented.h"

@implementation UITableViewCell (Extented)

- (float)leftMargin
{
    return self.contentView.frame.origin.x;
}

- (float)rightMargin
{
    CGRect frame = self.contentView.frame;
    float containerWidth = frame.size.width;
    float margin = self.frame.size.width - (containerWidth + frame.origin.x);
    return margin;
}

- (float)cellMargins
{
    return ([self leftMargin] + [self rightMargin]);
}

@end