//
//  EGOImageRoundedView.m
//  aizheke
//
//  Created by luo sky on 11-11-20.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "EGOImageRoundedView.h"
#import <QuartzCore/QuartzCore.h>
//#import "UIImage+RoundCorner.h"

@implementation EGOImageRoundedView


- (id)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image]) {
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
		self.image = self.placeholderImage;
		imageURL = nil;
		return;
	} else {
		imageURL = [aURL retain];
	}
    
	[[EGOImageLoader sharedImageLoader] removeObserver:self];
	UIImage* anImage = [[EGOImageLoader sharedImageLoader] imageForURL:aURL shouldLoadWithObserver:self];
	
	if(anImage) {
		self.image = [anImage roundCornerWithPixel:self.frame.size.width * 2 radius:10] ;
        
		// trigger the delegate callback if the image was found in the cache
		if([self.delegate respondsToSelector:@selector(imageViewLoadedImage:)]) {
			[self.delegate imageViewLoadedImage:self];
		}
	} else {
		self.image = self.placeholderImage;
	}
}

- (void)imageLoaderDidLoad:(NSNotification*)notification {
	if(![[[notification userInfo] objectForKey:@"imageURL"] isEqual:self.imageURL]) return;
    
	UIImage* anImage = [[notification userInfo] objectForKey:@"image"];
	self.image = [anImage roundCornerWithPixel:self.frame.size.width * 2 radius:10] ;
	[self setNeedsDisplay];
	
	if([self.delegate respondsToSelector:@selector(imageViewLoadedImage:)]) {
		[self.delegate imageViewLoadedImage:self];
	}	
}
*/

@end
