//
//  BinaryTreeLayerAverage.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 22/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BinaryTreeLayerAverage.h"

@implementation BinaryTreeLayerAverage

// Ask interviewer: sort output? binary search tree? fraction number?
- (NSArray *)averageValuesOfLayers:(Tree *)root {
    if (root == nil) return nil;
    // using NSMutableArray to simulate queue operations
    NSMutableArray<NSNumber *> *averageValues = [NSMutableArray array];
    NSMutableArray<Tree *> *queue = [NSMutableArray array];
    [queue addObject:root];
    
    while (queue.count) {
        // store the size of each layer
        NSUInteger size = queue.count;
        NSMutableArray *layer = [NSMutableArray array];
        for (NSUInteger i=0; i<size; i++) {
            Tree *node = queue[i];
            [layer addObject:@(node.value)];
        }
        // http://nshipster.com/kvc-collection-operators/
        NSNumber *layerAverageValue = [layer valueForKeyPath:@"@avg.doubleValue"];
        [averageValues addObject:layerAverageValue];
    }
    
    return averageValues;
}

@end
