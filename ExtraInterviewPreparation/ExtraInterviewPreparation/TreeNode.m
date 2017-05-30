//
//  TreeNode.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 24/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)copyWithZone:(NSZone *)zone {
    TreeNode *copy = [[self class] new];
    if (copy) {
        copy.value = self.value;
        copy.left = [self.left copyWithZone:zone];
        copy.right = [self.right copyWithZone:zone];
    }
    return copy;
}

+ (TreeNode *)treeNodeWithValue:(NSNumber *)value {
    TreeNode *treeNode = [TreeNode new];
    treeNode.value = value;
    return treeNode;
}

+ (TreeNode *)treeFromArray:(NSArray<NSNumber *> *)array {
    if (!array || !array.count) {
        return nil;
    }
    
    NSMutableArray<TreeNode *> *queue = [NSMutableArray array];
    NSInteger index = 1;
    
    TreeNode *root = [TreeNode treeNodeWithValue:array[0]];
    [queue addObject:root];
    
    while (index < array.count && queue.count) {
        TreeNode *top = queue.firstObject;
        if (top.left && top.right) {
            [queue removeObjectAtIndex:0];
            continue;
        }
        
        if (!top.left) {
            top.left = [TreeNode treeNodeWithValue:array[index]];
            [queue addObject:top.left];
        } else if (!top.right) {
            top.right = [TreeNode treeNodeWithValue:array[index]];
            [queue addObject:top.right];
        }
        index++;
    }
    return root;
}

- (NSString *)description {
    NSMutableArray<TreeNode *> *queue = [NSMutableArray array];
    NSMutableArray<NSArray<NSNumber *> *> *levels = [NSMutableArray array];
    [queue addObject:self];
    
    while (queue.count) {
        NSUInteger size = queue.count;
        NSMutableArray<NSNumber *> *level = [NSMutableArray array];
        for (NSUInteger i = 0; i < size; i++) {
            TreeNode *node = queue[i];
            [level addObject:node.value];
            
            if (node.left) {
                [queue addObject:node.left];
            }
            
            if (node.right) {
                [queue addObject:node.right];
            }
        }
        [levels addObject:[level copy]];
        [queue removeObjectsInRange:NSMakeRange(0, size)];
    }
    
    NSMutableArray<NSString *> *levelStrings = [NSMutableArray array];
    for (NSArray<NSNumber *> *level in levels) {
        NSString *levelString = [level componentsJoinedByString:@" "];
        [levelStrings addObject:levelString];
    }
    return [NSString stringWithFormat:@"\n%@", [levelStrings componentsJoinedByString:@"\n"]];
}

@end
