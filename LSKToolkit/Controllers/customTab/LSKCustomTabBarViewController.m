//
//  CustomTabBarViewController.m
//  CustomTabBar
//
//  Created by Peter Boctor on 1/2/11.
//
// Copyright (c) 2011 Peter Boctor
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE
//

#import "LSKCustomTabBarViewController.h"
#define SELECTED_VIEW_CONTROLLER_TAG 98456345

//static NSArray* tabBarItems = nil;

@implementation LSKCustomTabBarViewController
@synthesize tabBar,tabBarItems,selectedIndex;

#pragma mark -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self initTabs];
    }
    return self;
}

- (void) awakeFromNib
{
    [self initTabs];    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a custom tab bar passing in the number of items, the size of each item and setting ourself as the delegate
    self.tabBar = [[LSKCustomTabBar alloc] initWithItemCount:self.tabBarItems.count itemSize:CGSizeMake(self.view.frame.size.width/self.tabBarItems.count, self.tabBarHeight) tag:0 delegate:self] ;
    
    // Place the tab bar at the bottom of our view
    self.tabBar.frame = CGRectMake(0,self.view.frame.size.height-self.tabBarHeight,self.view.frame.size.width, self.tabBarHeight);
    [self.view addSubview:self.tabBar];
    
    // Select the first tab
    [tabBar selectItemAtIndex:0];
    [self touchDownAtItemAtIndex:0];
}

#pragma mark -
#pragma mark CustomTabBarDelegate

#pragma mark - need to override 
- (void) initTabs
{
}


- (UIImage*) backgroundImage
{
    /*
     // The tab bar's width is the same as our width
     CGFloat width = self.view.frame.size.width;
     // Get the image that will form the top of the background
     UIImage* topImage = [UIImage imageNamed:@"tabbar_background.png"];
     
     // Create a new image context
     UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, topImage.size.height*2), NO, 0.0);
     
     // Create a stretchable image for the top of the background and draw it
     UIImage* stretchedTopImage = [topImage stretchableImageWithLeftCapWidth:0 topCapHeight:0];
     [stretchedTopImage drawInRect:CGRectMake(0, 0, width, topImage.size.height)];
     // Draw a solid black color for the bottom of the background
     [[UIColor blackColor] set];
     CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, topImage.size.height, width, topImage.size.height));
     
     // Generate a new image
     UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     */
    UIImage* resultImage = [UIImage imageNamed:@"tabbar_background.png"];
    return resultImage;
}
#pragma mark optional to override

// Return height of the tab without the center rised part. same as self.tabBarHeight if it is not a center rised tabbar. 
- (CGFloat) lowestTabBarHeight{
    return [self tabBarHeight];
}

#pragma mark others
- (UIImage*) imageFor:(LSKCustomTabBar*)tabBar atIndex:(NSUInteger)itemIndex
{
    // Get the right data
    NSDictionary* data = [tabBarItems objectAtIndex:itemIndex];
    // Return the image for this tab bar item
    return [UIImage imageNamed:[data objectForKey:@"image"]];
}

- (UIImage*) highlightImageFor:(LSKCustomTabBar*)tabBar atIndex:(NSUInteger)itemIndex
{
    // Get the right data
    NSDictionary* data = [tabBarItems objectAtIndex:itemIndex];
    // Return the image for this tab bar item
    return [UIImage imageNamed:[data objectForKey:@"highlight_image"]];
}



// This is the blue background shown for selected tab bar items
- (UIImage*) selectedItemBackgroundImage
{
    return nil;
    //  return [UIImage imageNamed:@"TabBarItemSelectedBackground.png"];
}

// This is the glow image shown at the bottom of a tab bar to indicate there are new items
- (UIImage*) glowImage
{
    UIImage* tabBarGlow = [UIImage imageNamed:@"TabBarGlow.png"];
    
    // Create a new image using the TabBarGlow image but offset 4 pixels down
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(tabBarGlow.size.width, tabBarGlow.size.height-4.0), NO, 0.0);
    
    // Draw the image
    [tabBarGlow drawAtPoint:CGPointZero];
    
    // Generate a new image
    UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}

