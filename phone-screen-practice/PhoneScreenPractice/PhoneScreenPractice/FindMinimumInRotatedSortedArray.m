//
//  FindMinimumInRotatedSortedArray.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "FindMinimumInRotatedSortedArray.h"

@implementation FindMinimumInRotatedSortedArray

// Traditional binary search question
// Ask interviewer: duplicates? all positive? how about nil pointer handling?
// Check two element case [2, 1] and [1, 2]
// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/?tab=Solutions
- (NSNumber *)findMin:(NSArray<NSNumber *> *)nums {
    NSParameterAssert(nums);	// prevent nums to be nil
    NSUInteger left = 0, right = nums.count-1;
    while (left < right) {
        NSUInteger mid = left + (right-left) / 2;
        if ([nums[mid] compare:nums[right]] == NSOrderedDescending ||
            [nums[mid] compare:nums[right]] == NSOrderedSame) {
            left = mid+1;
        } else {
            right = mid;
        }
    }
    return nums[left];
}

// [1, 2, 2, 2, 3, 1, 1, 1]
// worst case: [1, 1, 1, 1, 1, 1, ...., 1], from O(Log(N)) drops to O(N)
// http://www.jiuzhang.com/solutions/find-minimum-in-rotated-sorted-array-ii/
- (NSNumber *)findMinWithDuplicates:(NSArray<NSNumber *> *)nums {
    NSParameterAssert(nums);
    NSUInteger left = 0, right = nums.count-1;
    while (left < right) {
        NSUInteger mid = left + (right - left)/2;
        if ([nums[mid] compare:nums[right]] == NSOrderedDescending) {
            left = mid+1;
        } else if ([nums[mid] compare:nums[right]] == NSOrderedAscending){
            right = mid;
        } else { // equal
            right--; // when middle value equals to right value, just move right to left by 1
        }
    }
    return nums[left];
}

@end
