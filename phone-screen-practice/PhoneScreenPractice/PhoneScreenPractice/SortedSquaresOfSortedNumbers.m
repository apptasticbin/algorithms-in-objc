//
//  SortedSquaresOfSortedNumbers.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "SortedSquaresOfSortedNumbers.h"

@implementation SortedSquaresOfSortedNumbers

- (NSArray<NSNumber *> *)sortedSquaresOfSortedNumbers:(NSArray<NSNumber *> *)nums {
    if (nums == nil) return nil;
    NSMutableArray<NSNumber *> *results = [NSMutableArray array];
    NSInteger left=0, right=nums.count-1;
    while (left < right) {
        NSNumber *leftNum = nums[left];
        NSNumber *rightNum = nums[right];
        if (ABS(leftNum.integerValue) >= ABS(rightNum.integerValue)) {
            [results addObject:@(leftNum.integerValue * leftNum.integerValue)];
            left++;
        } else {
            [results addObject:@(rightNum.integerValue * rightNum.integerValue)];
            right--;
        }
    }
    return results;
}

@end
