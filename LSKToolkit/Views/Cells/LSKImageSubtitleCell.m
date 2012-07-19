//
//  ImageSubtitleCell.m
//  aizheke
//
//  Created by luo sky on 11-11-10.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LSKImageSubtitleCell.h"
#import "UIColor+Expanded.h"

@implementation LSKImageSubtitleCell
@synthesize titleLabel;
@synthesize subtitleLabel;
@synthesize imageButton;
@synthesize cellHeight;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_arrow.png"]];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 210, 20)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:17];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"351F18"];
        [self.contentView addSubview:self.titleLabel];
        
        self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 37, 210, 15)];
        self.subtitleLabel.backgroundColor = [UIColor clearColor];
        self.subtitleLabel.textColor = [UIColor colorWithHexString:@"86898E"];
        self.subtitleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
//        self.subtitleLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.subtitleLabel];
        
        self.imageButton = [[EGOImageURLSafeButton alloc] initWithPlaceholderImage:nil];
        [imageButton setUserInteractionEnabled:NO];
        self.imageButton.frame = CGRectMake(15, 13, 32, 32);
        [self.contentView addSubview:imageButton];
        
        self.cellHeight = 58;
    }
    return self;
}



- (void)updateImage:(UIImage*)image
{
    [imageButton setBackgroundImage:image forState:UIControlStateNormal];
    [imageButton setNeedsDisplay];   
}

- (void)fetchImageWithUrlStr:(NSString*)url
{
    [imageButton setImageURLStr:url];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.titleLabel.text = @"";
    self.subtitleLabel.text = @"";
    [imageButton cancelImageLoad];
}

@end
