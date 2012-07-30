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
@synthesize tableView,sectionDatas;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sectionDatas = [NSMutableDictionary dictionary];
    
    //tableview
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
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

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    id obj = [self objectForIndexPath:indexPath];
    //do sth about obj
     */
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
	
    UITableViewCell *cell = [self reuseableCellForTable: t];
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



@end