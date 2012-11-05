//
//  CommonMKTableViewController.m
//  aizheke
//
//  Created by luo sky on 11-12-15.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LSKCommonMKTableViewController.h"
#import "VTPG_LogExpr.h"
#import "SVProgressHUD.h"

@implementation LSKCommonMKTableViewController


@synthesize commonCompleteBlock,commonErrorBlock;

#pragma mark -
#pragma mark Initialization
/*
 - (MKNKErrorBlock) commonErrorBlock{
 __unsafe_unretained CommonMKTableViewController* weakSelf = self;
 MKNKErrorBlock block =^(NSError *error) {
 [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
 [SVProgressHUD dismissWithError:[error localizedDescription] afterDelay:2];
 CommonMKTableViewController *target = weakSelf;
 if (!target || target == nil) {
 return;
 }
 
 [target resetLoadingState];
 [target doneLoadingTableViewData];
 };
 return block;
 
 }
 - (LSKArrayBlock) commonCompleteBlock
 {
 __unsafe_unretained CommonMKTableViewController* weakSelf = self;
 LSKArrayBlock block =  ^(NSArray *ary, BOOL isCache) {
 CommonMKTableViewController *target = weakSelf;
 LOG_NS(@" -----------  completeBlock   --------------");
 
 if (!target || target == nil || ![target isKindOfClass:[CommonMKTableViewController class]]) {
 return;
 }
 if (target.needClear) {
 [target.timeline removeAllObjects];
 }
 
 [target.timeline addObjectsFromArray:ary];
 
 if ([ary count] == 0){//附近没有优惠券
 if(target.needClear)
 target.hasNothing = YES;//附近没有优惠券
 else {
 target.hasNothing = NO;
 }
 target.hasNoMore = YES;
 }else {
 target.hasNothing = NO;
 if([ary count] < 20) target.hasNoMore = YES;
 else target.hasNoMore = NO;
 }
 
 LOG_EXPR([target.timeline count]);
 [target.tableView reloadData];
 if (!isCache) {
 LOG_NS(@"------------not cache! --------------");
 }
 
 [target resetLoadingState];
 [target doneLoadingTableViewData];
 
 LOG_NS(@" !!!!!!!!!!  pull refresh reset   !!!!!!!!!!");
 };
 return block;
 }
 */

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
        
        [target.timeline addObjectsFromArray:ary];
        
        if ([ary count] == 0){//附近没有优惠券
            if(target.needClear)
                target.hasNothing = YES;//附近没有优惠券
            else {
                target.hasNothing = NO;
            }
            target.hasNoMore = YES;
        }else {
            target.hasNothing = NO;
            if([ary count] < 20) target.hasNoMore = YES;
            else target.hasNoMore = NO;
        }
        
        [target.tableView reloadData];
        if (!isCache) {
            LOG_NS(@"not cache!");
        }
        
        [target resetLoadingState];
        [target doneLoadingTableViewData];
        
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
    
    /*
     self.commonCompleteBlock = ^(NSArray *ary, BOOL isCache) {
     LOG_NS(@" -----------  completeBlock   --------------");
     
     if (self.needClear) {
     [self.timeline removeAllObjects];
     }
     
     [self.timeline addObjectsFromArray:ary];
     
     if ([ary count] == 0){//附近没有优惠券
     if(self.needClear)
     self.hasNothing = YES;//附近没有优惠券
     else {
     self.hasNothing = NO;
     }
     self.hasNoMore = YES;
     }else {
     self.hasNothing = NO;
     if([ary count] < 20) self.hasNoMore = YES;
     else self.hasNoMore = NO;
     }
     
     LOG_EXPR([self.timeline count]);
     [self.tableView reloadData];
     if (!isCache) {
     LOG_NS(@"------------not cache! --------------");
     }
     
     [self resetLoadingState];
     [self doneLoadingTableViewData];
     
     LOG_NS(@" !!!!!!!!!!  pull refresh reset   !!!!!!!!!!");
     };
     
     
     self.commonErrorBlock=^(NSError *error) {
     [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
     [SVProgressHUD dismissWithError:[error localizedDescription] afterDelay:2];
     //        CommonMKTableViewController *self = weakSelf;
     if (!self || self == nil) {
     return;
     }
     
     [self resetLoadingState];
     [self doneLoadingTableViewData];
     };
     */
    
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

