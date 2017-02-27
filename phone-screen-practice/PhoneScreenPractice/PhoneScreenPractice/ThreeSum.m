//
//  ThreeSum.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ThreeSum.h"

@implementation ThreeSum

- (NSArray<NSArray<NSNumber *> *> *)threeSum:(NSArray<NSNumber *> *)nums {
    if (!nums) return nil;
    
    NSMutableArray<NSNumber *> *sortedNums = [NSMutableArray arrayWithArray:nums];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    [sortedNums sortUsingDescriptors:@[descriptor]];
    
    NSUInteger size = nums.count;
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    
    for (NSUInteger start=0; start<size-2; start++) {
        // if found duplicates, ignore and continue
        if (start > 0 && [sortedNums[start] isEqualToNumber:sortedNums[start-1]]) continue;
        NSUInteger mid = start+1;
        NSUInteger end = size-1;
        NSInteger target = -sortedNums[start].integerValue;
        while (mid < end) {
            if (sortedNums[mid].integerValue + sortedNums[end].integerValue == target) {
                [results addObject:@[sortedNums[start], sortedNums[mid], sortedNums[end]]];
                mid++; end--;
                // now skip duplicates
                while (mid < end && sortedNums[mid] == sortedNums[mid-1]) mid++;
                while (mid < end && sortedNums[end] == sortedNums[end+1]) end--;
            } else if (sortedNums[mid].integerValue + sortedNums[end].integerValue < target) {
                mid++;
            } else {
                end--;
            }
        }
    }
    return results;
}

@end
