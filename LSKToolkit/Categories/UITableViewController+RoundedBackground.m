//
//  UITableViewController+RoundedBackground.m
//  aizheke_html
//
//  Created by Luosky on 11-8-5.
//  Copyright 2011年 Renjian.com. All rights reserved.
//

#import "UITableViewController+RoundedBackground.h"


@implementation UITableViewController (UITableViewController_RoundedBackground)


- (void)setRoundedBackground:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath cell:(UITableViewCell *)cell {
    return;
    int cornerCap = 10;
    if ([self tableView:tableView numberOfRowsInSection:indexPath.section] ==1){//四圆角
        cell.backgroundView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"rounded_cell_bg_single.png"] stretchableImageWithLeftCapWidth:cornerCap topCapHeight:cornerCap] ];
    }else if (indexPath.row == 0) {//上圆角
        cell.backgroundView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"rounded_cell_bg_top.png"] stretchableImageWithLeftCapWidth:cornerCap topCapHeight:cornerCap] ];
    }else if (indexPath.row == [self tableView:tableView numberOfRowsInSection:indexPath.section] - 1) {//下圆角
        cell.backgroundView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"rounded_cell_bg_bottom.png"] stretchableImageWithLeftCapWidth:cornerCap topCapHeight:cornerCap] ];
    }else {//中间无圆角
        cell.backgroundView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"rounded_cell_bg_mid.png"] stretchableImageWithLeftCapWidth:cornerCap topCapHeight:cornerCap] ];
    }
}


@end
