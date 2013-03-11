//
//  MapViewController.m
//  Eden
//
//  Created by luosky on 12/14/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import "LSKMapViewController.h"
#import "NSString+MKNetworkKitAdditions.h"
#import "LSKMapAnnotation.h"
#import "LSKConstants.h"

@interface  LSKMapViewController ()


@end

@implementation LSKMapViewController

@synthesize region;
@synthesize viewDistance;
@synthesize mapView;

-(id)initWithCenter:(CLLocationCoordinate2D)mapCenter viewDistance:(float)distance
{
	if(self = [self initWithNibName:nil bundle:nil]){
		viewDistance = distance;
		region = MKCoordinateRegionMakeWithDistance(mapCenter, viewDistance?viewDistance:3000.0f,viewDistance?viewDistance:3000.0f);//默认半径3公里
		[mapView setRegion:region animated:YES];
	}
	return self;
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		mapView =   [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
		[mapView setZoomEnabled:YES];
		[mapView setScrollEnabled:YES];
		mapView.showsUserLocation = YES;
		mapView.delegate = self;
		[self.view addSubview:mapView];
        
    }
    return self;
}

-(void)searchPathFromCurrentLocation:(NSString*)dest
{
    
	NSString* url = [[NSString alloc] initWithFormat:@"maps://maps.google.com/maps?xyz=xyz&saddr=%f,%f&daddr=%@"
					 ,mapView.userLocation.coordinate.latitude
					 ,mapView.userLocation.coordinate.longitude
					 ,[dest urlEncodedString]];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}




-(void)searchPathToAnnotation:(id<MKAnnotation>)destAnnotation
{
    
    Class itemClass = [MKMapItem class];
    if (itemClass && [itemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)]) { //iOS 6
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:destAnnotation.coordinate addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        mapItem.name = destAnnotation.title;
        
        NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
        MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
        
        [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem] launchOptions:launchOptions];
        
    }else{
        if (destAnnotation.subtitle) {//优先通过annotation显示的地址搜索
            [self searchPathFromCurrentLocation:destAnnotation.subtitle];
        }else if (destAnnotation.coordinate.latitude) {//没有则以annotation的经纬度搜索
            NSString* dest = [[NSString alloc] initWithFormat:@"%f,%f",destAnnotation.coordinate.latitude,destAnnotation.coordinate.longitude];
            [self searchPathFromCurrentLocation:dest];
        }else {//都没有则以店名搜索
            [self searchPathFromCurrentLocation:destAnnotation.title];
        }
    }
    
    
}

#pragma mark -
#pragma mark mapview delegate
/*
 - (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
 {
 
 for (MKPinAnnotationView *mkaview in views)
 {
 if ([mkaview.annotation  isKindOfClass:[MKUserLocation class]]) //用户当前位置的annotation不显示查找路径的按钮
 {
 continue;
 }
 
 
 // All other locations are red with a button
 UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
 mkaview.rightCalloutAccessoryView = button;
 
 }
 }
 
 */

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	LSKMapAnnotation *clickedAnnotation = view.annotation;
	if (clickedAnnotation) {
		[self searchPathToAnnotation:clickedAnnotation];
	}
}


- (MKAnnotationView *)mapView:(MKMapView *)_mapView
			viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
	
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[LSKMapAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView*    pinView = (MKPinAnnotationView*)[_mapView
																 dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
		
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
			pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                      reuseIdentifier:@"CustomPinAnnotation"];
            pinView.pinColor = MKPinAnnotationColorPurple;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
			
			/*
             if([pinView respondsToSelector:@selector(setDraggable:)]){
             pinView.draggable = YES;
             }
             */
			
			
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:
									 UIButtonTypeDetailDisclosure];
            //            [rightButton addTarget:self action:@selector(myShowDetailsMethod:)  forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = rightButton;
			pinView.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeInfoLight];
        }
        else
            pinView.annotation = annotation;
		
        return pinView;
    }
	
    return nil;
}

#pragma mark -

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
}

-(void) viewWillAppear:(BOOL)animated
{
	mapView.frame=self.view.frame;//根据放置的view自适应大小
}
-(void) viewDidAppear:(BOOL)animated
{
    
	[super viewDidAppear:animated];
    
	/*
     if (region.span.latitudeDelta==0) {
     CLLocationCoordinate2D center = mapView.userLocation.coordinate;
     //		CLLocationCoordinate2D center = {31.2351145f,121.4804177f};
     region = MKCoordinateRegionMakeWithDistance(center, viewDistance?viewDistance:3000.0f,viewDistance?viewDistance:3000.0f);//默认3公里
     }else{
     [mapView setRegion:region animated:YES];
	 }
	 
     */
	
	
    
    
    
}



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


- (void)dealloc {
    mapView.delegate = nil;
}


@end




