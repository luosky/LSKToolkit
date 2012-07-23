//
//  PlainWebViewController.h
//  aizheke
//
//  Created by Luosky on 12-5-24.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSKPlainWebViewController : UIViewController <UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,assign) int *webViewLoads;

- (void) loadUrlString: (NSString *)urlStr;

- (void) loadUrlString: (NSString *) urlStr withCache:(BOOL) withCache;

@end
