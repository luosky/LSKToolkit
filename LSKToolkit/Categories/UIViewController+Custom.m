//
//  UIViewController+Custom.m
//  LSKToolkit
//
//  Created by Luosky on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+Custom.h"
#import "LSKConstants.h"
@implementation UIViewController (Custom)

- (void)addLeftNavButtonWithImageName:(NSString*)imageName title:(NSString*)title target:(id)target action:(SEL)selector {
    [self addNavButtonWithImageName:imageName title:title target:target action:selector atLeftButton:YES];
}

- (void)addRightNavButtonWithImageName:(NSString*)imageName title:(NSString*)title target:(id)target action:(SEL)selector {
    [self addNavButtonWithImageName:imageName title:title target:target action:selector atLeftButton:NO];
}

- (void)addLeftNavButtonWithImageName:(NSString*)imageName target:(id)target action:(SEL)selector {
    [self addNavButtonWithImageName:imageName title:nil target:target action:selector atLeftButton:YES];
}

- (void)addRightNavButtonWithImageName:(NSString*)imageName target:(id)target action:(SEL)selector {
    [self addNavButtonWithImageName:imageName title:nil target:target action:selector atLeftButton:NO];
}

- (void)addNavButtonWithImageName:(NSString*)imageName title:(NSString*)title target:(id)target action:(SEL)selector atLeftButton:(BOOL)isLeftButton{
    UIButton* homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* homeButtonImage = [UIImage imageNamed:imageName];
    homeButton.frame = CGRectMake(0, 0, homeButtonImage.size.width, homeButtonImage.size.height);
    [homeButton setBackgroundImage:homeButtonImage forState:UIControlStateNormal];
    if (IS_NOT_BLANK_STR(title)) {
        homeButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [homeButton setTitle:title forState:UIControlStateNormal];
    }
    [homeButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* homeButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    if (isLeftButton) {
        [self navigationItem].leftBarButtonItem  = homeButtonItem;
    }else {
        [self navigationItem].rightBarButtonItem  = homeButtonItem;
    }
    
}
@end
