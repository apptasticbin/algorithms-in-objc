//
//  PaintHouses.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "PaintHouses.h"

@implementation PreviousMinimumCost

+ (instancetype)empty {
    return [self cost:NSUIntegerMax color:0];
}

+ (instancetype)cost:(NSUInteger)cost color:(NSUInteger)color {
    PreviousMinimumCost *minCost = [self new];
    minCost.cost = cost;
    minCost.color = color;
    return minCost;
}

@end

@implementation PaintHouses

// Dynamic Programming question
// After thinking, this question is similar to "best time of sell stock" question
// For each house, we have three choices: paint red, blue and green
// we use three arrays for tracking three DP lines
// http://www.cnblogs.com/grandyang/p/5319384.html
- (NSUInteger)minCost:(NSUInteger [][3])costs n:(NSUInteger)n {
    // three status for painting ith house
    NSUInteger red[n+1], blue[n+1], green[n+1];
    red[0] = blue[0] = green[0] = NSUIntegerMax;
    for (NSUInteger i=1; i<n+1; i++) {
        // if the ith house painted into red color, then (i-1)th house must be blue or green
        red[i] = MIN(blue[i-1]+costs[i][0], green[i-1]+costs[i][0]);
        blue[i] = MIN(red[i-1]+costs[i][1], green[i-1]+costs[i][1]);
        green[i] = MIN(red[i-1]+costs[i][2], blue[i-1]+costs[i][2]);
    }
    return MIN(red[n], MIN(blue[n], green[n]));
}

- (NSUInteger)minCostInPlace:(NSUInteger [][3])costs n:(NSUInteger)n {
    for (NSUInteger i=1; i<n; i++) {
        costs[i][0] += MIN(costs[i-1][1], costs[i-1][2]);
        costs[i][1] += MIN(costs[i-1][0], costs[i-1][2]);
        costs[i][2] += MIN(costs[i-1][0], costs[i-1][1]);
    }
    return MIN(MIN(costs[n-1][0], costs[n-1][1]), costs[n-1][2]);
}

- (NSUInteger)minCostII:(NSUInteger **)costs n:(NSUInteger)n k:(NSUInteger)k {
    NSUInteger dp[n+1][k];
    memset(dp, 0, sizeof(dp));
    // "now" calculates three most minimum cost for ith house among k colors
    // then "last" store these value for calculating (i+1)th house
    NSMutableArray<PreviousMinimumCost *> *now = [NSMutableArray array];
    NSArray<PreviousMinimumCost *> *last = nil;
    [now addObject:[PreviousMinimumCost empty]];
    [now addObject:[PreviousMinimumCost empty]];
    [now addObject:[PreviousMinimumCost empty]];
    
    for (NSUInteger i=1; i<=n; i++) {
        last = [now copy];
        now[0] = [PreviousMinimumCost empty];
        now[1] = [PreviousMinimumCost empty];
        for (NSUInteger j=0; j<k; j++) {
            // current color is different from last color
            if (j != last[0].color) {
                dp[i][j] = dp[i-1][last[0].color] + costs[i-1][j];
            } else {
                dp[i][j] = dp[i-1][last[1].color] + costs[i-1][j];
            }
            now[2] = [PreviousMinimumCost cost:dp[i][j] color:j];
            NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"cost" ascending:NO];
            [now sortUsingDescriptors:@[sortDescriptor]];
        }
    }
    return now[0].cost;
}


@end
