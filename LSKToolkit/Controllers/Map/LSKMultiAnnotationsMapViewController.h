//
//  MultiAnnotationsMapViewController.h
//  RenjianLib
//
//  Created by luosky on 1/5/11.
//  Copyright 2011 renjian.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSKMapViewController.h"

@interface LSKMultiAnnotationsMapViewController : LSKMapViewController {
//  NSOperationQueue *queue;
}

- (void) updateAnnotationsOnRegion: (MKCoordinateRegion) currentRegion;
@end
