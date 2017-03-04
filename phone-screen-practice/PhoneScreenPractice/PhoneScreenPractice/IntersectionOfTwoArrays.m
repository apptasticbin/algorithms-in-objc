//
//  IntersectionOfTwoArrays.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "IntersectionOfTwoArrays.h"

@implementation IntersectionOfTwoArrays

- (NSArray<NSNumber *> *)intersection:(NSArray<NSNumber *> *)nums1 nums2:(NSArray<NSNumber *> *)nums2 {
    if (nums1.count >= nums2.count) {
        return [self intersection:nums2 nums2:nums1];
    }
    NSMutableDictionary<NSNumber *, NSNumber *> *count = [NSMutableDictionary dictionary];
    NSMutableArray<NSNumber *> *results = [NSMutableArray array];
    for(NSNumber *num in nums1) {
        if (count[num] == nil) count[num] = @(0);
        count[num] = @(count[num].integerValue+1);
    }
    
    for (NSNumber *num in nums2) {
        if (count[num] && count[num].integerValue > 0) {
            [results addObject:num];
            count[num] = @(count[num].integerValue-1);
        }
    }
    return results;
}

@end
