//
//  UIViewController+Navigation.m
//  breadcoupon
//
//  Created by luosky on 12-8-6.
//
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

// from http://stackoverflow.com/questions/410471/how-can-i-pop-a-view-from-a-uinavigationcontroller-and-replace-it-with-another-i
- (void)popAndPushViewController:(UIViewController*) controller animated:(BOOL)animated{
    UINavigationController *navController = self.navigationController;
    [navController popViewControllerAnimated:animated];
    [navController pushViewController:controller animated:animated];
}
@end
