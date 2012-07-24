//
//  SMSSender.m
//  aizheke
//
//  Created by Luosky on 12-6-29.
//
//

#import "LSKSMSSender.h"
#import "SVProgressHUD.h"

@implementation LSKSMSSender

-(void)presentSMSComposerWithContent:(NSString*)content atController:(UIViewController<MFMessageComposeViewControllerDelegate>*) controller{
    [self presentSMSComposerWithContent:content recipient:nil atController:controller];
}

-(void)presentSMSComposerWithContent:(NSString*)content recipient:(NSString*)recipient atController:(UIViewController<MFMessageComposeViewControllerDelegate>*) controller{
    NSArray *recipients = [NSArray arrayWithObject:recipient];
    [self presentSMSComposerWithContent:content recipients:recipients atController:controller];    
}

-(void)presentSMSComposerWithContent:(NSString*)content recipients:(NSArray*)recipients atController:(UIViewController<MFMessageComposeViewControllerDelegate>*) controller{

    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));

    if (messageClass != nil) {
        if ([messageClass canSendText]) {
            MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
            /*
             [picker onDidFinishWithResult:^(MFMessageComposeViewController *controller, MessageComposeResult result) {
             LOG_FUNCTION();
             LOG_EXPR(@"fffwefwe");
             switch (result)
             {
             case MessageComposeResultCancelled:
             LOG_EXPR(@"Result: SMS sending canceled");
             break;
             case MessageComposeResultSent:
             LOG_EXPR(@"Result: SMS sent");
             break;
             case MessageComposeResultFailed:
             [SVProgressHUD show];
             [SVProgressHUD dismissWithError:@"短信发送失败" afterDelay:2];
             break;
             default:
             LOG_EXPR(@"Result: SMS not sent");
             break;
             }
             [controller dismissModalViewControllerAnimated:YES];
             
             }];
             */
            //            picker.messageComposeDelegate = self; //delegate必须设成present的controller,否则接收不到回调
            picker.messageComposeDelegate = controller;
            picker.body=content;
            if (recipients)
                picker.recipients = recipients;
            [controller presentModalViewController:picker animated:YES];
            return;
        }
        else {
            [SVProgressHUD show];
            [SVProgressHUD dismissWithError:@"设备没有短信功能" afterDelay:2];
        }
    }
    else {
        [SVProgressHUD show];
        [SVProgressHUD dismissWithError:@"iOS版本过低,iOS4.0以上才支持程序内发送短信" afterDelay:2];
    }
}


#pragma mark MFMessageComposeViewControllerDelegate delegate

/*
 - (void)messageComposeViewController:(MFMessageComposeViewController *)controller
 didFinishWithResult:(MessageComposeResult)result {
 
 switch (result)
 {
 case MessageComposeResultCancelled:
 break;
 case MessageComposeResultSent:
 break;
 case MessageComposeResultFailed:
 [SVProgressHUD show];
 [SVProgressHUD dismissWithError:@"短信发送失败" afterDelay:2];
 break;
 default:
 break;
 }
 [controller dismissModalViewControllerAnimated:YES];
 }
 */


@end
