//
//  CommonMKTableViewController.m
//  aizheke
//
//  Created by luo sky on 11-12-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LSKCommonMKTableViewController.h"
#import "SVProgressHUD.h"

@interface LSKCommonMKTableViewController ()
@property (nonatomic,strong) NSMutableDictionary *cachedResults;
@end


@implementation LSKCommonMKTableViewController


@synthesize commonCompleteBlock,commonErrorBlock;

#pragma mark -
#pragma mark Initialization

// 处理缓存和实际的返回有差异的情况
- (void)handleCachedResult:(NSArray *)ary isCache:(BOOL)isCache
{
    if (isCache) {
        [self.cachedResults setObject:ary forKey:[NSString stringWithFormat:@"cachedPage-%d",self.currentPage]];
    }else{
        NSArray *cachedResult = [self.cachedResults objectForKey:[NSString stringWithFormat:@"cachedPage-%d",self.currentPage]];
        if (cachedResult && [cachedResult isKindOfClass:[NSArray class]]) {
            [self.timeline removeObjectsInArray:cachedResult];
        }
    }
}

- (void)initBlocks
{
    //    __unsafe_unretained CommonMKTableViewController* target = self;
    LSKCommonMKTableViewController *targetSelf = self;
    self.commonCompleteBlock = ^(NSArray *ary, BOOL isCache) {
        LSKCommonMKTableViewController *target = targetSelf;//strong retain ,以保证block调用时self不会被release
        
        if (!target || target == nil ) {
            return;
        }
        if (![target isKindOfClass:[LSKCommonMKTableViewController class]]){
            return;
        }
        
        if (target.needClear) {
            [target.timeline removeAllObjects];
        }
        
        [target handleCachedResult:ary isCache:isCache];
        
        [target.timeline addObjectsFromArray:ary];
        
        if ([ary count] == 0){
            if(target.needClear)
                target.hasNothing = YES;
            target.hasNoMore = YES;
        }else {
            target.hasNothing = NO;
            target.hasNoMore = NO;
        }
        
        [target.tableView reloadData];
        
        if (!isCache) {
            [target resetLoadingState];
            [target doneLoadingTableViewData];
        }
        
        
        target = nil; // 释放self,打破循环retain
    };
    
    
    self.commonErrorBlock=^(NSError *error) {
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
        [SVProgressHUD dismissWithError:[error localizedDescription] afterDelay:2];
        LSKCommonMKTableViewController *target = targetSelf;
        if (!target || target == nil) {
            return;
        }
        
        [target resetLoadingState];
        [target doneLoadingTableViewData];
        target = nil;
    };
    
    self.commonNotModifiedBlock=^(){
        LSKCommonMKTableViewController *target = targetSelf;
        if (!target || target == nil) {
            return;
        }
        
        [target resetLoadingState];
        [target doneLoadingTableViewData];
        target = nil;
    };
    
}


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [self initBlocks];
    [super viewDidLoad];
}

- (void)dealloc{
    self.commonErrorBlock = nil;
    self.commonCompleteBlock = nil;
    self.commonNotModifiedBlock = nil;
}

@end

