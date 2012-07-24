//
//  MapAnnotation.h
//  Eden
//
//  Created by luosky on 12/14/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LSKMapAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D	_coordinate;
	NSString*				_title;
	NSString*				_subtitle;
}

@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
@end


