//
//  MailSender.m
//  aizheke
//
//  Created by Luosky@gmail.com on 11-12-30.
//  Copyright (c) 2011年 Renjian.com. All rights reserved.
//

#import "LSKMailSender.h"
#import "SVProgressHUD.h"
@implementation LSKMailSender


-(void)presentMailComposerWithContent:(NSString*)content  subject:(NSString*)subject atController:(UIViewController<MFMailComposeViewControllerDelegate>*) controller{
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
	if (mailClass != nil) {
		if ([mailClass canSendMail]) {
            MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
            picker.mailComposeDelegate = controller;
            
            [picker setSubject:subject];
            [picker setMessageBody:content isHTML:YES];
            
            [controller presentModalViewController:picker animated:YES];
		}
		else {
            [SVProgressHUD show];
            [SVProgressHUD dismissWithError:@"设备尚未配置邮件发送服务,请在设备的设置里配置邮件服务" afterDelay:2];
		}
	}
	else {
        [SVProgressHUD show];
        [SVProgressHUD dismissWithError:@"iOS版本过低,iOS3.0以上才支持程序内发送邮件" afterDelay:2];
	}
}


@end
