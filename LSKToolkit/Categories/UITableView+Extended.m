//
//  UITableView+Extended.m
//  aizheke
//
//  Created by Luosky on 12-5-10.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "UITableView+Extended.h"

@implementation UITableView (Extended)
- (void)roundedBackgroundAtRadius:(int)radius forCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath {
    [self roundedBackgroundWithImageFilePrefix:@"rounded_cell_bg" atRadius:radius forCell:cell atIndexPath:indexPath];
}

- (void)roundedBackgroundWithImageFilePrefix:(NSString*)prefix atRadius:(int)radius forCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath {
    if ([self numberOfRowsInSection:indexPath.section] ==1){//四圆角
        cell.backgroundView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@_single.png",prefix]] stretchableImageWithLeftCapWidth:radius topCapHeight:radius] ];
    }else if (indexPath.row == 0) {//上圆角
        cell.backgroundView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@_top.png",prefix]] stretchableImageWithLeftCapWidth:radius topCapHeight:radius] ];
    }else if (indexPath.row == [self numberOfRowsInSection:indexPath.section] - 1) {//下圆角
        cell.backgroundView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@_bottom.png",prefix]] stretchableImageWithLeftCapWidth:radius topCapHeight:radius] ];
    }else {//中间无圆角
        cell.backgroundView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@_middle.png",prefix]] stretchableImageWithLeftCapWidth:radius topCapHeight:radius] ];
    }
}
@end
