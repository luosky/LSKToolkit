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


//LocationCenter 通知频道
extern NSString * const kLocationCenterUpdateLocationReceived;     //数据是最近5分钟且精确度合乎要求后发布Received通知
extern NSString * const kLocationCenterUpdateLocationUpdated;     //一获取到地址即发布Updated通知
extern NSString * const kLocationCenterUpdateLocationFailed;


@property (nonatomic,strong)    CLLocationManager*  locationManager;
@property (nonatomic,assign)    Boolean             isUpdating;
@property (nonatomic,strong)    CLLocation*         location;
@property (nonatomic,strong)    CLLocation*         lastLocation;
@property (nonatomic,strong)    NSTimer*            timer;
+ (void) updateLocation;
- (void) updateLocation;
+ (LSKLocationCenter*)sharedInstance;
@end

