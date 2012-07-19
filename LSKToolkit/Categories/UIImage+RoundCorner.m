//
//  UIImage+RoundCorner.m
//  RenjianLib
//
//  Created by Luosky on 11-4-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIImage+RoundCorner.h"
#import "UIImageExtendForScale.h"

@implementation UIImage (UIImage_RoundCorner)

-(UIImage*) roundCornerWithPixel:(float)numPixels radius:(float)radius{

//    float numPixels = (r.location != NSNotFound) ? 73.0 : 48.0;
//    float radius = (r.location != NSNotFound) ? 8.0 : 4.0;

    UIGraphicsBeginImageContext(CGSizeMake(numPixels, numPixels));
    CGContextRef c = UIGraphicsGetCurrentContext();

    CGContextBeginPath(c);
    CGContextMoveToPoint  (c, numPixels, numPixels/2);
    CGContextAddArcToPoint(c, numPixels, numPixels, numPixels/2, numPixels,   radius);
    CGContextAddArcToPoint(c, 0,         numPixels, 0,           numPixels/2, radius);
    CGContextAddArcToPoint(c, 0,         0,         numPixels/2, 0,           radius);
    CGContextAddArcToPoint(c, numPixels, 0,         numPixels,   numPixels/2, radius);
    CGContextClosePath(c);

    CGContextClip(c);

    [[self scaleAndRotateImage:numPixels] drawAtPoint:CGPointZero];
    UIImage *converted = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return converted;
}
@end