// This is the embossed-like image shown around a selected tab bar item
- (UIImage*) selectedItemImage
{
    CGSize tabBarItemSize = CGSizeMake(self.view.frame.size.width/tabBarItems.count, self.tabBarHeight);
    UIGraphicsBeginImageContextWithOptions(tabBarItemSize, NO, 0.0);
    
    // Create a stretchable image using the TabBarSelection image but offset 4 pixels down
    [[[UIImage imageNamed:@"TabBarSelection.png"] stretchableImageWithLeftCapWidth:4.0 topCapHeight:0] drawInRect:CGRectMake(0, 4.0, tabBarItemSize.width, tabBarItemSize.height-4.0)];  
    
    // Generate a new image
    UIImage* selectedItemImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return selectedItemImage;
}

- (UIImage*) tabBarArrowImage
{
    return nil;
//    return [UIImage imageNamed:@"tabbar_mask_semi.png"];
    //  return [UIImage imageNamed:@"TabBarNipple.png"];
}

- (void) touchDownAtItemAtIndex:(NSUInteger)itemIndex
{
    // Tap the current tab to pop to rootViewController
    if (selectedIndex == itemIndex) {
        NSDictionary* data = [tabBarItems objectAtIndex:selectedIndex];
        UIViewController* viewController = [data objectForKey:@"viewController"];
        if ([viewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)viewController viewControllers].count > 1) {
            [(UINavigationController*)viewController popToRootViewControllerAnimated:YES];
            return;
        }
    }
    
    // Remove the current view controller's view
    NSDictionary* data = [tabBarItems objectAtIndex:selectedIndex];
    UIViewController* viewController = [data objectForKey:@"viewController"];
    if (viewController) {
        [viewController viewWillDisappear:YES];
        UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
        [currentView removeFromSuperview];
        [viewController viewDidDisappear:YES];

    }
    
    // Get the view controller to show
    data = [tabBarItems objectAtIndex:itemIndex];
    viewController = [data objectForKey:@"viewController"];

    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController =(UINavigationController*)viewController;
        navController.delegate = self;
    }
    
    // Set the view controller's frame to account for the tab bar
    viewController.view.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height-[self lowestTabBarHeight]);
    
    // Se the tag so we can find it later
    viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
    
    // Add the new view controller's view
    [viewController viewWillAppear:YES];
    [self.view insertSubview:viewController.view belowSubview:tabBar];
    [viewController viewDidAppear:YES];
    selectedIndex = itemIndex;

    // In 1 second glow the selected tab
    //  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(addGlowTimerFireMethod:) userInfo:[NSNumber numberWithInteger:itemIndex] repeats:NO];
    
}

- (void)hideTabBar
{
    tabBar.hidden = YES;
    UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    currentView.frame = self.view.bounds;
}


- (void)showTabBar
{
    tabBar.hidden = NO;
    UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    currentView.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height-[self lowestTabBarHeight]);
}

- (void)addGlowTimerFireMethod:(NSTimer*)theTimer
{
    // Remove the glow from all tab bar items
    for (NSUInteger i = 0 ; i < tabBarItems.count ; i++)
    {
        [tabBar removeGlowAtIndex:i];
    }
    
    // Then add it to this tab bar item
    [tabBar glowItemAtIndex:[[theTimer userInfo] integerValue]];
}

- (CGFloat)tabBarHeight{
    return [self backgroundImage].size.height;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

/*
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    // Let the tab bar that we're about to rotate
    [tabBar willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    
    // Adjust the current view in prepartion for the new orientation
    UIView* currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    
    CGFloat width = 0, height = 0;
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        width = self.view.window.frame.size.width;
        height = self.view.window.frame.size.height;
    }
    else
    {
        width = self.view.window.frame.size.height;
        height = self.view.window.frame.size.width;
    }
    
    currentView.frame = CGRectMake(0,0,width, height-[self lowestTabBarHeight]);
}
*/
#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController.hidesBottomBarWhenPushed) {
        [self hideTabBar];
    }else {
        [self showTabBar];
    }
    
}

//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
