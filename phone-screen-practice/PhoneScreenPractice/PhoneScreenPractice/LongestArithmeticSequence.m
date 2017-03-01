//
//  LongestArithmeticSequence.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "LongestArithmeticSequence.h"

@implementation LongestArithmeticSequence

- (NSUInteger)lengthOfLISDP:(NSArray<NSNumber *> *)nums {
    if (!nums || nums.count == 0) return 0;
    NSUInteger dp[nums.count];
    NSUInteger max = 0;
    for (NSInteger i=1; i<nums.count; i++) {
        dp[i] = 1;
        for (NSInteger j=i-1; j>=0; j++) {
            NSInteger num = nums[i].integerValue;
            if (num > dp[j]) dp[i] = MAX(dp[j]+1, dp[i]);
        }
        if (dp[i] > max) max = dp[i];
    }
    return max;
}

/*Our strategy determined by the following conditions,
 
 1. If A[i] is smallest among all end
 candidates of active lists, we will start
 new active list of length 1, but still keep rest in the array,
 which stands for the current maximum value
 2. If A[i] is largest among all end candidates of
 active lists, we will clone the largest active
 list, and extend it by A[i].
 
 3. If A[i] is in between, we will find a list with
 largest end element that is smaller than A[i].
 Clone and extend this list by A[i]. We will discard all
 other lists of same length as that of this modified list.*/

- (NSUInteger)lengthOfLISBinarySearch:(NSArray<NSNumber *> *)nums {
    NSMutableArray<NSNumber *> *fakeResults = [NSMutableArray array];
    for (NSInteger i=0; i<nums.count; i++) {
        NSNumber *num = nums[i];
        // find insertion index
        NSUInteger idx = [fakeResults indexOfObject:num inSortedRange:NSMakeRange(0,fakeResults.count)
                                            options:NSBinarySearchingInsertionIndex
                                         usingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
                                             return [num1 compare:num2];
                                         }];
        if (idx == fakeResults.count) [fakeResults addObject:num];
        else fakeResults[i] = num;
    }
    // The result is NOT the real result.
    // Only the "Length Of The Result" is the same as the length of final result.
    return fakeResults.count;
}

@end
