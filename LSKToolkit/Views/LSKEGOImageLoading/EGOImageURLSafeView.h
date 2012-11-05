//
//  EGOImageURLSafeView.h
//  aizheke
//
//  Created by Luosky on 12-4-23.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import "EGOImageView.h"
// url不合法时不会崩溃...
@interface EGOImageURLSafeView : EGOImageView
- (void)fetchImageAtUrlStr:(NSString*)urlStr;
- (void)setImageURLStr:(NSString*)urlStr DEPRECATED_ATTRIBUTE;

@end
