//
//  EGOProgressImageView.m
//  EGOImageLoadingDemo
//
//  Created by luosky on 13-1-6.
//
//

#import "EGOProgressImageView.h"
#import "EGOImageLoader.h"

@implementation EGOProgressImageView

- (void)layoutSubviews{
    [super layoutSubviews];
    if (!self.progressView) {
        UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        int progressMargin = 5;
        int progressHeight = 9;
        progressView.frame = CGRectMake(progressMargin,self.center.y - progressHeight/2 , self.bounds.size.width - progressMargin * 2, progressHeight);
        progressView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        progressView.hidden = YES;
        self.progressView = progressView;
        [self addSubview:self.progressView];
    }
}

#pragma mark overrides
- (void)displayImage:(UIImage*)anImage{
    [super displayImage:anImage];
    self.progressView.hidden = YES;
}


#pragma mark EGOImageLoaderObserver protocol


- (void)imageLoaderDidFailToLoad:(NSNotification*)notification {
    [super imageLoaderDidFailToLoad:notification];
    
    self.progressView.hidden = YES;
}

- (void)imageLoaderProgress:(NSNotification*)notification{
    NSDictionary *userInfo = notification.userInfo;
	if(![[userInfo objectForKey:@"imageURL"] isEqual:self.imageURL]) return;
    
	float progress = [[userInfo objectForKey:@"progress"] floatValue];
    
    self.progressView.progress = progress;
    if (self.progressView.progress == 1.0) {
        self.progressView.hidden = YES;
    }else{
        self.progressView.hidden = NO;
    }
}

#pragma mark -

- (void)dealloc {
    [self.progressView release];
    self.progressView = nil;
    [super dealloc];
}

@end
