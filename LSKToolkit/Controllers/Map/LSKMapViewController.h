//
//  MapViewController.h
//  Eden
//
//  Created by luosky on 12/14/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface LSKMapViewController : UIViewController <MKMapViewDelegate> {
	MKMapView*	mapView;
	MKCoordinateRegion region;
	float viewDistance;
}

@property (nonatomic, assign) MKCoordinateRegion region;
@property (nonatomic, assign) float viewDistance;
@property (nonatomic, strong) MKMapView *mapView;

-(id)initWithCenter:(CLLocationCoordinate2D)mapCenter viewDistance:(float)distance;
-(void)searchPathFromCurrentLocation:(NSString*)dest;
-(void)searchPathToAnnotation:(id<MKAnnotation>)destAnnotation;

@end




