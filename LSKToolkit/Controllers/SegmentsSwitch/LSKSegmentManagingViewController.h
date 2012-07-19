//
//  SegmentManagingViewController.h
//  aizheke
//
//  Created by Luosky@gmail.com on 12-2-22.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface LSKSegmentManagingViewController : UIViewController <UINavigationControllerDelegate> {
    UISegmentedControl    * segmentedControl;
    UIViewController      * activeViewController;
    NSArray               * segmentedViewControllers;
}

@property (nonatomic, strong) IBOutlet UISegmentedControl * segmentedControl;
@property (nonatomic, strong) UIViewController            * activeViewController;
@property (nonatomic, strong) NSArray                     * segmentedViewControllers;

- (id)initWithControlers:(NSArray*)controllers;
- (void)didChangeSegmentControl:(UISegmentedControl *)control;
@end


@protocol SegmentManagingViewControllerDelegate<NSObject>

@optional
- (UINavigationController*)navigationControllerDelegate;
- (void)assignNavigationControllerDelegate;
@end
