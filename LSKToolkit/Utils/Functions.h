//
//  Functions.h
//  InnerBand
//
//  Created by John Blanco on 11/15/11.
//  Copyright (c) 2011 Rapture In Venice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <CoreMotion/CoreMotion.h>

// TYPES

NSNumber *BOX_BOOL(BOOL x);
NSNumber *BOX_INT(NSInteger x);
NSNumber *BOX_SHORT(short x);
NSNumber *BOX_LONG(long x);
NSNumber *BOX_UINT(NSUInteger x);
NSNumber *BOX_FLOAT(float x);
NSNumber *BOX_DOUBLE(double x);

BOOL UNBOX_BOOL(NSNumber *x);
NSInteger UNBOX_INT(NSNumber *x);
short UNBOX_SHORT(NSNumber *x);
long UNBOX_LONG(NSNumber *x);
NSUInteger UNBOX_UINT(NSNumber *x);
float UNBOX_FLOAT(NSNumber *x);
double UNBOX_DOUBLE(NSNumber *x);

// STRINGIFY

NSString *STRINGIFY_BOOL(BOOL x);
NSString *STRINGIFY_INT(NSInteger x);
NSString *STRINGIFY_SHORT(short x);
NSString *STRINGIFY_LONG(long x);
NSString *STRINGIFY_UINT(NSUInteger x);
NSString *STRINGIFY_FLOAT(float x);
NSString *STRINGIFY_DOUBLE(double x);

// BOUNDS

CGRect RECT_WITH_X(CGRect rect, float x);
CGRect RECT_WITH_Y(CGRect rect, float y);
CGRect RECT_WITH_X_Y(CGRect rect, float x, float y);

CGRect RECT_WITH_WIDTH_HEIGHT(CGRect rect, float width, float height);
CGRect RECT_WITH_WIDTH(CGRect rect, float width);
CGRect RECT_WITH_HEIGHT(CGRect rect, float height);
CGRect RECT_WITH_HEIGHT_FROM_BOTTOM(CGRect rect, float height);

CGRect RECT_INSET_BY_LEFT_TOP_RIGHT_BOTTOM(CGRect rect, float left, float top, float right, float bottom);
CGRect RECT_INSET_BY_TOP_BOTTOM(CGRect rect, float top, float bottom);
CGRect RECT_INSET_BY_LEFT_RIGHT(CGRect rect, float left, float right);

CGRect RECT_STACKED_OFFSET_BY_X(CGRect rect, float offset);
CGRect RECT_STACKED_OFFSET_BY_Y(CGRect rect, float offset);

// IMAGES

UIImage *IMAGE(NSString *x);

// MATH

double DEG_TO_RAD(double degrees);
double RAD_TO_DEG(double radians);

NSInteger CONSTRAINED_INT_VALUE(NSInteger val, NSInteger min, NSInteger max);
float CONSTRAINED_FLOAT_VALUE(float val, float min, float max);
double CONSTRAINED_DOUBLE_VALUE(double val, double min, double max);

// COMPARES

BOOL fequal(double a, double b);
BOOL fequalf(float a, float b);
BOOL fequalzero(double a);
BOOL fequalzerof(float a);

// STRINGS

BOOL IS_EMPTY_STRING(NSString *str);
BOOL IS_POPULATED_STRING(NSString *str);

// DUMPS

NSString *RECT_TO_STR(CGRect r);
NSString *POINT_TO_STR(CGPoint p);
NSString *SIZE_TO_STR(CGSize s);

// COLORS

float RGB256_TO_COL(NSInteger rgb);
NSInteger COL_TO_RGB256(float col);

// DIRECTORIES

NSString *DOCUMENTS_DIR(void);

// HARDWARE/DEVICE CAPABILITY

BOOL IS_IPAD(void);
BOOL IS_IPHONE(void);

BOOL IS_MULTITASKING_AVAILABLE(void);
BOOL IS_CAMERA_AVAILABLE(void);
BOOL IS_GAME_CENTER_AVAILABLE(void);
BOOL IS_EMAIL_ACCOUNT_AVAILABLE(void);
BOOL IS_GPS_ENABLED(void);
BOOL IS_GPS_ENABLED_ON_DEVICE(void);
BOOL IS_GPS_ENABLED_FOR_APP(void);

// DISPATCHERS

void DISPATCH_TO_MAIN_QUEUE(BOOL isAsync, void (^block)());
void DISPATCH_TO_GLOBAL_QUEUE(dispatch_queue_priority_t priority, BOOL isAsync, void (^block)());
void DISPATCH_TO_CURRENT_QUEUE(BOOL isAsync, void (^block)());
void DISPATCH_TO_QUEUE(dispatch_queue_t queue, BOOL isAsync, void (^block)());
void DISPATCH_TO_MAIN_QUEUE_AFTER(NSTimeInterval delay, void (^block)());
void DISPATCH_TO_GLOBAL_QUEUE_AFTER(NSTimeInterval delay, dispatch_queue_priority_t priority, void (^block)());
void DISPATCH_TO_CURRENT_QUEUE_AFTER(NSTimeInterval delay, void (^block)());
void DISPATCH_TO_QUEUE_AFTER(NSTimeInterval delay, dispatch_queue_t queue, void (^block)());
