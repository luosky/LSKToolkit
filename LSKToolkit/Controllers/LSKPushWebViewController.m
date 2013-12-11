//
//  LSKPushWebViewController.m
//  LSKToolkit
//
//  Created by Luosky on 12-7-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LSKPushWebViewController.h"
#import "NSURLRequest+Parameters.h"
@interface LSKPushWebViewController ()

@end

@implementation LSKPushWebViewController


#pragma mark shouldStartLoadWithRequest


// if you need to intercept some request and display a native interface instead, override this methods to display it and return RequestShouldStartLoadingResultNo so that a blank web page won't be present.
- (RequestShouldStartLoadingResult)interceptRequest:(NSURLRequest*)request{
    return RequestShouldStartLoadingResultUndetermined;
}

- (id)buildNewPushController
{
    return [[[self class] alloc] initWithNibName:nil bundle:nil];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *absolute_url_string = request.URL.absoluteString;
    NSString *scheme = request.URL.scheme;
//    NSString *path = request.URL.path;
//    NSString *host = request.URL.host;
//    NSString *method = request.HTTPMethod;
    NSDictionary *parameters = [request parameterDictionary];
    
    RequestShouldStartLoadingResult result = RequestShouldStartLoadingResultUndetermined;
    
    result = [self interceptRequest:request];
    
    if (result == RequestShouldStartLoadingResultUndetermined) {
        if ([[parameters objectForKey:@"need_push"] boolValue]) {
            LSKPushWebViewController *detail = [self buildNewPushController];
            NSMutableString *targetUrl = [NSMutableString stringWithString:absolute_url_string];
            [targetUrl replaceOccurrencesOfString:@"need_push=true" withString:@"1=1" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [targetUrl length])];
            [detail loadUrlString:targetUrl];
            [self.navigationController pushViewController:detail animated:YES];
            result = RequestShouldStartLoadingResultNo;
            
        }else if(![scheme isEqualToString:@"http"] && ![scheme isEqualToString:@"https"] ){
            if (navigationType == UIWebViewNavigationTypeLinkClicked || navigationType == UIWebViewNavigationTypeOther) {
                [[UIApplication sharedApplication] openURL:request.URL];
                result = RequestShouldStartLoadingResultNo;
            }
        }
        else{
            result = RequestShouldStartLoadingResultYes;
        }
    }
    
    if (result == RequestShouldStartLoadingResultNo)
        return NO;
    else
        return YES;
}

@end
