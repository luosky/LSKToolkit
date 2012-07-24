//
//  SMSSender.h
//  aizheke
//
//  Created by Luosky on 12-6-29.
//
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface LSKSMSSender : NSObject
-(void)presentSMSComposerWithContent:(NSString*)content atController:(UIViewController<MFMessageComposeViewControllerDelegate>*) controller;
-(void)presentSMSComposerWithContent:(NSString*)content recipient:(NSString*)recipient atController:(UIViewController<MFMessageComposeViewControllerDelegate>*) controller;
-(void)presentSMSComposerWithContent:(NSString*)content recipients:(NSArray*)recipients atController:(UIViewController<MFMessageComposeViewControllerDelegate>*) controller;
@end
