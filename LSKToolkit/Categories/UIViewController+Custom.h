//
//  UIViewController+Custom.h
//  LSKToolkit
//
//  Created by Luosky on 12-7-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Custom)

- (void)addLeftNavButtonWithTitle:(NSString*)title target:(id)target action:(SEL)selector;
- (void)addRightNavButtonWithTitle:(NSString*)title target:(id)target action:(SEL)selector;


- (void)addLeftNavButtonWithImageName:(NSString*)imageName target:(id)target action:(SEL)selector;
- (void)addRightNavButtonWithImageName:(NSString*)imageName target:(id)target action:(SEL)selector;


- (void)addLeftNavButtonWithImageName:(NSString*)imageName title:(NSString*)title target:(id)target action:(SEL)selector;
- (void)addRightNavButtonWithImageName:(NSString*)imageName title:(NSString*)title target:(id)target action:(SEL)selector;
@end
