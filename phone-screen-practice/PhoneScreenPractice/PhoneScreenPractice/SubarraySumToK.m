//
//  SubarraySumToK.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "SubarraySumToK.h"

@implementation SubarraySumToK

- (BOOL)subArrayInArray:(NSArray<NSNumber *> *)nums sum:(NSUInteger)k {
    if (nums == nil || nums.count == 0) return NO;
    NSInteger sum = 0;
    NSUInteger start = 0;
    for (NSInteger end = 0; end<nums.count; end++) {
        sum += nums[end].integerValue;
        if (sum == k) {
            return YES;
        }
        while (sum > k && start <= end) {
            sum -= nums[start++].integerValue;
        }
    }
    return NO;
}

@end
