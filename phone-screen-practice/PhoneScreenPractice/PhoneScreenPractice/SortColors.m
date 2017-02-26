//
//  SortColors.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 25/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "SortColors.h"

@implementation SortColors

// Two Pass Solution: counting sort
- (void)twoPassSortColors:(NSMutableArray<NSNumber *> *)colors {
    NSUInteger counter[3];
    for (NSUInteger i=0; i<colors.count; i++) {
        counter[colors[i].unsignedIntegerValue]++;
    }
    for (NSUInteger i=0, j=0; i<colors.count && j<3; i++) {
        if (counter[j] > 0) {
            colors[i] = @(j);
            counter[j]--;
        } else {
            j++;
        }
    }
}

// One Pass In-Place Solution: three pointer, similar to move zeros, but with three pointers
// 0 2 1 2 0 2 1 2
- (void)onePassSortColors:(NSMutableArray<NSNumber *> *)colors {
    NSUInteger zero = 0, one = 0, two = colors.count-1;
    for (; one <= two; one++) {
        if ([colors[one] isEqualToNumber:@(0)]) {
            [colors exchangeObjectAtIndex:zero withObjectAtIndex:one];
            zero++;
        } else if ([colors[one] isEqualToNumber:@(2)]) {
            [colors exchangeObjectAtIndex:two withObjectAtIndex:one];
            // NOTICE: when color is 2, then go back one index. the index will come back in next loop and stay here
            one--;
            two--;
        }
    }
}

// One Pass Tricky In-Place Solution
- (void)onePassTrickySortColors:(NSMutableArray<NSNumber *> *)colors {
    NSInteger zero = -1, one = -1, two = -1;
    for (NSUInteger i=0; i<colors.count; i++) {
        if ([colors[i] isEqualToNumber:@(0)]) {
            colors[++two] = @(2); colors[++one] = @(1); colors[++zero] = @(0);
        } else if ([colors[i] isEqualToNumber:@(1)]) {
            colors[++two] = @(2); colors[++one] = @(1);
        } else if ([colors[i] isEqualToNumber:@(2)]) {
            colors[++two] = @(2);
        }
    }
}

// Best solution, O(NLog(k))
- (void)sortColors2:(NSMutableArray<NSNumber *> *)colors k:(NSUInteger)k {
    // key idea: binary
    if (!colors) return;
    [self rainbowSort:colors start:0 end:colors.count-1 colorFrom:1 colorTo:k];
}

- (void)rainbowSort:(NSMutableArray<NSNumber *> *)colors
              start:(NSUInteger)start end:(NSUInteger)end
          colorFrom:(NSUInteger)colorFrom colorTo:(NSUInteger)colorTo {
    if (start >= end) return;
    if (colorFrom == colorTo) return;
    // find the middle value
    NSUInteger colorMid = colorFrom + (colorTo-colorFrom)/2;
    NSUInteger s=start, e=end;
    while (s <= e) {
        while (s<=e && colors[s].unsignedIntegerValue <= colorMid) s++;
        while (s<=e && colors[e].unsignedIntegerValue > colorMid) e--;
        if (s <= e) {
            [colors exchangeObjectAtIndex:s withObjectAtIndex:e];
            s++;
            e--;
        }
    }
    [self rainbowSort:colors start:start end:e colorFrom:colorFrom colorTo:colorMid];
    [self rainbowSort:colors start:s end:end colorFrom:colorMid+1 colorTo:colorTo];
}

@end
