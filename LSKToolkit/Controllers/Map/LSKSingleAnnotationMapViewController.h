//
//  SingleAnnotationMapViewController.h
//  RenjianLib
//
//  Created by luosky on 1/5/11.
//  Copyright 2011 renjian.com. All rights reserved.
//

#import "LSKMapViewController.h"
#import "LSKMapAnnotation.h"


@interface LSKSingleAnnotationMapViewController : LSKMapViewController {
	LSKMapAnnotation*	annotation;
}

@property (nonatomic, strong) LSKMapAnnotation *annotation;

-(void)searchPathToAnnotation;

@end
