//
//  ImageTitleCell.m
//  aizheke
//
//  Created by luo sky on 11-11-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LSKImageTitleCell.h"
#import "UIColor+Expanded.h"

@implementation LSKImageTitleCell

@synthesize titleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 210, 60)];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"39231D"];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.titleLabel.text = @"";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
