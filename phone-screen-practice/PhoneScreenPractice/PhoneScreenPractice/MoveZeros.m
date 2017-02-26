//
//  MoveZeros.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MoveZeros.h"

@implementation MoveZeros

- (void)moveZeros:(NSMutableArray<NSNumber *> *)nums {
    NSParameterAssert(nums);
    NSUInteger zero = 0;
    for (NSUInteger nonZero = 0; nonZero<nums.count; nonZero++) {
        if (![nums[nonZero] isEqualToNumber:@(0)]) {
            [nums exchangeObjectAtIndex:nonZero withObjectAtIndex:zero];
            zero++;
        }
    }
}

@end
