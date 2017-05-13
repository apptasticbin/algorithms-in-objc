//
//  SummeryRanges.h
//  WeirdTest
//
//  Created by Bin Yu on 13/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Interval;

@interface SummaryRanges : NSObject

- (void)addNum:(NSInteger)num;
- (NSArray<Interval *> *)getIntervals;

@end
