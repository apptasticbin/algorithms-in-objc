//
//  CoinChange.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "CoinChange.h"

@implementation CoinChange

// Traditional Dynamic Programming question
// Tricky part:
// - the index of DP[] stands for the target total amount;
// - the value of DP[] stands for the minimum count of coins
// Ask interviewer: coins sorted? coin value type? target amount size?
// https://leetcode.com/problems/coin-change/?tab=Solutions
- (NSInteger)coinChange:(NSArray<NSNumber *> *)coins amount:(NSUInteger)amount {
    // NOTICE: how about amount == NSUIntegerMax ? discuss with interviewer
    // variable length C array should not be initialized with "{ value }";
    NSUInteger dp[amount+1];
    memset(dp, amount+1, amount+1);
    dp[0] = 0;
    for (NSUInteger i=1; i<=amount; i++) {
        NSUInteger n = coins.count;
        for (NSUInteger j=0; j<n; j++) {
            NSUInteger curC = coins[j].unsignedIntegerValue;
            if (curC <= i) dp[i] = MIN(dp[i], dp[i-curC]+1);
        }
    }
    return dp[amount] <= amount ?: -1;
}

@end
