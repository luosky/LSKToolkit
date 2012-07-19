//
//  ImageSubtitleCell.h
//  aizheke
//
//  Created by luo sky on 11-11-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSKImageCell.h"

@interface LSKImageSubtitleCell  : UITableViewCell

@property(nonatomic,strong)	EGOImageURLSafeButton*				imageButton;
@property(nonatomic,assign)     CGFloat cellHeight;


@property (nonatomic, strong) UILabel*  titleLabel;
@property (nonatomic, strong) UILabel*  subtitleLabel;

- (void)fetchImageWithUrlStr:(NSString*)url;
@end
