//
//  ZoomPictureViewController.h
//  aizheke_html
//
//  Created by Luosky on 11-6-24.
//  Copyright 2011年 Renjian.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageURLSafeView.h"

@interface LSKZoomPictureViewController : UIViewController <UIScrollViewDelegate>{
    UIScrollView *imageScrollView;
	EGOImageURLSafeView *imageView;
    UIImage*    image;
    UIToolbar *toolbar;
    NSString*   imageUrl;
}

@property (nonatomic, strong) IBOutlet UIScrollView *imageScrollView;
@property (nonatomic, strong) IBOutlet EGOImageURLSafeView *imageView;
@property (nonatomic, strong)     UIImage*    image;
@property (nonatomic, strong) IBOutlet UIToolbar *toolbar;
@property (nonatomic, strong) NSString*   imageUrl;

- (IBAction)dismissMVC:(id)sender;
- (IBAction)saveToAlbum:(id)sender;


@end
