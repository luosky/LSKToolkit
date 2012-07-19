//
//  LocationManager.h
//  iRenjian
//
//  Created by luosky on 9/3/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LSKLocationCenter : NSObject <CLLocationManagerDelegate> {
    
    CLLocation*         location;
    NSTimer*            timer;
    CLLocationManager*  locationManager;
    
}

@property (nonatomic,retain)    CLLocationManager*  locationManager;
@property (nonatomic,assign)    Boolean             isUpdating;
@property (nonatomic,retain)    CLLocation*         lastLocation;
+ (void) updateLocation;
+ (LSKLocationCenter*)sharedInstance;
- (void) getCurrentLocation;

@end

