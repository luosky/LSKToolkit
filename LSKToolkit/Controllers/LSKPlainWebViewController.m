//
//  PlainWebViewController.m
//  aizheke
//
//  Created by Luosky on 12-5-24.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "LSKPlainWebViewController.h"
#import "MBProgressHUD.h"
#import "SVProgressHUD.h"
#import "LSKConstants.h"
#import "UIColor+Expanded.h"

@interface LSKPlainWebViewController ()

@end

@implementation LSKPlainWebViewController
@synthesize webView;
@synthesize webViewLoads;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.webView = [[UIWebView alloc] init];
        [self.webView setDataDetectorTypes:( UIDataDetectorTypeLink | UIDataDetectorTypePhoneNumber)];
        self.webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.webView.delegate = self;
        
        //remove the gradient background when overscroll, thanks to http://stackoverflow.com/questions/3009063/remove-gradient-background-from-uiwebview
        webView.backgroundColor = [UIColor whiteColor];
        for (UIView* subView in [webView subviews])
        {
            if ([subView isKindOfClass:[UIScrollView class]]) {
                for (UIView* shadowView in [subView subviews])
                {
                    if ([shadowView isKindOfClass:[UIImageView class]]) {
                        [shadowView setHidden:YES];
                    }
                }
            }
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.webView];
}


-(void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}


- (void) loadUrlString: (NSString *) urlStr  {
    [self loadUrlString:urlStr withCache:NO];
    
}

- (void) loadUrlString: (NSString *) urlStr withCache:(BOOL) withCache{
    
    if (!IS_NOT_BLANK_STR(urlStr)) {
        return;
    }
    urlStr = [urlStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([urlStr isEqualToString:@""]) {
        return;
    }
    
    if ([self.webView isLoading]) {
        [self.webView stopLoading];
    }
    
	NSURL* url = [[NSURL alloc]initWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest* req;
    if (withCache) {
        req = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    }else{
        req = [[NSMutableURLRequest alloc] initWithURL:url];
    }
    [req setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
	[self.webView loadRequest:req];
    
}

#pragma mark webview delegate

- (void)webViewDidStartLoad:(UIWebView *)aWebView
{
    if(webViewLoads==0){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    webViewLoads++;
}

- (void) hideProgress {
    
    webViewLoads--;
    if(webViewLoads==0){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }
    
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView
{
    [self hideProgress];
    self.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    [self matchBackgroundColorToDocument];
    
}

// take from https://github.com/annekate/AKWebView
- (void)matchBackgroundColorToDocument
{
    // Grab the hex value of the document's background color.
    NSString *rgbString = [self.webView stringByEvaluatingJavaScriptFromString:@"var style = getComputedStyle(document.body,''); style.getPropertyValue('background-color');"];
    NSLog(@"rgbString : %@",rgbString);
    // Convert to a UIColor using helper method.
    UIColor *documentColor = [UIColor colorWithRGBString:rgbString];
    
    // Set as background color for the view. Now when you scroll, the areas above and
    // below the view will match the document.
    self.webView.backgroundColor = documentColor;
}


- (void)webView:(UIWebView *)aWebView didFailLoadWithError:(NSError *)error
{
    
    [self hideProgress];
	if([error code] == NSURLErrorCancelled){
        
		//忽略在一个请求还没完成前点击另一个链接的错误
	}else if ([error.domain isEqual:@"WebKitErrorDomain"] && (error.code == 101 || error.code == 102)) {
        //忽略打开自定义的URL
	}else{
        
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
        [SVProgressHUD dismissWithError:[error localizedDescription] afterDelay:2];
    }
    
}
@end
