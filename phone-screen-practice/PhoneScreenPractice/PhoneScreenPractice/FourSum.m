//
//  FourSum.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "FourSum.h"

@implementation FourSum

- (NSArray<NSArray<NSNumber *> *> *)fourSum:(NSArray<NSNumber *> *)nums target:(NSInteger)target {
    if (!nums) return nil;
    
    NSMutableArray<NSNumber *> *sortedNums = [NSMutableArray arrayWithArray:nums];
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    [sortedNums sortUsingDescriptors:@[descriptor]];
    
    NSMutableArray<NSArray *> *results = [NSMutableArray array];
    NSUInteger size = nums.count;
    for (NSUInteger first=0; first<size-3; first++) {
        if (first > 0 && [sortedNums[first] isEqualToNumber:sortedNums[first-1]]) continue;
        for (NSUInteger second = first+1; second < size-2; second++) {
            if (second > first+1 && [sortedNums[second] isEqualToNumber:sortedNums[second-1]]) continue;
            NSInteger sum = target - sortedNums[first].integerValue - sortedNums[second].integerValue;
            NSUInteger third = second+1;
            NSUInteger fourth = size-1;
            while (third < fourth) {
                if (sortedNums[third].integerValue + sortedNums[fourth].integerValue == sum) {
                    [results addObject:@[sortedNums[first], sortedNums[second],
                                         sortedNums[third], sortedNums[fourth]]];
                    third++; fourth--;
                    while (third < fourth && [sortedNums[third] isEqualToNumber:sortedNums[third-1]]) third++;
                    while (third < fourth && [sortedNums[fourth] isEqualToNumber:sortedNums[fourth-1]]) fourth--;
                } else if (sortedNums[third].integerValue + sortedNums[fourth].integerValue < sum) {
                    third++;
                } else {
                    fourth--;
                }
            }
        }
    }
    return results;
}

- (NSUInteger) fourSumCountAmongA:(NSArray<NSNumber *> *)A B:(NSArray<NSNumber *> *)B
                              C:(NSArray<NSNumber *> *)C D:(NSArray<NSNumber *> *)D {
    NSParameterAssert(A && B && C && D);
    NSMutableDictionary<NSNumber *, NSNumber *> *count = [NSMutableDictionary dictionary];
    for (NSUInteger i=0; i<A.count; i++) {
        for (NSUInteger j=0; j<B.count; j++) {
            NSInteger sum = A[i].integerValue + B[j].integerValue;
            count[@(sum)] = @(count[@(sum)].integerValue + 1);
        }
    }
    
    NSUInteger result = 0;
    for (NSUInteger i=0; i<C.count; i++) {
        for (NSUInteger j=0; j<D.count; j++) {
            NSInteger sum = C[i].integerValue + D[j].integerValue;
            if (count[@(-sum)] && count[@(-sum)].integerValue > 0) {
                result++;
                count[@(-sum)] = @(count[@(-sum)].integerValue-1);
            }
        }
    }
    return result;
}

@end
