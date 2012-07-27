//
//  CommonPullRefreshTableViewController.m
//  aizheke
//
//  Created by Luosky on 12-3-31.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "LSKCommonPullRefreshTableViewController.h"
#import "UITableViewController+RoundedBackground.h"
#import "LSKBaseCell.h"
#import "LSKConstants.h"
@interface LSKCommonPullRefreshTableViewController ()

@end

@implementation LSKCommonPullRefreshTableViewController
@synthesize timeline,needClear,loadCell,nothingCell;
@synthesize hasNothing,hasNoMore,currentPage;

- (void)initInterface {
    self.timeline = [[NSMutableArray alloc] init];
    self.loadCell = [[LSKLoadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"loadCell"];
    
    self.nothingCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    self.nothingCell.textLabel.text = @"目前没有内容";
    self.nothingCell.textLabel.backgroundColor = [UIColor clearColor];
    self.nothingCell.detailTextLabel.backgroundColor = [UIColor clearColor];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    currentPage=1;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_bg.png"]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.separatorColor = [UIColor clearColor];
    
    [self initInterface];
    [self loadFirstData];
}


#pragma mark -
#pragma mark 需要在子类里实现的方法

-(void)loadTimelineWithPage:(int)page{
    
    if(page == 1)
        needClear = YES;
    //    [[ApiEngine sharedInstance] getSubscribeBusinessStatusWithPage:++currentPage OnCompletion:commonCompleteBlock onError:commonErrorBlock];
}


- (void)reloadMethod
{
    [self loadTimelineWithPage:1];
}


- (void)moreMethod
{
    [self loadTimelineWithPage:++currentPage];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForTimelineRowAtIndexPath:(NSIndexPath*)indexPath{
    return CELL_MINI_HEIGHT;
}

- (UITableViewCell *) reuseableCellForTable: (UITableView *) tableView  {
    static NSString *CellIdentifier = @"BasicFRCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		
    }
    return cell;
}

-(void)configureCell:(UITableViewCell*) cell inTableView:(UITableView*)tableView atIndexPath:(NSIndexPath*)indexPath{
    [self configureCell:cell atIndexPath:indexPath];
}

-(void)configureCell:(UITableViewCell*) cell atIndexPath:(NSIndexPath*)indexPath{
    
}


-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}



#pragma mark - 可以在子类里override以更改相应的特性

-(void)loadFirstData{
    [self loading];
    [self performSelector:@selector(reload:) withObject:nil afterDelay:0.2];
    return;
}

- (void) resetLoadingState {
    [self.loadCell setType:LOAD_CELL_TYPE_MORE];
    
}


- (void)reload:(id)sender
{
    
	needClear = YES;
	[self loading];
	[self reloadMethod];
    
    currentPage = 1;
}


- (void)more:(id)sender
{
	needClear = NO;
	
	[self loading];
    [self moreMethod];
	
}

- (void)loading
{
	[loadCell setType:LOAD_CELL_TYPE_LOADING];
	
}



#pragma mark -
#pragma mark Table view data source



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];   
	
    if (indexPath.section == 1) {
        if(!self.hasNothing) [self more:nil];
    }else {
        [self didSelectRowAtIndexPath:indexPath];
    }
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.section == 1) {
        if (self.hasNothing) {
            [self setRoundedBackground:tableView indexPath:indexPath cell:nothingCell];    
            return nothingCell;
        }else{
            return loadCell;    
        }
	}else{
        UITableViewCell *cell = [self reuseableCellForTable: tableView];
        [self configureCell:cell inTableView:tableView atIndexPath:indexPath];
        return cell;
    }
    
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [timeline count];
    }else{
        if (self.hasNothing) {
            return 1;
        }else{
            if (self.hasNoMore) {
                return 0;
            }else
                return 1;    
        }
        
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if(self.hasNothing) 
            return 80;
        else 
            return loadCell.cellHeight;
    }else{
        return [self tableView:tableView heightForTimelineRowAtIndexPath:indexPath];
    }
}


#pragma mark -
#pragma mark EGOTable 

- (void)reloadTableViewDataSource{
    [super reloadTableViewDataSource];
	[self reload:nil];
}

-(void)moreTableViewDataSource{
    [super moreTableViewDataSource];
	[self more:nil];
}


@end
