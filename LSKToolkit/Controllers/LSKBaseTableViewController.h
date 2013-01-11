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

- (NSMutableArray*)arrayForSection:(int)sectionIndex;
- (id)objectForIndexPath:(NSIndexPath*)indexPath;

#pragma mark - override methods

// 如果sectionData的数据如下:
// datas = @{[self keyForSection:0] : @[@{ @"img" : @"icon_user.png" , @"title":@"", @"subtitle":@"点击登录" , @"triggerAction" : @"onSelectedLogin"}]}
// 则选择cell时默认会触发triggerAction属性对应的方法
-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
