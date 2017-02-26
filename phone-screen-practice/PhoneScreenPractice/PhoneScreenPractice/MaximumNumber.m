//
//  MaximumNumber.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 22/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MaximumNumber.h"

@implementation MaximumNumber

- (NSInteger)maximumNumberAfterOneSwap:(NSArray<NSNumber *> *)numbers {
    // sort number in descending order
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                     ascending:NO
                                                                      selector:@selector(compare:)];
    NSArray *sortedNumbers = [numbers sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    // find the first number not same
    // Improvement: using indexOfObjectPassingTest:
    __block NSUInteger index = numbers.count;
    [numbers enumerateObjectsUsingBlock:^(NSNumber *num, NSUInteger idx, BOOL *stop) {
        if (num != sortedNumbers[idx]) {
            *stop = YES;
            index = idx;
        }
    }];
    
    __block NSUInteger swapIndex = numbers.count;
    NSNumber *destinationNumber = sortedNumbers[index];
    
    if (index != numbers.count) {
        [numbers enumerateObjectsWithOptions:NSEnumerationReverse
                                  usingBlock:^(NSNumber *num, NSUInteger idx, BOOL *stop) {
                                      if ([num isEqualToNumber:destinationNumber]) {
                                          swapIndex = idx;
                                          *stop = YES;
                                      }
                                  }];
    }
    NSMutableArray *mutableNumbers = [numbers mutableCopy];
    [mutableNumbers exchangeObjectAtIndex:index withObjectAtIndex:swapIndex];
    // combine numbers into a string
    NSString *maximumNumberStr = [mutableNumbers componentsJoinedByString:@""];
    return maximumNumberStr.integerValue;
}

@end
