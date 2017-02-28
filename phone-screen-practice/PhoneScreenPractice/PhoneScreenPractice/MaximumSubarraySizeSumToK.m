//
//  MaximumSubarraySizeSumToK.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MaximumSubarraySizeSumToK.h"

@implementation MaximumSubarraySizeSumToK

- (NSUInteger)maximumSizeSubarrayInArray:(NSArray<NSNumber *> *)nums k:(NSInteger)k {
    NSMutableDictionary<NSNumber *, NSNumber *> *preSums = [NSMutableDictionary dictionary];
    NSUInteger maxSize = 0;
    NSInteger sum = 0;
    for (NSInteger i = 0; i<nums.count; i++) {
        sum += nums[i].integerValue;
        if (sum == k) maxSize = MAX(maxSize, i+1);
        if (preSums[@(sum-k)]) maxSize = MAX(maxSize, i-preSums[@(sum-k)].integerValue);
        if (!preSums[@(sum)]) preSums[@(sum)] = @(i);
    }
    return maxSize;
}

@end
