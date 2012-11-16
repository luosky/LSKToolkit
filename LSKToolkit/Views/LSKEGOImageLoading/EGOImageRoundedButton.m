//
//  EGOImageRoundedButton.m
//  aizheke
//
//  Created by luo sky on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "EGOImageRoundedButton.h"
//#import "UIImage+RoundCorner.h"
#import <QuartzCore/QuartzCore.h>
@implementation EGOImageRoundedButton

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5.0;
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5.0;
    }
    return self;
}

/*
- (void)setImageURL:(NSURL *)aURL {
	if(imageURL) {
		[[EGOImageLoader sharedImageLoader] removeObserver:self forURL:imageURL];
		[imageURL release];
		imageURL = nil;
	}
	
	if(!aURL) {
		[self setImage:self.placeholderImage forState:UIControlStateNormal];
		imageURL = nil;
		return;
	} else {
		imageURL = [aURL retain];
	}
	
	UIImage* anImage = [[EGOImageLoader sharedImageLoader] imageForURL:aURL shouldLoadWithObserver:self];
	
	if(anImage) {
//        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 100;
        self.layer.backgroundColor = [UIColor colorWithPatternImage:anImage].CGColor;


//        [self setImage:[anImage roundCornerWithPixel:self.frame.size.width * 2 radius:10] forState:UIControlStateNormal];
	} else {
		[self setImage:self.placeholderImage forState:UIControlStateNormal];
	}
}


- (void)imageLoaderDidLoad:(NSNotification*)notification {
	if(![[[notification userInfo] objectForKey:@"imageURL"] isEqual:self.imageURL]) return;
	
	UIImage* anImage = [[notification userInfo] objectForKey:@"image"];
//	[self setImage:[anImage roundCornerWithPixel:self.frame.size.width * 2 radius:10] forState:UIControlStateNormal];
    //    self.backgroundColor = [UIColor clearColor];
//    self.contentMode = UIViewContentModeScaleToFill;
    self.layer.cornerRadius = 100;
//    self.layer.contentsScale


	[self setNeedsDisplay];
	
	if([self.delegate respondsToSelector:@selector(imageButtonLoadedImage:)]) {
		[self.delegate imageButtonLoadedImage:self];
	}	
}
*/

@end
