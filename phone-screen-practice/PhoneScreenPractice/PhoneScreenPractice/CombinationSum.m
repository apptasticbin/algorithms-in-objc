//
//  CombinationSum.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "CombinationSum.h"

@implementation CombinationSum

#pragma Combination Sum I

- (NSArray<NSArray<NSNumber *> *> *)combinationSumI:(NSArray<NSNumber *> *)candidates
                                             target:(NSInteger)target {
    NSParameterAssert(candidates);
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    [self dfs:candidates target:target begin:0
	 combination:[NSMutableArray array] results:results];
    return results;
}

// this implementation assumes that [2, 3, 2] equals to [2, 2, 3]
// So we need a "begin" index to avoid this duplicate situation.
- (void)dfs:(NSArray<NSNumber *> *)candidates target:(NSInteger)target
      begin:(NSInteger)begin
combination:(NSMutableArray *)combination
    results:(NSMutableArray<NSArray<NSNumber *> *> *)results {
    if (target < 0) return;
  	 if (target == 0) {
         [results addObject:[combination copy]];
         return;
     }
    
    // because we use "begin" to move the begin pointer, then we can have
    // [2, 2, 2, 2], [3, 3, 3, 3] [6, 6, 6, 6], etc
    for (NSInteger i=begin; i<candidates.count; i++) {
        [combination addObject:candidates[i]];
        [self dfs:candidates target:target-candidates[i].integerValue begin:i
      combination:combination results:results];
        [combination removeLastObject];
    }
}

#pragma Combination Sum IV

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
