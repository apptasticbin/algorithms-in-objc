//
//  BinaryTreeVerticalOrderTraversal.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 03/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BinaryTreeVerticalOrderTraversal.h"

@implementation BinaryTreeVerticalOrderTraversal

- (NSArray<NSArray<NSNumber *> *> *)verticalOrder:(Tree *)root {
    if (root == nil) return nil;
    NSInteger min = 0, max = 0;
    
    NSMutableDictionary<NSNumber *, NSMutableArray<NSNumber *> *> *columns = [NSMutableDictionary dictionary];
    [self helper:root distance:0 min:&min max:&max results:columns];
    
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    for (NSInteger i=min; i<=max; i++) {
        [results addObject:columns[@(i)]];
    }
    return results;
}

- (void)helper:(Tree *)root distance:(NSInteger)distance
           min:(NSInteger *)min max:(NSInteger *)max
       results:(NSMutableDictionary<NSNumber *, NSMutableArray<NSNumber *> *> *)results {
    if (root == nil) return;
    if (!results[@(distance)]) {
        results[@(distance)] = [NSMutableArray array];
    }
    
    // add current value into its column
    [results[@(distance)] addObject:@(root.value)];
    // update min and max distance
    *min = MIN(root.value, *min);
    *max = MAX(root.value, *max);
    
    // go left and right
    [self helper:root.left distance:distance-1 min:min max:max results:results];
    [self helper:root.right distance:distance+1 min:min max:max results:results];
}

@end
