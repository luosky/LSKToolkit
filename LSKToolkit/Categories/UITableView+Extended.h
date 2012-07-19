//
//  UITableView+Extended.h
//  aizheke
//
//  Created by Luosky on 12-5-10.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extended)

- (void)roundedBackgroundWithImageFilePrefix:(NSString*)prefix atRadius:(int)radius forCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath;

- (void)roundedBackgroundAtRadius:(int)radius forCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath;
@end
