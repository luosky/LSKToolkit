//
//  MapAnnotation.m
//  Eden
//
//  Created by luosky on 12/14/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import "LSKMapAnnotation.h"


@implementation LSKMapAnnotation

@synthesize subtitle = _subtitle;
@synthesize title = _title;
@synthesize coordinate = _coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
	if (self=[super init]) {
		self.coordinate = coordinate;
	}
	return self;
}

@end




