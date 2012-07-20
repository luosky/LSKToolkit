//
//  ConstantUtils.h
//  RenjianLib
//
//  Created by luosky on 1/28/11.
//  Copyright 2011 renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PagedResult.h"

#define INT_NUM(i) [NSNumber numberWithInt:i]
#define FLOAT_NUM(f) [NSNumber numberWithFloat:f]
#define IS_NOT_BLANK_STR(str) str && [str isKindOfClass:[NSString class]] && [str length] > 0


//for MKNetwork
typedef void (^LSKArrayBlock)(NSArray* ary, BOOL isCache);
typedef void (^LSKPagedResultBlock)(PagedResult *result, BOOL isCache);


#define HEIGHT_WIHTOUT_NAV_AND_TAB_BAR 367
#define CONSTANT_STATUS_BAR_HEIGHT	20
#define CONSTANT_NAVIGATION_BAR_HEIGHT	44
#define CONSTANT_TAB_BAR_HEIGHT	49
#define CONSTANT_TOOL_BAR_HEIGHT	44
#define SCREEN_WIDTH			320

#define FONT_SIZE_BIG			16
#define FONT_SIZE_MIDDLE		14
#define FONT_SIZE_SMALL			10

#define OUTTER_MARGIN   15
#define DEFAULT_MARGIN  10
#define INNER_MARGIN   5

#define CELL_OUTTER_MARGIN		10
#define CELL_INNER_MARGIN		3
#define CELL_IMAGE_PADDING       10

#define CELL_WIDTH				320
#define CELL_ACTUAL_WIDTH		(CELL_WIDTH - CELL_OUTTER_MARGIN * 2)
#define CELL_TIME_WIDTH			50
#define CELL_LITTLE_ICON_WIDTH	15
#define CELL_AVATAR_IMAGE_WIDTH	48
#define CELL_AVATAR_WIDTH		(CELL_AVATAR_IMAGE_WIDTH + CELL_IMAGE_PADDING * 2)
#define CELL_CONTENT_WIDTH		(CELL_ACTUAL_WIDTH - CELL_AVATAR_WIDTH - CELL_INNER_MARGIN * 2)

#define CELL_MINI_HEIGHT		(CELL_IMAGE_PADDING * 2 + CELL_AVATAR_IMAGE_WIDTH +CELL_INNER_MARGIN * 2 + FONT_SIZE_SMALL)
#define CELL_CONTENT_MINI_HEIGHT		(CELL_MINI_HEIGHT - CELL_INNER_MARGIN * 3 - FONT_SIZE_BIG)


@interface LSKConstants : NSObject {
}

//LocationCenter 通知频道
extern NSString * const kLocationCenterUpdateLocationReceived;
extern NSString * const kLocationCenterUpdateLocationUpdated;
extern NSString * const kLocationCenterUpdateLocationFailed;

//
extern NSString * const kApplicationDidBecomeActiveNotification;

@end
