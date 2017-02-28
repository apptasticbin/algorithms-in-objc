//
//  SubmatrixSumToK.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "SubmatrixSumToK.h"

@implementation SubmatrixSumToK

- (BOOL)subMatrixOfMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix k:(NSUInteger)k {
    if (matrix == nil) return NO;
    NSUInteger m = matrix.count;
    if (m == 0) return NO;
    NSUInteger n = matrix[0].count;
    NSMutableArray<NSNumber *> *partialSums = [NSMutableArray array];
    for (NSInteger rowStart=0; rowStart<m; rowStart++) {
        // remove all objects for each iteration
        [partialSums removeAllObjects];
        for (NSInteger rowEnd=rowStart; rowEnd<m; rowEnd++) {
            for (NSInteger col=0; col<n; col++) {
                partialSums[col] = @(partialSums[col].integerValue + matrix[rowEnd][col].integerValue);
            }
            BOOL found = [self subArrayInArray:partialSums sum:k];
            if (found) return YES;
        }
    }
    return NO;
}

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
