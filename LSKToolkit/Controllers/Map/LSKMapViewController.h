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

/*
 MKAnnotation 优先查找MKAnnotation里的subtitile(最好放地址), 若没有则搜索MKAnnotation里的coordinate, 若都没有则搜索title(可以放店名).
 */
-(void)searchPathToAnnotation:(id<MKAnnotation>)destAnnotation;

@end




