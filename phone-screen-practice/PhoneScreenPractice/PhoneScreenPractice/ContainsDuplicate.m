//
//  ContainsDuplicate.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ContainsDuplicate.h"

@implementation ContainsDuplicate

- (BOOL)containsNearbyAlmostDuplicate:(NSArray<NSNumber *> *)nums k:(NSInteger)k t:(NSInteger)t {
    NSMutableOrderedSet<NSNumber *> *window = [NSMutableOrderedSet orderedSet];
    for (NSInteger i=0; i<nums.count; i++) {
        // i == k -> k-1 elements
        if (i>k) [window removeObjectAtIndex:i-k-1];
        NSInteger num = nums[i].integerValue;
        // find the insertion index of num-t
        NSUInteger pos = [window indexOfObject:@(num - t)
                                 inSortedRange:NSMakeRange(0,window.count)
                                       options:NSBinarySearchingInsertionIndex
                               usingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
                                   return [num1 compare:num2];
                               }];
        // if there are numbers larger than num - t, also that number is smaller or equal than num+t
        // then we find the result, and return
        if ((pos != window.count-1) && (window[pos].integerValue - num <= t)) return YES;
        // if not found any result, then we insert the number into the sorted ordered set
        // in this way, we can always keep the window set sorted
        pos = [window indexOfObject:@(num)
                      inSortedRange:NSMakeRange(0,window.count)
                            options:NSBinarySearchingInsertionIndex
                    usingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
                        return [num1 compare:num2];
                    }];
        [window insertObject:@(num) atIndex:pos];
    }
    return NO;
}


@end
