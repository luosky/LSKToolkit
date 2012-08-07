//
//  AZKBaseTableViewController.h
//  aizheke
//
//  Created by Luosky on 12-5-3.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//


@interface LSKBaseTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) UITableView                *tableView;
//以section为key,value为该section里元素的数组
@property (nonatomic,strong) NSMutableDictionary        *sectionDatas;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil style:(UITableViewStyle)tableViewStyle;
- (NSString*)keyForSection:(int)sectionIndex;
- (id)objectForIndexPath:(NSIndexPath*)indexPath;
@end
