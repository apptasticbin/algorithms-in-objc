//
//  SummaryRanges.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Interval.h"

@interface SummaryRanges : NSObject

- (void)addNum:(NSInteger)val;
- (NSArray<Interval *> *)getIntervals;

@end
