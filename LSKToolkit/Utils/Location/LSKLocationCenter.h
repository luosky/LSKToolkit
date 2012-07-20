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
    


}

@property (nonatomic,strong)    CLLocationManager*  locationManager;
@property (nonatomic,assign)    Boolean             isUpdating;
@property (nonatomic,strong)    CLLocation*         location;
@property (nonatomic,strong)    CLLocation*         lastLocation;
@property (nonatomic,strong)    NSTimer*            timer;
+ (void) updateLocation;
+ (LSKLocationCenter*)sharedInstance;
- (void) getCurrentLocation;

@end

