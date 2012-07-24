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

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		
		UIBarButtonItem* closeButton = [[UIBarButtonItem alloc] initWithTitle:@"查找路线" style:UIBarButtonItemStyleBordered target:self 
																	   action:@selector(searchPathToAnnotation)];
		self.navigationItem.rightBarButtonItem = closeButton;
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

-(void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];

	if (annotation) {
		[mapView addAnnotation:annotation];
		region.center = annotation.coordinate;
	}
	[mapView setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
