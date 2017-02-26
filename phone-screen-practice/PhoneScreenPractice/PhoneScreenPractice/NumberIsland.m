//
//  NumberIsland.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 25/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "NumberIsland.h"

@implementation NumberIsland

// Very tradiional DFS question.
// find '1's, each time we find unvisited '1', do DFS to mark all neighbour '1's as visited, and count++
// http://www.jiuzhang.com/solutions/number-of-islands/
-(NSUInteger)dfsNumIslands:(NSArray<NSArray<NSNumber *> *> *)grid {
    NSUInteger m = grid.count;
    if (m == 0) return 0;
    NSUInteger n = grid[0].count;
    NSUInteger count = 0;
    NSMutableSet<NSValue *> *visited = [NSMutableSet set];
    for (NSUInteger i=0; i<m; i++) {
        for (NSUInteger j=0; j<n; j++) {
            // NOTICE: should be valueWithCGPoint in iOS
            NSValue *pos = [NSValue valueWithPoint:CGPointMake(i, j)];
            if (![visited containsObject:pos]) {
                count++;
                [self DFS:grid i:i j:j m:m n:n visited:visited];
            }
        }
    }
    return count;
}

// https://www.tutorialspoint.com/objective_c/objective_c_passing_arrays_to_functions.htm
-(void)DFS:(NSArray<NSArray<NSNumber *> *> *)grid i:(NSInteger)i j:(NSInteger)j
         m:(NSUInteger)m n:(NSUInteger)n visited:(NSMutableSet<NSValue *> *) visited {
    if (i<0 || i>m-1 || j<0 || j>n-1) return;
    if ([grid[i][j] isEqualToNumber:@(0)]) return;
    // check if this land has been visited or not
    // NOTICE: should be valueWithCGPoint in iOS
    NSValue *pos = [NSValue valueWithPoint:CGPointMake(i, j)];
    if ([visited containsObject:pos]) return;
    // if not visited yet, mark it as visited
    [visited addObject:pos];
    // now go deeper to it's neighbors: up, down, left, right
    [self DFS:grid i:i+1 j:j m:m n:m visited:visited];
    [self DFS:grid i:i j:j+1 m:m n:m visited:visited];
    [self DFS:grid i:i-1 j:j m:m n:m visited:visited];
    [self DFS:grid i:i j:j-1 m:m n:m visited:visited];
}

@end
