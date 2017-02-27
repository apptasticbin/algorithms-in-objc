//
//  BinaryTreeLevelOrderTraversal.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BinaryTreeLevelOrderTraversal.h"

@implementation BinaryTreeLevelOrderTraversal

- (NSArray<NSArray<NSNumber *> *> *)levelOrder:(Tree *)root {
    if (root == nil) return nil;
    
    NSMutableArray<Tree *> *queue = [NSMutableArray array];
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    
    [queue addObject:root];
    while (queue.count) {
        NSMutableArray<NSNumber *> *level = [NSMutableArray array];
        NSUInteger size = queue.count;
        for (NSUInteger i=0; i<size; i++) {
            Tree *node = queue.firstObject;
            [level addObject:@(node.value)];
            if (node.left) [queue addObject:node.left];
            if (node.right) [queue addObject:node.right];
        }
        // NOTICE: because NSMutableArray is not Queue,
        // we CAN NOT remove object at index during iterating the array.
        // instead, we remove them together later.
        [queue removeObjectsInRange:NSMakeRange(0,size)];
        [results addObject:level];
    }
    return results;
}

@end
