//
//  LSKImageLeftRightSubtitleCell.m
//  breadcoupon
//
//  Created by Luosky on 12-7-27.
//
//

#import "LSKImageLeftRightSubtitleCell.h"
#import "UIColor+Expanded.h"
@implementation LSKImageLeftRightSubtitleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.cellHeight = 60;
        
        self.imageButton.frame = CGRectMake(10, (self.contentView.height - 24) / 2 , 24, 24);
        
        int maxHeight = self.contentView.height - 2 * CELL_OUTTER_MARGIN;
        self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.contentView.width - 40 - 60, CELL_OUTTER_MARGIN, 60, maxHeight)];
        self.subtitleLabel.backgroundColor = [UIColor clearColor];
        self.subtitleLabel.textColor = [UIColor colorWithHexString:@"86898E"];
        self.subtitleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:12];
        self.subtitleLabel.adjustsFontSizeToFitWidth = YES;
        self.subtitleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.subtitleLabel.minimumFontSize = 10.0f;
        [self.contentView addSubview:self.subtitleLabel];
        
        int titleX = CELL_OUTTER_MARGIN + CGRectGetMaxX(self.imageButton.frame);
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleX, CELL_OUTTER_MARGIN, self.contentView.width - titleX - 40 - self.subtitleLabel.width, maxHeight)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:17];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"351F18"];
        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleLabel.minimumFontSize = 10.0f;
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

@end
