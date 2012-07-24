    //
//  MultiAnnotationsMapViewController.m
//  RenjianLib
//
//  Created by luosky on 1/5/11.
//  Copyright 2011 renjian.com. All rights reserved.
//

#import "LSKMultiAnnotationsMapViewController.h"
#import "LSKMapAnnotation.h"

@implementation LSKMultiAnnotationsMapViewController


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

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




#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)_mapView regionDidChangeAnimated:(BOOL)animated {
	
	
	MKCoordinateRegion currentRegion = _mapView.region;
	
	/*
	NSValue *regionAsValue = [NSValue valueWithBytes:&currentRegion objCType:@encode(MKCoordinateRegion)];    
	
	NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
																			selector:@selector(updateAssetsOnRegion:)
																			  object:regionAsValue];
	if(operation != nil) {
		//Cancel any previous operations before we proceed with this one
		[queue cancelAllOperations];
		
		[queue addOperation:operation];  
	}
	
	[operation release];
	 */
	
	[self updateAnnotationsOnRegion:currentRegion];
}

- (void) updateAnnotationsOnRegion: (MKCoordinateRegion) currentRegion{
	
	
	NSMutableArray *assetItems = [[NSMutableArray alloc] init];    
	
//	float westLon = currentRegion.center.longitude - currentRegion.span.longitudeDelta;
//	float southLat = currentRegion.center.latitude - currentRegion.span.latitudeDelta;	

	for(int i=0; i < 10; i++) {
		LSKMapAnnotation *anno = [[LSKMapAnnotation alloc] init];		
//		[anno setTitle:[NSString stringWithFormat:@"优惠 %d",i]];
		//CLLocationCoordinate2D center = {currentRegion.center.latitude + currentRegion.span.latitudeDelta/100.0f*(arc4random()%200-100) ,currentRegion.center.longitude + currentRegion.span.longitudeDelta/100.0f*(arc4random()%200-100)};
		CLLocationCoordinate2D center = {currentRegion.center.latitude - currentRegion.span.latitudeDelta/2 + currentRegion.span.latitudeDelta/100*(arc4random()%100) ,currentRegion.center.longitude - currentRegion.span.longitudeDelta/2 + currentRegion.span.longitudeDelta/100*(arc4random()%100)};
		anno.coordinate =center;
		//			[anno setLatitude:southLat + (currentRegion.span.latitudeDelta/50.0f)*(arc4random()%100)];
		//			[anno setLongitude:westLon + (currentRegion.span.longitudeDelta/50.0f)*(arc4random()%100)];		
		[assetItems addObject:anno];
	}
	
    
	[mapView addAnnotations:assetItems];  
	
}

/*
- (void) updateAssetsOnRegion: (NSValue*) value{
	
		
		MKCoordinateRegion currentRegion;
		[value getValue:&currentRegion];  
		
		NSMutableArray *assetItems = [[[NSMutableArray alloc] init] autorelease];    
		
		float westLon = currentRegion.center.longitude - currentRegion.span.longitudeDelta;
		float southLat = currentRegion.center.latitude - currentRegion.span.latitudeDelta;	
		
		for(int i=0; i < 10; i++) {
			MapAnnotation *anno = [[MapAnnotation alloc] init];		
			[anno setTitle:[NSString stringWithFormat:@"Pin %i",i]];
			CLLocationCoordinate2D center = {southLat + (currentRegion.span.latitudeDelta/50.0f)*(arc4random()%100) ,westLon + (currentRegion.span.longitudeDelta/50.0f)*(arc4random()%100)};
			anno.coordinate =center;
//			[anno setLatitude:southLat + (currentRegion.span.latitudeDelta/50.0f)*(arc4random()%100)];
//			[anno setLongitude:westLon + (currentRegion.span.longitudeDelta/50.0f)*(arc4random()%100)];		
			[assetItems addObject:anno];
			[anno release];		
		}
	
    
	[mapView addAnnotations:assetItems];  
	
}
*/

@end
