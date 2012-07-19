//
//  CommonPullRefreshTableViewController.h
//  aizheke
//
//  Created by Luosky on 12-3-31.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "EGORefreshTableViewController.h"
#import "LSKLoadCell.h"

@interface LSKCommonPullRefreshTableViewController : EGORefreshTableViewController{
    int  currentPage;
}

@property(nonatomic,strong)    NSMutableArray*         timeline;
@property(nonatomic,assign)     BOOL					needClear;
@property(nonatomic,strong)    	LSKLoadCell*				loadCell;
@property(nonatomic,strong)    	UITableViewCell*				nothingCell;
@property(nonatomic, assign)    BOOL hasNothing;
@property(nonatomic, assign)    BOOL hasNoMore;
@property(nonatomic,assign)     int  currentPage;

- (void)loadTimelineWithPage:(int)page;
- (void)reload:(id)sender;
- (void)more:(id)sender;
- (void)loading;

- (void) resetLoadingState;


@end
