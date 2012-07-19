//
//  CustomAlertView.h
//  aizheke_html
//
//  Created by Luosky on 11-4-11.
//  Copyright 2011年 Renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LSKCustomAlertView : UIAlertView {
    
}
+ (void) setBackgroundColor:(UIColor *) background
            withStrokeColor:(UIColor *) stroke;

+(LSKCustomAlertView*)quickCustomAlertWithTitle:(NSString*) title
                                messageTitle:(NSString*) message 
                                dismissTitle:(NSString*) dismissButtonTitle 
                            withActivityView:(BOOL)showActivityView;
@end
