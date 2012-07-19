//
//  LoadCell.h
//  Eden
//
//  Created by luosky on 11/23/10.
//  Copyright 2010 renjian.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LOAD_CELL_TYPE_LOADING,
	LOAD_CELL_TYPE_MORE,
	LOAD_CELL_TYPE_END,
} LoadCellType;


@interface LSKLoadCell : UITableViewCell
@property(nonatomic, assign)     CGFloat cellHeight;
- (void)setType:(LoadCellType)type;
@end
