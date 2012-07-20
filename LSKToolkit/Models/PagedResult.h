//
//  PagedResult.h
//  aizheke
//
//  Created by Luosky on 12-3-31.
//  Copyright (c) 2012年 Renjian.com. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 { "total_entries":2,
 "total_pages":1,
 "count": 2
 "elements":[]
 }
 */

@interface PagedResult : NSObject
@property (nonatomic,assign) int total_entries;
@property (nonatomic,assign) int total_pages;
@property (nonatomic,assign) int count;
@property (nonatomic,retain) NSArray *elements;


@end
