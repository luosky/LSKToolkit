//
//  BaseCell.m
//  aizheke
//
//  Created by luo sky on 11-11-18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "LSKBaseCell.h"

@implementation LSKBaseCell
@synthesize cellHeight;

- (void)updateWithEntity:(id)entity{
    [self updateWithEntity:entity atIndexPath:nil];
}

- (void)updateWithEntity:(id)entity atIndexPath:(NSIndexPath*)indexPath{
    
}
@end
