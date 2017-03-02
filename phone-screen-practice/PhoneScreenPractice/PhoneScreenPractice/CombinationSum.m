//
//  CombinationSum.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "CombinationSum.h"

@implementation CombinationSum

- (NSUInteger)combinationSum4DP:(NSArray<NSNumber *> *)nums target:(NSUInteger)target {
    NSUInteger dp[target+1];
    dp[0] = 1;
    for (NSInteger i=0; i<=target; i++) {
        for (NSInteger j=0; j<nums.count; j++) {
            if (i > nums[j].integerValue) dp[i] += dp[i-nums[j].integerValue];
        }
    }
    return dp[target];
}

// how about outputing all possible combinations?
- (NSArray<NSArray<NSNumber *> *> *)combinationSumDFS:(NSArray<NSNumber *> *)nums target:(NSUInteger)target {
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    [self helper:nums target:target combination:[NSMutableArray array] results:results];
    return results;
}

- (void)helper:(NSArray<NSNumber *> *)nums target:(NSInteger)target
   combination:(NSMutableArray<NSNumber *> *)combination
       results:(NSMutableArray<NSArray<NSNumber *> *> *)results {
    if (target < 0) return;
    if (target == 0) [results addObject:[combination copy]];
    for (NSInteger i=0; i<nums.count; i++) {
        NSInteger num = nums[i].integerValue;
        [combination addObject:nums[i]];
        [self helper:nums target:target-num combination:combination results:results];
        [combination removeLastObject];
    }
}

@end
