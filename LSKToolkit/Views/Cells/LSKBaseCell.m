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


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initAppearance];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initAppearance];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initAppearance];
    }
    return self;
}


- (void)initAppearance{
    //    self.backgroundView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"cell_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 10, 20, 10)]];
}


- (void)updateWithEntity:(id)entity{
    [self updateWithEntity:entity atIndexPath:nil];
}

- (void)updateWithEntity:(id)entity atIndexPath:(NSIndexPath*)indexPath{
    
}
@end
