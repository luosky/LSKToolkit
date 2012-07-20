//
//  CommonMKTableViewController.h
//  aizheke
//
//  Created by luo sky on 11-12-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSKCommonPullRefreshTableViewController.h"
#import "LSKConstants.h"
#import "MKNetworkkit.h"
/**
    和CommonTableViewController的区别在于这个用的是MKNetworkKit来进行网络交互
 */

@interface LSKCommonMKTableViewController : LSKCommonPullRefreshTableViewController {
}

@property (nonatomic,copy)      LSKArrayBlock commonCompleteBlock;
@property (nonatomic,copy)      MKNKErrorBlock  commonErrorBlock;

//- (MKNKErrorBlock) commonErrorBlock;
//- (LSKArrayBlock) commonCompleteBlock;
@end
