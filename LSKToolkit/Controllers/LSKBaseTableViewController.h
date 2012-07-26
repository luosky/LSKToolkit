//
//  AZKBaseTableViewController.h
//  aizheke
//
//  Created by Luosky on 12-5-3.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//


@interface LSKBaseTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) UITableView                *tableView;
//以section为key,value为该section里元素的集合,可以是数组,也可以是NSDictionary,只要保证count出来的数等于该section里cell的个数即可.
@property (nonatomic,strong) NSMutableDictionary        *sectionDatas;

- (NSString*)keyForSection:(int)sectionIndex;
- (id)objectForIndexPath:(NSIndexPath*)indexPath;
@end
