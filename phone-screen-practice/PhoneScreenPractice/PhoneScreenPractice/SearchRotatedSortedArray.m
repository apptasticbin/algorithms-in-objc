//
//  SearchRotatedSortedArray.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 03/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "SearchRotatedSortedArray.h"

@implementation SearchRotatedSortedArray

#pragma mark - Search In Rotated Sorted Array I

- (NSInteger)search:(NSArray<NSNumber *> *)nums target:(NSInteger)target {
    if (nums == nil && nums.count == 0) return -1;
    NSInteger left = 0, right = nums.count-1;
    while (left <= right) {
        NSInteger mid = left + (right-left)/2;
        NSInteger midValue = nums[mid].integerValue;
        NSInteger leftValue = nums[left].integerValue;
        NSInteger rightValue = nums[right].integerValue;
        
        if (midValue == target) return mid;
        
        // checking middle value with left value is logically better than
        // checking middle value and target
        if (midValue >= leftValue) {
            if (target < midValue && target >= leftValue) {
                right = mid-1;
            } else {
                left = mid+1;
            }
        } else {
            if (target > midValue && target <= rightValue) {
                left = mid+1;
            } else {
                right = mid-1;
            }
        }
    }
    return -1;
}

#pragma mark - Search In Rotated Sorted Array II

- (BOOL)searchWithDuplicate:(NSArray<NSNumber *> *)nums target:(NSInteger)target {
    if (nums == nil && nums.count == 0) return -1;
    NSInteger left = 0, right = nums.count-1;
    while (left <= right) {
        NSInteger mid = left + (right-left)/2;
        NSInteger midValue = nums[mid].integerValue;
        NSInteger leftValue = nums[left].integerValue;
        NSInteger rightValue = nums[right].integerValue;
        
        if (midValue == target) return mid;
        
        // checking middle value with left value is logically better than
        // checking middle value and target
        if (midValue > leftValue) {
            if (target < midValue && target >= leftValue) {
                right = mid-1;
            } else {
                left = mid+1;
            }
        } else if (midValue < leftValue) {
            if (target > midValue && target <= rightValue) {
                left = mid+1;
            } else {
                right = mid-1;
            }
        } else {
            // when we find duplications, just left to right until no duplicate anymore
            leftValue += 1;
        }
    }
    return -1;
}

@end
