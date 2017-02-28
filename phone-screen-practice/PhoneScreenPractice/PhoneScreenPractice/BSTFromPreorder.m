//
//  BSTFromPreorder.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BSTFromPreorder.h"

@implementation BSTFromPreorder

// O(N^2)
- (Tree *)BSTFromPreOrderTraversal:(NSArray<NSNumber *> *)preorder {
    if (preorder == nil || preorder.count == 0) return nil;
    NSMutableArray *leftNodes = [NSMutableArray array];
    NSMutableArray *rightNodes = [NSMutableArray array];
    Tree *root = [Tree nodeWithValue:preorder[0].integerValue];
    for (NSInteger i=1; i<preorder.count; i++) {
        if (preorder[i].integerValue <= preorder[0].integerValue) {
            [leftNodes addObject:preorder[i]];
        } else {
            [rightNodes addObject:preorder[i]];
        }
    }
    root.left = [self BSTFromPreOrderTraversal:leftNodes];
    root.right = [self BSTFromPreOrderTraversal:rightNodes];
    return root;
}

// O(N)
- (Tree *)BSTFromPreOrderRecersive:(NSArray<NSNumber *> *)preorder {
    if (preorder == nil || preorder.count == 0) return nil;
    NSUInteger start = 0;
    return [self helper:preorder key:preorder[start] start:&start min:NSIntegerMin max:NSIntegerMax];
}

- (Tree *)helper:(NSArray<NSNumber *> *)preorder key:(NSNumber *)key start:(NSUInteger *)start
             min:(NSInteger)min max:(NSInteger)max {
    if (*start >= preorder.count) return nil;
    Tree *root = nil;
    if (key.integerValue > min && key.integerValue < max) {
        root = [Tree nodeWithValue:key.integerValue];
        (*start)++;
        if (*start < preorder.count) {
            root.left = [self helper:preorder key:preorder[*start] start:start min:min max:key.integerValue];
            root.right = [self helper:preorder key:preorder[*start] start:start min:key.integerValue max:max];
        }
    }
    return root;
}

- (Tree *)BSTFromPreorderStack:(NSInteger [])preorder size:(NSUInteger)size {
    if (preorder == nil || size == 0) return nil;
    
    NSMutableArray<Tree *> *stack = [NSMutableArray array];
    Tree *rootNode = [Tree nodeWithValue:preorder[0]];
    [stack addObject:rootNode];
    
    for (NSInteger i=1; i<size; i++) {
        if (preorder[i] < stack.lastObject.value) {
            // when the current value is less than peek value of stack
            // this means current value is left node if stack peek node
            Tree *root = stack.lastObject;
            Tree *left = [Tree nodeWithValue:preorder[i]];
            root.left = left;
            [stack addObject:left];
        } else {
            // otherwise, the current value will be a right node of previous nodes
            // pop nodes until we find the previous root
            // add current value as right node of previous root
            // then push current node
            Tree *root = nil;
            while (stack.count && preorder[i] > stack.lastObject.value) {
                root = stack.lastObject;
                [stack removeLastObject];
            }
            if (root) {
                Tree *right = [Tree nodeWithValue:preorder[i]];
                root.right = right;
                [stack addObject:right];
            }
        }
    }
    return rootNode;
}


@end
