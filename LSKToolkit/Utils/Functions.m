//
//  Functions.m
//  InnerBand
//
//  Created by John Blanco on 11/15/11.
//  Copyright (c) 2011 Rapture In Venice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Functions.h"

// TYPES

NSNumber *BOX_BOOL(BOOL x) { return [NSNumber numberWithBool:x]; }
NSNumber *BOX_INT(NSInteger x) { return [NSNumber numberWithInt:x]; }
NSNumber *BOX_SHORT(short x) { return [NSNumber numberWithShort:x]; }
NSNumber *BOX_LONG(long x) { return [NSNumber numberWithLong:x]; }
NSNumber *BOX_UINT(NSUInteger x) { return [NSNumber numberWithUnsignedInt:x]; }
NSNumber *BOX_FLOAT(float x) { return [NSNumber numberWithFloat:x]; }
NSNumber *BOX_DOUBLE(double x) { return [NSNumber numberWithDouble:x]; }

BOOL UNBOX_BOOL(NSNumber *x) { return [x boolValue]; }
NSInteger UNBOX_INT(NSNumber *x) { return [x intValue]; }
short UNBOX_SHORT(NSNumber *x) { return [x shortValue]; }
long UNBOX_LONG(NSNumber *x) { return [x longValue]; }
NSUInteger UNBOX_UINT(NSNumber *x) { return [x unsignedIntValue]; }
float UNBOX_FLOAT(NSNumber *x) { return [x floatValue]; }
double UNBOX_DOUBLE(NSNumber *x) { return [x doubleValue]; }

// STRINGIFY

NSString *STRINGIFY_BOOL(BOOL x) { return (x ? @"true" : @"false"); }
NSString *STRINGIFY_INT(NSInteger x) { return [NSString stringWithFormat:@"%i", x]; }
NSString *STRINGIFY_SHORT(short x) { return [NSString stringWithFormat:@"%i", x]; }
NSString *STRINGIFY_LONG(long x) { return [NSString stringWithFormat:@"%li", x]; }
NSString *STRINGIFY_UINT(NSUInteger x) { return [NSString stringWithFormat:@"%u", x]; }
NSString *STRINGIFY_FLOAT(float x) { return [NSString stringWithFormat:@"%f", x]; }
NSString *STRINGIFY_DOUBLE(double x) { return [NSString stringWithFormat:@"%f", x]; }

// BOUNDS

CGRect RECT_WITH_X(CGRect rect, float x) { return CGRectMake(x, rect.origin.y, rect.size.width, rect.size.height); }
CGRect RECT_WITH_Y(CGRect rect, float y) { return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height); }
CGRect RECT_WITH_X_Y(CGRect rect, float x, float y) { return CGRectMake(x, y, rect.size.width, rect.size.height); }

CGRect RECT_WITH_WIDTH_HEIGHT(CGRect rect, float width, float height) { return CGRectMake(rect.origin.x, rect.origin.y, width, height); }
CGRect RECT_WITH_WIDTH(CGRect rect, float width) { return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height); }
CGRect RECT_WITH_HEIGHT(CGRect rect, float height) { return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height); }
CGRect RECT_WITH_HEIGHT_FROM_BOTTOM(CGRect rect, float height) { return CGRectMake(rect.origin.x, rect.origin.y + rect.size.height - height, rect.size.width, height); }

CGRect RECT_INSET_BY_LEFT_TOP_RIGHT_BOTTOM(CGRect rect, float left, float top, float right, float bottom) { return CGRectMake(rect.origin.x + left, rect.origin.y + top, rect.size.width - left - right, rect.size.height - top - bottom); }
CGRect RECT_INSET_BY_TOP_BOTTOM(CGRect rect, float top, float bottom) { return CGRectMake(rect.origin.x, rect.origin.y + top, rect.size.width, rect.size.height - top - bottom); }
CGRect RECT_INSET_BY_LEFT_RIGHT(CGRect rect, float left, float right) { return CGRectMake(rect.origin.x + left, rect.origin.y, rect.size.width - left - right, rect.size.height); }

CGRect RECT_STACKED_OFFSET_BY_X(CGRect rect, float offset) { return CGRectMake(rect.origin.x + rect.size.width + offset, rect.origin.y, rect.size.width, rect.size.height); }
CGRect RECT_STACKED_OFFSET_BY_Y(CGRect rect, float offset) { return CGRectMake(rect.origin.x, rect.origin.y + rect.size.height + offset, rect.size.width, rect.size.height); }

// IMAGES

UIImage *IMAGE(NSString *x) { return [UIImage imageNamed:x]; }

// MATH

double DEG_TO_RAD(double degrees) { return degrees * M_PI / 180.0; }
double RAD_TO_DEG(double radians) { return radians * 180.0 / M_PI; }

NSInteger CONSTRAINED_INT_VALUE(NSInteger val, NSInteger min, NSInteger max) { return MIN(MAX(val, min), max); }
float CONSTRAINED_FLOAT_VALUE(float val, float min, float max) { return MIN(MAX(val, min), max); }
double CONSTRAINED_DOUBLE_VALUE(double val, double min, double max) { return MIN(MAX(val, min), max); }

// COMPARES

BOOL fequal(double a, double b) { return (fabs(a - b) < FLT_EPSILON); }
BOOL fequalf(float a, float b) { return (fabsf(a - b) < FLT_EPSILON); }
BOOL fequalzero(double a) { return (fabs(a) < FLT_EPSILON); }
BOOL fequalzerof(float a) { return (fabsf(a) < FLT_EPSILON); }

