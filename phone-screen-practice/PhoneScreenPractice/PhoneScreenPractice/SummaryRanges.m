//
//  SummaryRanges.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "SummaryRanges.h"

@implementation Interval

+ (instancetype)intervalWithStart:(NSInteger)start end:(NSInteger)end {
    @throw NSGenericException;
}

@end

@interface SummaryRanges ()

@property (nonatomic, strong) NSMutableArray<Interval *> *intervals;

@end

@implementation SummaryRanges

- (instancetype)init {
    self = [super init];
    if (self) {
        _intervals = [NSMutableArray array];
    }
    return self;
}

- (void)addNum:(NSInteger)val {
    NSComparator cmp = ^NSComparisonResult(Interval *interval1, Interval *interval2) {
        return interval1.start < interval2.start;
    };
    
    NSUInteger idx = [self.intervals indexOfObject:[Interval intervalWithStart:val end:val]
                                     inSortedRange:NSMakeRange(0, self.intervals.count)
                                           options:NSBinarySearchingInsertionIndex
                                   usingComparator:cmp];
    // for example, if val => 4, and intervals => {1, 3}, {5, 6}, we need to check if
    // the inserting value belongs to previous interval or not.
    // if YES; then merge this value to previous interval
    // if NO; just insert it.
    if (idx > 0 && self.intervals[idx-1].end+1 >= val) idx--;
    // merge connected intervals
    NSInteger start = val, end = val;
    while (idx < self.intervals.count &&
           val+1 >= self.intervals[idx].start &&
           val-1 <= self.intervals[idx].end) {
        start = MIN(start, self.intervals[idx].start);
        end = MAX(end, self.intervals[idx].end);
        [self.intervals removeObjectAtIndex:idx];
    }
    [self.intervals insertObject:[Interval intervalWithStart:start end:end] atIndex:idx];
}

- (NSArray<Interval *> *)getIntervals {
    return self.intervals;
}

@end
