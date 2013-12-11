//
//  EGOImageView.m
//  EGOImageLoading
//
//  Created by Shaun Harrison on 9/15/09.
//  Copyright (c) 2009-2010 enormego
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "EGOImageView.h"
#import "EGOImageLoader.h"

@implementation EGOImageView
@synthesize imageURL, placeholderImage, delegate;

// for serial loading of images using UIImage#imageNamed
static dispatch_queue_t	imageLoadingQueue = nil;
+ (void) initialize {
    if (self == [EGOImageView class]) {
        imageLoadingQueue = dispatch_queue_create("com.enormego.EGOImageView", NULL);
        dispatch_queue_t priority = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_set_target_queue(priority, imageLoadingQueue);
    }
}

- (id)initWithPlaceholderImage:(UIImage*)anImage {
	return [self initWithPlaceholderImage:anImage delegate:nil];	
}

- (id)initWithPlaceholderImage:(UIImage*)anImage delegate:(id<EGOImageViewDelegate>)aDelegate {
	if((self = [super initWithImage:anImage])) {
		self.placeholderImage = anImage;
		self.delegate = aDelegate;
	}
	
	return self;
}

- (void)setPlaceholderImage:(UIImage *)anImage {
    [anImage retain]; // must retain before releasing old, in case placeholderImage is same
    [placeholderImage release];
    placeholderImage = anImage;
    if(!imageURL) {
        self.image = placeholderImage;
    }
}


- (void)fetchImageAtUrlStr:(NSString*)urlStr{
    if (urlStr && [urlStr isKindOfClass:[NSString class] ] && urlStr.length > 0) {
        [self setImageURL:[NSURL URLWithString:urlStr]];
    }
}


- (void)setImageURL:(NSURL *)aURL {
    EGOImageLoader *sharedImageLoader = [EGOImageLoader sharedImageLoader];
	if(imageURL) {
		[sharedImageLoader removeObserver:self forURL:imageURL];
		[imageURL release];
		imageURL = nil;
	}
	
	if(!aURL) {
		self.image = placeholderImage;
//		self.imageURL = nil;
		return;
	} else {
		imageURL = [aURL retain];
	}

	[sharedImageLoader removeObserver:self];
    
    // new logic
    if ([sharedImageLoader hasLoadedImageURL:aURL]) {
        dispatch_async(imageLoadingQueue, ^{
            UIImage *anImage = [sharedImageLoader imageForURL:aURL shouldLoadWithObserver:self];
            if (anImage == nil) {
                // if image expired between hasLoadedImageURL check, and imageForURL call
                // loader callback will handle the request
                return;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([imageURL isEqual:aURL]) {
                    [self displayImage:anImage];
                    if([delegate respondsToSelector:@selector(imageViewLoadedImage:loadedFromCache:)]) {
                        [delegate imageViewLoadedImage:self loadedFromCache:YES];
                    }
                } // else, different image was requested
            });
        });
    } else {
        [sharedImageLoader loadImageForURL:aURL observer:self];
		self.image = placeholderImage;
    }
    // old logic
//	UIImage* anImage = [sharedImageLoader imageForURL:aURL shouldLoadWithObserver:self];
//	if(anImage) {
//		self.image = anImage;
//
//		// trigger the delegate callback if the image was found in the cache
//		if([delegate respondsToSelector:@selector(imageViewLoadedImage:loadedFromCache:)]) {
//			[delegate imageViewLoadedImage:self loadedFromCache:YES];
//		}
//	} else {
//		self.image = placeholderImage;
//	}
}

- (void)displayImage:(UIImage*)anImage{
    self.image = anImage;
}

#pragma mark -
#pragma mark Image loading

- (void)cancelImageLoad {
    EGOImageLoader *sharedImageLoader = [EGOImageLoader sharedImageLoader];
	[sharedImageLoader cancelLoadForURL:imageURL];
	[sharedImageLoader removeObserver:self forURL:imageURL];
}

- (void)imageLoaderDidLoad:(NSNotification*)notification {
    NSDictionary *userInfo = notification.userInfo;
	if(![[userInfo objectForKey:@"imageURL"] isEqual:imageURL]) return;

	UIImage* anImage = [userInfo objectForKey:@"image"];
    [self displayImage:anImage];
	[self setNeedsDisplay];
	
	if([delegate respondsToSelector:@selector(imageViewLoadedImage:loadedFromCache:)]) {
		[delegate imageViewLoadedImage:self loadedFromCache:NO];
	}	
}

- (void)imageLoaderDidFailToLoad:(NSNotification*)notification {
    NSDictionary *userInfo = notification.userInfo;
	if(![[userInfo objectForKey:@"imageURL"] isEqual:imageURL]) return;
	
	if([delegate respondsToSelector:@selector(imageViewFailedToLoadImage:error:)]) {
		[delegate imageViewFailedToLoadImage:self error:[userInfo objectForKey:@"error"]];
	}
}

#pragma mark -
- (void)dealloc {
	[[EGOImageLoader sharedImageLoader] removeObserver:self];
    self.delegate = nil;
	self.imageURL = nil;
	self.placeholderImage = nil;
    [super dealloc];
}

@end
