//
//  LoadCell.m
//  Eden
//
//  Created by luosky on 11/23/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import "LSKLoadCell.h"
#import "LSKConstants.h"
#import "UIColor+Expanded.h"
static NSString* labels[] = {
	@"更新中...",
	@"更多...",
    @""
};

@implementation LSKLoadCell
{
    UILabel*                    label;
    UIActivityIndicatorView*    spinner;
}

@synthesize cellHeight;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		
    	label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.highlightedTextColor = [UIColor whiteColor];
        label.textColor = [UIColor grayColor];
//        label.shadowColor = [UIColor colorWithRed:177.0/255.0 green:129.0/255.0 blue:69.0/255.0 alpha:1.0];
		label.font = [UIFont boldSystemFontOfSize:17];
		label.numberOfLines = 1;
        label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		label.frame = CGRectMake(CELL_OUTTER_MARGIN,CELL_OUTTER_MARGIN, CELL_ACTUAL_WIDTH - CELL_OUTTER_MARGIN * 2, CELL_MINI_HEIGHT - CELL_OUTTER_MARGIN * 2);
		label.text = labels[LOAD_CELL_TYPE_MORE];
		[self.contentView addSubview:label];
				
		spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		spinner.frame = CGRectMake(CELL_OUTTER_MARGIN + label.frame.size.width * 4 / 5 ,CELL_MINI_HEIGHT / 2 - 20 / 2, 20, 20);
        spinner.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:spinner];
        
        //背景
        self.backgroundColor = [UIColor clearColor];
        
        self.cellHeight = 80;
    }
    return self;
}

- (void)setType:(LoadCellType)type
{
	switch (type) {
		case LOAD_CELL_TYPE_LOADING:
			[spinner startAnimating];
			break;
		default:
			[spinner stopAnimating];
			break;
	}
	label.text = labels[type];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




@end
