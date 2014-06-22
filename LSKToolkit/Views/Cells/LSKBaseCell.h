//
//  BaseCell.h
//  aizheke
//
//  Created by luo sky on 11-11-18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSKBaseCell : UITableViewCell

@property (nonatomic,strong) id entity;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic,weak) UIViewController *viewController;

- (void)initAppearance;

- (void)updateWithEntity:(id)entity;

- (void)updateWithEntity:(id)entity atIndexPath:(NSIndexPath*)indexPath;

@end
