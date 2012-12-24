//
//  AZKBaseTableViewController.m
//  aizheke
//
//  Created by Luosky on 12-5-3.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "LSKBaseTableViewController.h"
#import "LSKBaseCell.h"
#import "LSKConstants.h"
@interface LSKBaseTableViewController ()

@end

@implementation LSKBaseTableViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil style:(UITableViewStyle)tableViewStyle{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:tableViewStyle];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sectionDatas = [NSMutableDictionary dictionary];
    
    self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds));
    [self.view addSubview:self.tableView];
}

#pragma mark - interface methods

- (NSString*)keyForSection:(int)sectionIndex{
    return [NSString stringWithFormat:@"section_%d",sectionIndex];
}

- (id)objectForIndexPath:(NSIndexPath*)indexPath{
    NSArray *datas = [self.sectionDatas valueForKey:[self keyForSection:indexPath.section] ];
    id obj  = [datas objectAtIndex:indexPath.row];
    return obj;
}

#pragma mark - override methods


// 如果sectionData的数据如下:
// datas = @{[self keyForSection:0] : @[@{ @"img" : @"icon_user.png" , @"title":@"", @"subtitle":@"点击登录" , @"triggerAction" : @"onSelectedLogin"}]}
// 则选择cell时默认会触发triggerAction属性对应的方法
-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *obj = [self objectForIndexPath:indexPath];
    NSString *action = [obj objectForKey:@"triggerAction"];
    SEL selector = NSSelectorFromString(action);
    if ([self respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:selector];
#pragma clang diagnostic pop
    }
    
}

- (UITableViewCell *) reuseableCellForTable: (UITableView *) tableView  {
    static NSString *CellIdentifier = @"AZKBaseTableViewCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
    }
    return cell;
}

// overide this method instead of @selector(reuseableCellForTable:) if you have different cells
- (UITableViewCell *) reuseableCellForTable: (UITableView *) tableView  atIndexPath:(NSIndexPath*)indexPath {
    return [self reuseableCellForTable:tableView atIndexPath:indexPath];
}

-(void)configureCell:(UITableViewCell*) cell inTableView:(UITableView*)tableView atIndexPath:(NSIndexPath*)indexPath{
    /*
     id obj = [self objectForIndexPath:indexPath];
     //do sth about obj
     */
}



#pragma mark -
#pragma mark Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    [self didSelectRowAtIndexPath:indexPath];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)t cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    UITableViewCell *cell = [self reuseableCellForTable: t atIndexPath:indexPath];
    [self configureCell:cell inTableView:t atIndexPath:indexPath];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.sectionDatas allKeys] count];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.sectionDatas valueForKey:[self keyForSection:section] ] count] ;
}


- (CGFloat)tableView:(UITableView *)t heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:t cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[LSKBaseCell class]]) {
        return [(LSKBaseCell*)cell cellHeight];
    }
    
    return 80;
}


- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [self tableView:tableView viewForHeaderInSection:section].frame.size.height;
}

- (float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return [self tableView:tableView viewForFooterInSection:section].frame.size.height;
}


@end
