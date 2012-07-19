//
//  SegmentManagingViewController.m
//  aizheke
//
//  Created by Luosky@gmail.com on 12-2-22.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "LSKSegmentManagingViewController.h"
#import "UIColor+Expanded.h"

@interface LSKSegmentManagingViewController ()

@end

@implementation LSKSegmentManagingViewController

@synthesize segmentedControl, activeViewController, segmentedViewControllers;


- (id)initWithControlers:(NSArray*)controllers
{
    self.segmentedViewControllers = controllers;
    return [self initWithNibName:nil bundle:nil];
}

- (void)initSegment
{
	NSMutableArray* titles = [NSMutableArray array];
	for (UIViewController* vc in self.segmentedViewControllers) {
		if(vc.title){
			[titles addObject:vc.title];
		}else {
			[titles addObject:@""];
		}
	}
	
	self.segmentedControl = [[UISegmentedControl alloc] initWithItems:titles];
    [self.segmentedControl setTintColor:[UIColor colorWithHexString:@"eb6a2a"]];
    CGRect frame = self.segmentedControl.frame;
    frame.size.width = 240;
    frame.size.height = 30;
    self.segmentedControl.frame = frame;
    
	self.segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	
	[self.segmentedControl addTarget:self
                              action:@selector(didChangeSegmentControl:)
		   forControlEvents:UIControlEventValueChanged];
	
	self.segmentedControl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = self.segmentedControl;
    
    //assign navigationController delegate
    for (UIViewController* controller in self.segmentedViewControllers) {
        if ([controller respondsToSelector:@selector(assignNavigationControllerDelegate:)]) {
            [controller performSelector:@selector(assignNavigationControllerDelegate:) withObject:self.navigationController];
        }
    }
    
    [self didChangeSegmentControl:self.segmentedControl]; // kick everything off
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSegment];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.activeViewController viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.activeViewController viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.activeViewController viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.activeViewController viewDidDisappear:animated];
}

#pragma mark -
#pragma mark UINavigationControllerDelegate control

// Required to ensure we call viewDidAppear/viewWillAppear on ourselves (and the active view controller)
// inside of a navigation stack, since viewDidAppear/willAppear insn't invoked automatically. Without this
// selected table views don't know when to de-highlight the selected row.

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [viewController viewDidAppear:animated];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [viewController viewWillAppear:animated];
}

#pragma mark -
#pragma mark Segment control

- (void)didChangeSegmentControl:(UISegmentedControl *)control {
    if (self.activeViewController) {
        [self.activeViewController viewWillDisappear:NO];
        [self.activeViewController.view removeFromSuperview];
        [self.activeViewController viewDidDisappear:NO];
    }
    
    
    self.activeViewController = [self.segmentedViewControllers objectAtIndex:control.selectedSegmentIndex];
    
    [self.activeViewController viewWillAppear:NO];
    [self.view addSubview:self.activeViewController.view];
    CGRect frame = self.activeViewController.view.frame;
    self.activeViewController.view.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
    [self.activeViewController viewDidAppear:NO];
    
//    NSString * segmentTitle = [control titleForSegmentAtIndex:control.selectedSegmentIndex];
//    self.navigationItem.backBarButtonItem  = [[UIBarButtonItem alloc] initWithTitle:segmentTitle style:UIBarButtonItemStylePlain target:nil action:nil];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    self.segmentedControl = nil;
    self.segmentedViewControllers = nil;
    self.activeViewController = nil;
}

@end