//
//  UIView+Utils.m
//  aizheke_html
//
//  Created by Luosky on 11-7-15.
//  Copyright 2011年 Renjian.com. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (UIView_Utils)

-(void)moveViewWithDeltaY:(float)deltaY{
    [self moveViewWithDeltaY:deltaY deltaX:0];
}

-(void)moveViewWithDeltaX:(float)delta{
    [self moveViewWithDeltaY:0 deltaX:delta];
}

-(void)moveViewWithDeltaY:(float)deltaY deltaX:(float)deltaX{
    CGPoint  currentCenter = self.center;
    currentCenter.x += deltaX;
    currentCenter.y += deltaY;
    self.center = currentCenter;
}

-(void)moveViewToX:(float)x y:(float)y{
    CGRect frame = self.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    self.frame = frame;
}

-(void)moveViewToX:(float)x{
    [self moveViewToX:x y:self.frame.origin.y];
}

-(void)moveViewToY:(float)y{
    [self moveViewToX:self.frame.origin.x y:y];
}

-(void)changeSizeWithDeltaHeigh:(float)deltaHeigh{
    [self changeSizeWithDeltaHeigh:deltaHeigh deltaWidth:0];
}
-(void)changeSizeWithDeltaHeigh:(float)deltaHeigh deltaWidth:(float)deltaWidth{
    CGRect currentFrame = self.frame;
    currentFrame.size.height += deltaHeigh;
    currentFrame.size.width += deltaWidth;
    self.frame = currentFrame;
}

-(void)changeWidthTo:(CGFloat)width{
    [self changeSizeTo:CGSizeMake(width, self.frame.size.height)];
}

-(void)changeHeightTo:(CGFloat)height{
    [self changeSizeTo:CGSizeMake(self.frame.size.width,height)];
}

-(void)changeSizeTo:(CGSize)size{
    CGRect currentFrame = self.frame;
    currentFrame.size = size;
    self.frame = currentFrame;
}

@end

@implementation UIButton(scale)

- (void) scaleWidth
{
    [self scaleWidthWithPadding:self.frame.size.height];
}

- (void) scaleWidthWithPadding:(CGFloat) padding
{
    CGRect currentFrame = self.frame;
    currentFrame.size.width = [self.titleLabel.text sizeWithFont:self.titleLabel.font constrainedToSize:CGSizeMake(9999, self.frame.size.height) lineBreakMode:self.titleLabel.lineBreakMode].width + padding;
    self.frame = currentFrame;
}

- (CGFloat) scaleHeight{
    CGFloat originalHeight = self.titleLabel.bounds.size.height;
    [self.titleLabel scaleWithContent];
    CGFloat deltaHeight = self.titleLabel.bounds.size.height - originalHeight;
    CGRect currentFrame = self.frame;
    currentFrame.size.height += deltaHeight;
    self.frame = currentFrame;
    return deltaHeight;
}
@end


@implementation UILabel (UILabel_Utils)

- (void) scaleWithContent{
    
    [self scaleWithConstrainedSize:CGSizeMake(self.frame.size.width, 9999) miniHeight:self.frame.size.height];
}

- (void) scaleWithConstrainedSize:(CGSize) constrainedSize miniHeight:(CGFloat) miniHeight {
    self.numberOfLines = 0;//显示所有行
    CGRect currentFrame = self.frame;
    currentFrame.size.height = [self.text sizeWithFont:self.font constrainedToSize:constrainedSize lineBreakMode:self.lineBreakMode].height;
    if (CGRectGetHeight(currentFrame) < miniHeight) {
        currentFrame.size.height = miniHeight;
    }
    self.frame = currentFrame;
}

- (void) scaleHorizontalWithMiniWidth:(CGFloat) miniWidth {
    self.numberOfLines = 1;
    CGRect currentFrame = self.frame;
    currentFrame.size.width = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(9999, self.frame.size.height) lineBreakMode:self.lineBreakMode].width;
    if (CGRectGetWidth(currentFrame) < miniWidth) {
        currentFrame.size.width = miniWidth;
    }
    self.frame = currentFrame;
}

- (void) scaleHorizontalWithMiniWidth:(CGFloat) miniWidth maxWidth:(CGFloat) maxWidth{
    self.numberOfLines = 1;
    CGRect currentFrame = self.frame;
    currentFrame.size.width = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(9999, self.frame.size.height) lineBreakMode:self.lineBreakMode].width;
    if (CGRectGetWidth(currentFrame) < miniWidth) {
        currentFrame.size.width = miniWidth;
    }
    if (CGRectGetWidth(currentFrame) > maxWidth) {
        currentFrame.size.width = maxWidth;
    }
    self.frame = currentFrame;
}

- (void)alignTop {
    CGSize fontSize = [self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [self.text stringByAppendingString:@"\n "];
}

- (void)alignBottom {
    CGSize fontSize = [self.text sizeWithFont:self.font];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;    //expected width of label
    CGSize theStringSize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(finalWidth, finalHeight) lineBreakMode:self.lineBreakMode];
    int newLinesToPad = (finalHeight  - theStringSize.height) / fontSize.height;
    for(int i=0; i<newLinesToPad; i++)
        self.text = [NSString stringWithFormat:@" \n%@",self.text];
}

@end