//
//  MinimumDepth.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MinimumDepth.h"

@implementation MinimumDepth

- (NSUInteger)minDepthDFS:(Tree *)root {
    if (root == nil) return 0;
    if (!root.left) return [self minDepthDFS:root.right]+1;
    if (!root.right) return [self minDepthDFS:root.left]+1;
    return MIN([self minDepthDFS:root.left], [self minDepthDFS:root.right])+1;
}

// Idea: return when first time meeting a "leaf node"
- (NSUInteger)minDepthBFS:(Tree *)root {
    if (root == nil) return 0;
    NSUInteger depth = 0;
    NSMutableArray<Tree *> *queue = [NSMutableArray array];
    [queue addObject:root];
    while (queue.count) {
        depth += 1;
        NSUInteger size = queue.count;
        NSMutableArray<Tree *> *newNodes = [NSMutableArray array];
        for (NSInteger i=0; i<size; i++) {
            Tree *node = queue[i];
            if (node.left == nil && node.right == nil) return depth;
            if (node.left) [newNodes addObject:node.left];
            if (node.right) [newNodes addObject:node.right];
        }
        [queue removeAllObjects];
        [queue addObjectsFromArray:newNodes];
    }
    return depth;
}

@end
