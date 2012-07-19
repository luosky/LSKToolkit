//
//  MailSender.h
//  aizheke
//
//  Created by Luosky@gmail.com on 11-12-30.
//  Copyright (c) 2011年 Renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
@interface LSKMailSender : NSObject
-(void)presentMailComposerWithContent:(NSString*)content  subject:(NSString*)subject atController:(UIViewController<MFMailComposeViewControllerDelegate>*) controller;
@end