// STRINGS

BOOL IS_EMPTY_STRING(NSString *str) { return !str || ![str isKindOfClass:[NSString class]] || [str length] == 0; }
BOOL IS_POPULATED_STRING(NSString *str) { return str && [str isKindOfClass:[NSString class]] && [str length] > 0; }

// DUMPS

NSString *RECT_TO_STR(CGRect r) { return [NSString stringWithFormat:@"X=%0.1f Y=%0.1f W=%0.1f H=%0.1f", r.origin.x, r.origin.y, r.size.width, r.size.height]; }
NSString *POINT_TO_STR(CGPoint p) { return [NSString stringWithFormat:@"X=%0.1f Y=%0.1f", p.x, p.y]; }
NSString *SIZE_TO_STR(CGSize s) { return [NSString stringWithFormat:@"W=%0.1f H=%0.1f", s.width, s.height]; }

// COLORS

float RGB256_TO_COL(NSInteger rgb) { return rgb / 255.0f; }
NSInteger COL_TO_RGB256(float col) { return (NSInteger)(col * 255.0); }

// DIRECTORIES

NSString *DOCUMENTS_DIR(void) { return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]; }

// HARDWARE/DEVICE CAPABILITY

BOOL IS_IPAD(void) {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

BOOL IS_IPHONE(void) {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

BOOL IS_MULTITASKING_AVAILABLE(void) {
    return [[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)] && [[UIDevice currentDevice] isMultitaskingSupported] == YES;
}

BOOL IS_CAMERA_AVAILABLE(void) {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

BOOL IS_GAME_CENTER_AVAILABLE(void) {
    return NSClassFromString(@"GKLocalPlayer") && [[[UIDevice currentDevice] systemVersion] compare:@"4.1" options:NSNumericSearch] != NSOrderedAscending;
}

BOOL IS_EMAIL_ACCOUNT_AVAILABLE(void) {
    Class composerClass = NSClassFromString(@"MFMailComposeViewController");
    return [composerClass respondsToSelector:@selector(canSendMail)];
}

BOOL IS_GPS_ENABLED(void) {
    return IS_GPS_ENABLED_ON_DEVICE() && IS_GPS_ENABLED_FOR_APP();
}

BOOL IS_GPS_ENABLED_ON_DEVICE(void) {
    BOOL isLocationServicesEnabled;
    
    Class locationClass = NSClassFromString(@"CLLocationManager");
    NSMethodSignature *signature = [locationClass instanceMethodSignatureForSelector:@selector(locationServicesEnabled)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation invoke];
    [invocation getReturnValue:&isLocationServicesEnabled];
    
    return locationClass && isLocationServicesEnabled;    
}

BOOL IS_GPS_ENABLED_FOR_APP(void) {
    // for 4.2+ only, we can check down to the app level
    #ifdef kCLAuthorizationStatusAuthorized
        Class locationClass = NSClassFromString(@"CLLocationManager");
    
        if ([locationClass respondsToSelector:@selector(authorizationStatus)]) {
            NSInteger authorizationStatus;
            
            NSMethodSignature *signature = [locationClass instanceMethodSignatureForSelector:@selector(authorizationStatus)];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            
            [invocation invoke];
            [invocation getReturnValue:&authorizationStatus];
            
            return locationClass && (authorizationStatus == kCLAuthorizationStatusAuthorized);    
        }
    #endif
    
    // we can't know this
    return YES;
}

// DISPATCHERS

void DISPATCH_TO_MAIN_QUEUE(BOOL isAsync, void (^block)()) {
    if (isAsync) {
        dispatch_async(dispatch_get_main_queue(), block);
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);        
    }
}

void DISPATCH_TO_GLOBAL_QUEUE(dispatch_queue_priority_t priority, BOOL isAsync, void (^block)()) {
    if (isAsync) {    
        dispatch_async(dispatch_get_global_queue(priority, 0), block);
    } else {
        dispatch_sync(dispatch_get_global_queue(priority, 0), block);        
    }
}

void DISPATCH_TO_CURRENT_QUEUE(BOOL isAsync, void (^block)()) {
    if (isAsync) {    
        dispatch_async(dispatch_get_current_queue(), block);
    } else {
        dispatch_sync(dispatch_get_current_queue(), block);        
    }
}

void DISPATCH_TO_QUEUE(dispatch_queue_t queue, BOOL isAsync, void (^block)()) {
    if (isAsync) {    
        dispatch_async(queue, block);
    } else {
        dispatch_sync(queue, block);
    }
}

void DISPATCH_TO_MAIN_QUEUE_AFTER(NSTimeInterval delay, void (^block)()) {
    dispatch_time_t runTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(runTime, dispatch_get_main_queue(), block);
}

void DISPATCH_TO_GLOBAL_QUEUE_AFTER(NSTimeInterval delay, dispatch_queue_priority_t priority, void (^block)()) {
    dispatch_time_t runTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(runTime, dispatch_get_global_queue(priority, 0), block);
}

void DISPATCH_TO_CURRENT_QUEUE_AFTER(NSTimeInterval delay, void (^block)()) {
    dispatch_time_t runTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(runTime, dispatch_get_current_queue(), block);
}

void DISPATCH_TO_QUEUE_AFTER(NSTimeInterval delay, dispatch_queue_t queue, void (^block)()) {
    dispatch_time_t runTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(runTime, queue, block);
}
