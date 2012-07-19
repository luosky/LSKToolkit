//
//  ZoomPictureViewController.m
//  aizheke_html
//
//  Created by Luosky on 11-6-24.
//  Copyright 2011年 Renjian.com. All rights reserved.
//

#import "LSKZoomPictureViewController.h"
#define ZOOM_VIEW_TAG 100
#define ZOOM_STEP 1.5


@interface LSKZoomPictureViewController (UtilityMethods)
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;
@end


@implementation LSKZoomPictureViewController
@synthesize toolbar,imageUrl;

@synthesize imageScrollView, imageView, image;

- (void)loadView {
    [super loadView];
    // set the tag for the image view
//    [imageView setTag:ZOOM_VIEW_TAG];
    
    // add gesture recognizers to the image view
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
    
    [doubleTap setNumberOfTapsRequired:2];
    [twoFingerTap setNumberOfTouchesRequired:2];
    
    [imageView addGestureRecognizer:singleTap];
    [imageView addGestureRecognizer:doubleTap];
    [imageView addGestureRecognizer:twoFingerTap];
    
    
    // calculate minimum scale to perfectly fit image width, and begin at that scale
    float minimumScale = [imageScrollView frame].size.width  / [imageView frame].size.width;
    [imageScrollView setMinimumZoomScale:minimumScale];
    [imageScrollView setZoomScale:minimumScale];

}

- (void)viewDidLoad{
    [super viewDidLoad];
    if (self.image){
        self.imageView.image = self.image;
    }
    if (self.imageUrl){
        [self.imageView setImageURLStr:self.imageUrl];
    }
}

- (void)viewDidUnload {
    [self setToolbar:nil];
	self.imageScrollView = nil;
	self.imageView = nil;
}



#pragma mark UIScrollViewDelegate methods


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
//    return [imageScrollView viewWithTag:ZOOM_VIEW_TAG];
}

/************************************** NOTE **************************************/
/* The following delegate method works around a known bug in zoomToRect:animated: */
/* In the next release after 3.0 this workaround will no longer be necessary      */
/**********************************************************************************/
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
    [scrollView setZoomScale:scale+0.01 animated:NO];
    [scrollView setZoomScale:scale animated:NO];
}

#pragma mark TapDetectingImageViewDelegate methods

- (void)handleSingleTap:(UIGestureRecognizer *)gestureRecognizer {
    self.toolbar.hidden = !self.toolbar.hidden;
}

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {
    // double tap zooms in
    float newScale = [imageScrollView zoomScale] * ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}

- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer {
    // two-finger tap zooms out
    float newScale = [imageScrollView zoomScale] / ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}

#pragma mark Utility methods

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    // the zoom rect is in the content view's coordinates. 
    //    At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
    //    As the zoom scale decreases, so more content is visible, the size of the rect grows.
    zoomRect.size.height = [imageScrollView frame].size.height / scale;
    zoomRect.size.width  = [imageScrollView frame].size.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}

- (IBAction)dismissMVC:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)saveToAlbum:(id)sender {
    UIImageWriteToSavedPhotosAlbum(self.imageView.image,self, @selector(image:didFinishSavingWithError:contextInfo:),nil);
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (!error){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"图片保存成功"
                                                        message:@"图片已保存至您的手机相册"
                                                       delegate:nil 
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil
                              ];
        [alert show];
    }

}

@end
