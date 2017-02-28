//
//  LongestConsecutive.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "LongestConsecutive.h"

@implementation LongestConsecutive

- (NSUInteger)longestConsecutive:(NSArray<NSNumber *> *)nums {
    NSMutableSet<NSNumber *> *set = [NSMutableSet setWithArray:nums];
    NSUInteger longest = 0;
    for (NSInteger i=0; i<nums.count; i++) {
        NSNumber *down = @(nums[i].integerValue-1);
        while ([set containsObject:down]) {
            [set removeObject:down];
            down = @(down.integerValue-1);
        }
        
        NSNumber *up = @(nums[i].integerValue+1);
        while ([set containsObject:up]) {
            [set removeObject:up];
            up = @(up.integerValue+1);
        }
        longest = MAX(longest, up.integerValue - down.integerValue - 1);
    }
    return longest;
}

@end
