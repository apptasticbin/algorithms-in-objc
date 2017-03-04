//
//  Subsets.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 05/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "Subsets.h"

@implementation Subsets

- (NSArray<NSArray<NSNumber *> *> *)subsetsBacktracking:(NSArray<NSNumber *> *)nums {
    if (nums == nil || nums.count == 0) return nil;
    return [self helper:nums start:0];
}

- (NSArray<NSArray<NSNumber *> *> *)helper:(NSArray<NSNumber *> *)nums start:(NSInteger)start {
    if (start == nums.count) return @[@[]];
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    for (NSInteger i=start; i<nums.count; i++) {
        // first we add the single number into result
        NSArray<NSArray<NSNumber *> *> *combines = [self helper:nums start:i+1];
        for (NSArray<NSNumber *> *combine in combines) {
            [results addObject:[@[nums[i]] arrayByAddingObjectsFromArray:combine]];
        }
    }
    return results;
}

- (NSArray<NSArray<NSNumber *> *> *)subsetsIterative:(NSArray<NSNumber *> *)nums {
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray arrayWithObject:@[]];
    for (NSInteger i=0; i<nums.count; i++) {
        NSInteger n = results.count;
        for (NSInteger j=0; j<n; j++) {
            NSMutableArray<NSNumber *> *combine = [results[j] mutableCopy];
            [combine addObject:nums[i]];
            [results addObject:combine];
        }
    }
    return results;
}

- (NSArray<NSArray<NSNumber *> *> *)subsetsWithDuplicate:(NSArray<NSNumber *> *)nums {
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray<NSNumber *> *sortedNums = [nums sortedArrayUsingDescriptors:@[descriptor]];
    
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray arrayWithObject:@[]];
    // previousSize still store the previous results size
    // the startIndex stands for the startIndex of previous results for combining next subsets
    NSInteger previousSize = 0, startIndex = 0;
    for (NSInteger i=0; i<sortedNums.count; i++) {
        // if we find duplication, then we just combine with the last one of previous results
        if (i >= 1 && nums[i].integerValue == nums[i-1].integerValue) startIndex = previousSize;
        else startIndex = 0;
        NSInteger previousSize = results.count;
        for (NSInteger j=startIndex; j<previousSize; j++) {
            NSMutableArray<NSNumber *> *combine = [results[j] mutableCopy];
            [combine addObject:nums[i]];
            [results addObject:combine];
        }
    }
    return results;
}

@end
