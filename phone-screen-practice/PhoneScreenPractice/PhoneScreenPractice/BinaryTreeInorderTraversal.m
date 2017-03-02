//
//  BinaryTreeInorderTraversal.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BinaryTreeInorderTraversal.h"

@implementation BinaryTreeInorderTraversal

- (NSArray<NSNumber *> *)inorderTraversalRecursive:(Tree *)root {
    if (root == nil) return @[];
    NSArray<NSNumber *> *leftNodes = [self inorderTraversalRecursive:root.left];
    NSArray<NSNumber *> *rightNodes = [self inorderTraversalRecursive:root.right];
    NSNumber *rootValue = @(root.value);
    
    NSArray *result = [leftNodes arrayByAddingObject:rootValue];
    result = [result arrayByAddingObjectsFromArray:rightNodes];
    return result;
}

- (NSArray<NSNumber *> *)inorderTraversalInterative:(Tree *)root {
    if (root == nil) return nil;
    NSMutableArray<Tree *> *stack = [NSMutableArray array];
    NSMutableArray<NSNumber *> *results = [NSMutableArray array];
    
    [stack addObject:root];
    while (stack.count) {
        Tree *top = stack.lastObject;
        // if there is still left node, push it, mark it's parent's left node as nil
        if (top.left) {
            [stack addObject:top.left];
            top.left = nil;
            continue;
        }
        // if no left node, add to results
        [results addObject:@(top.value)];
        // check right node now
        if (top.right) {
            [stack addObject:top.right];
            top.right = nil;
            continue;
        }
        [stack removeLastObject];
    }
    return results;
}

// If interviewer doesn't allow to change the tree, we use visited flag instead(Tree is special Graph)
// Or, we can use a "current node" pointer
- (NSArray<NSNumber *> *)inorderTraversalInterativeBetter:(Tree *)root {
    if (root == nil) return nil;
    NSMutableArray<Tree *> *stack = [NSMutableArray array];
    NSMutableArray<NSNumber *> *results = [NSMutableArray array];
    Tree *current = root;
    
    while (stack.count || current) {
        if (current) {
            [stack addObject:current];
            current = current.left;
        } else {
            Tree *top = stack.lastObject;
            [results addObject:@(top.value)];
            [stack removeLastObject];
            current = top.right;
        }
    }
    return results;
}

@end
