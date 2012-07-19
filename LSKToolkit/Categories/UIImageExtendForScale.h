//
//  UIImageExtendForScale.h
//  RenjianLib
//
//  Created by luosky on 1/27/11.
//  Copyright 2011 renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (UIImageExtendForScale)
- (UIImage*)scaleAndRotateImage:(float)maxResolution;
-(BOOL)isNeedToScaleForMaxWidth:(float)maxWidth maxHeight:(float)maxHeight;
@end
