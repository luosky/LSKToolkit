//
//  ImageCell.m
//  Eden
//
//  Created by luosky on 11/22/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import "LSKImageCell.h"
#import "LSKConstants.h"

@implementation LSKImageCell
@synthesize imageButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		//头像
//        imageButton = [[EGOImageButton alloc] initWithPlaceholderImage:nil];
        imageButton = [[EGOImageURLSafeButton alloc] initWithPlaceholderImage:nil];

        [imageButton setUserInteractionEnabled:NO];
	    imageButton.frame = CGRectMake(CELL_IMAGE_PADDING, CELL_IMAGE_PADDING, CELL_AVATAR_IMAGE_WIDTH, CELL_AVATAR_IMAGE_WIDTH);
        imageButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//        CALayer* layer = imageButton.layer;
//        layer.masksToBounds = YES;

        //border
//        layer.cornerRadius = 4.0;
//        layer.borderColor = [UIColor darkGrayColor].CGColor;
//        layer.borderWidth = 2;

        /*
        //shadow
        UIView* shadow = [[UIView alloc] initWithFrame:imageButton.frame];
        shadow.backgroundColor = [UIColor grayColor];
        shadow.layer.shadowColor = [UIColor blackColor].CGColor;
        shadow.layer.shadowOpacity = 0.5;
        shadow.layer.shadowOffset = CGSizeMake(0, 3);
        shadow.layer.shadowRadius = 3.0;
        shadow.layer.cornerRadius = 5;
//        shadow.hidden = YES;
        shadow.layer.shouldRasterize = YES;
        [self.contentView addSubview:shadow];
        
        [shadow release];
        */
		[self.contentView addSubview:imageButton];
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [imageButton cancelImageLoad];
	
}



@end
