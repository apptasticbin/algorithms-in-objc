//
//  MergeIntervals.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 03/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MergeIntervals.h"

@implementation MergeIntervals

- (NSArray<Interval *> *)merge:(NSArray<Interval *> *)intervals {
    if (intervals == nil || intervals.count == 0) return intervals;
    
    NSComparator cmp = ^NSComparisonResult(Interval *i1, Interval *i2) {
        // sort the list based on the interval start
        return i1.start < i2.start;
    };
    
    NSArray<Interval *> *sorted = [intervals sortedArrayUsingComparator:cmp];
    NSMutableArray<Interval *> *results = [NSMutableArray array];
    
    NSInteger start = intervals[0].start, end = intervals[0].end;
    for (NSInteger i=1; i<sorted.count; i++) {
        Interval *cur = intervals[i];
        // if there is overlapping, then we merge them
        if (cur.start<=end) {
            end = MAX(cur.end, end);
        } else { // if there isn't overlapping, then we start a new interval
            [results addObject:[Interval intervalWithStart:start end:end]];
            start = cur.start;
            end = cur.end;
        }
    }
    // REMEMBER: add the last interval
    [results addObject:[Interval intervalWithStart:start end:end]];
    return results;
}

@end
