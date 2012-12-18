//
//  LocationManager.m
//  iRenjian
//
//  Created by luosky on 9/3/10.
//  Copyright 2010 renjian.com. All rights reserved.
//


#import "LSKLocationCenter.h"
#import "SVProgressHUD.h"
#import "LSKConstants.h"
//static	CLLocationManager*  _locationManager;

#define GPS_TIMEOUT_TIME        20.0
#define GPS_ACCURACY_THRESHOLD  1000.0

static LSKLocationCenter* sharedCLDelegate = nil;

@implementation LSKLocationCenter
@synthesize lastLocation,location;
@synthesize locationManager,isUpdating;
@synthesize timer;


//LocationCenter 通知频道
NSString * const kLocationCenterUpdateLocationReceived = @"kLocationCenterUpdateLocationReceived";
NSString * const kLocationCenterUpdateLocationUpdated = @"kLocationCenterUpdateLocationUpdated";
NSString * const kLocationCenterUpdateLocationFailed = @"kLocationCenterUpdateLocationFailed";

- (id)init
{
 	self = [super init];
	if (self != nil) {
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.delegate = self;
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
	}
	return self;
}

- (void)dealloc
{
    if (timer)    [timer invalidate];
    
    [locationManager stopUpdatingHeading];
    [locationManager stopUpdatingLocation];
	locationManager.delegate = nil;
}

#pragma mark -
#pragma mark Singleton Object Methods

+ (LSKLocationCenter*)sharedInstance {
    @synchronized(self) {
        if (sharedCLDelegate == nil) {
            sharedCLDelegate = [[self alloc] init];
        }
    }
    return sharedCLDelegate;
}
/*
 + (id)allocWithZone:(NSZone *)zone {
 @synchronized(self) {
 if (sharedCLDelegate == nil) {
 sharedCLDelegate = [super allocWithZone:zone];
 return sharedCLDelegate;  // assignment and return on first allocation
 }
 }
 return nil; // on subsequent allocation attempts return nil
 }
 
 - (id)copyWithZone:(NSZone *)zone
 {
 return self;
 }
 
 - (id)retain {
 return self;
 }
 
 - (unsigned)retainCount {
 return UINT_MAX;  // denotes an object that cannot be released
 }
 
 - (oneway void)release {
 //do nothing
 }
 
 - (id)autorelease {
 return self;
 }
 */

#pragma mark -  Interface Methods

+ (void) updateLocation{
    [[self sharedInstance] updateLocation];
}

- (void)updateLocation
{
    isUpdating = YES;
    [self.timer invalidate];
    self.timer = nil;
    [[self locationManager] startUpdatingLocation];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:GPS_TIMEOUT_TIME
                                                  target:self
                                                selector:@selector(locationManagerDidTimeout:userInfo:)
                                                userInfo:nil
                                                 repeats:false];
}

#pragma mark -
- (void)stopUpdate
{
    [[self locationManager ] stopUpdatingLocation];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    isUpdating = NO;
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    
    self.lastLocation = newLocation;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    //一获取到地址即发布Updated通知
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:kLocationCenterUpdateLocationUpdated object:newLocation];
    
    self.location=newLocation;
	
    //数据是最近5分钟且精确度合乎要求后发布Received通知
    if (abs(howRecent) < 300 && [newLocation horizontalAccuracy] < GPS_ACCURACY_THRESHOLD) {
        [self.timer invalidate];
        self.timer = nil;
        [manager stopUpdatingLocation];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        @synchronized(self){
            if (isUpdating) {
                [nc postNotificationName:kLocationCenterUpdateLocationReceived object:newLocation];
                isUpdating = NO;
            }
        }
    }
}

- (void)locationManagerDidTimeout:(NSTimer*)aTimer
                         userInfo:(id)userInfo
{
    self.timer = nil;
    [self stopUpdate];
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    if (location) {
        NSDate* eventDate = location.timestamp;
        NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
        self.location = nil;
        if ([location horizontalAccuracy] < 10000 && abs(howRecent) < GPS_TIMEOUT_TIME + 5.0) {
            [nc postNotificationName:kLocationCenterUpdateLocationReceived object:location];
            return;
        }
        
    }
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD dismissWithError:@"无法获取地理位置" afterDelay:2];
    
    [nc postNotificationName:kLocationCenterUpdateLocationFailed object:@"请求超时"];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [self stopUpdate];
    
    if (!([error code] == kCLErrorDenied && [[error domain] isEqualToString:kCLErrorDomain])) {
		//if (!([error code] == kCLErrorDenied )) {
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
        [SVProgressHUD dismissWithError:@"无法获取地理位置" afterDelay:2];
    }
    else if ([error code] == kCLErrorLocationUnknown) {
        // Ignore this error and keep tracking
        return;
    }
	
    [self.timer invalidate];
    self.timer = nil;
    self.location = nil;
    
    
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:kLocationCenterUpdateLocationFailed object:@"获取位置出错"];
    
    
}

@end
