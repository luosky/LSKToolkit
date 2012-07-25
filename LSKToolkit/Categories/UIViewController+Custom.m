//
//  UIViewController+Custom.m
//  LSKToolkit
//
//  Created by Luosky on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+Custom.h"

@implementation UIViewController (Custom)

- (void)addLeftNavButtonWithImageName:(NSString*)imageName target:(id)target action:(SEL)selector {
    [self addNavButtonWithImageName:imageName target:target action:selector atLeftButton:YES];
}

- (void)addRightNavButtonWithImageName:(NSString*)imageName target:(id)target action:(SEL)selector {
    [self addNavButtonWithImageName:imageName target:target action:selector atLeftButton:NO];
}

- (void)addNavButtonWithImageName:(NSString*)imageName target:(id)target action:(SEL)selector atLeftButton:(BOOL)isLeftButton{
    UIButton* homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage* homeButtonImage = [UIImage imageNamed:imageName];
    homeButton.frame = CGRectMake(0, 0, homeButtonImage.size.width, homeButtonImage.size.height);
    [homeButton setBackgroundImage:homeButtonImage forState:UIControlStateNormal];
    [homeButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* homeButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    if (isLeftButton) {
        [self navigationItem].leftBarButtonItem  = homeButtonItem;
    }else {
        [self navigationItem].rightBarButtonItem  = homeButtonItem;
    }

}
@end
