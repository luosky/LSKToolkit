//
//  UIView+Utils.h
//  aizheke_html
//
//  Created by Luosky on 11-7-15.
//  Copyright 2011年 Renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIView (UIView_Utils)

-(void)moveViewWithDeltaY:(float)deltaY;
-(void)moveViewWithDeltaX:(float)delta;
-(void)moveViewWithDeltaY:(float)deltaY deltaX:(float)deltaX;

-(void)moveViewToX:(float)x y:(float)y;
-(void)moveViewToX:(float)x;
-(void)moveViewToY:(float)y;

-(void)changeSizeWithDeltaHeigh:(float)deltaHeigh;
-(void)changeSizeWithDeltaHeigh:(float)deltaHeigh deltaWidth:(float)deltaWidth;

-(void)changeWidthTo:(CGFloat)width;
-(void)changeHeightTo:(CGFloat)height;
-(void)changeSizeTo:(CGSize)size;
@end

@interface UIButton(scale)
- (void) scaleWidth;
- (void) scaleWidthWithPadding:(CGFloat) padding;
@end

@interface UILabel (UILabel_Utils)

- (void)alignTop;
- (void)alignBottom;

- (void) scaleWithContent;
- (void) scaleHorizontalWithMiniWidth:(CGFloat) miniWidth;
- (void) scaleHorizontalWithMiniWidth:(CGFloat) miniWidth maxWidth:(CGFloat) maxWidth;
- (void) scaleWithConstrainedSize:(CGSize) constrainedSize miniHeight:(CGFloat) miniHeight;
@end