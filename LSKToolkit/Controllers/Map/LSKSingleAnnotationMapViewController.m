//
//  SingleAnnotationMapViewController.m
//  RenjianLib
//
//  Created by luosky on 1/5/11.
//  Copyright 2011 renjian.com. All rights reserved.
//

#import "LSKSingleAnnotationMapViewController.h"


@implementation LSKSingleAnnotationMapViewController

@synthesize annotation;

#pragma mark -
-(void)searchPathToAnnotation
{
	[super searchPathToAnnotation:annotation];
}

#pragma mark -
#pragma mark life cycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		
		UIBarButtonItem* closeButton = [[UIBarButtonItem alloc] initWithTitle:@"查找路线" style:UIBarButtonItemStyleBordered target:self
																	   action:@selector(searchPathToAnnotation)];
		self.navigationItem.rightBarButtonItem = closeButton;
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
	if (annotation) {
        if ([annotation superclass] != mapView) {
            [mapView addAnnotation:annotation];
        }
        
		region.center = annotation.coordinate;
	}
	[mapView setRegion:region animated:YES];
    
}

@end
