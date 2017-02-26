//
//  LowestCommonAncestor.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 24/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "LowestCommonAncestor.h"

@implementation LowestCommonAncestor

// O(N^2) for worst case
- (Tree *)LCAOfBinaryTree:(Tree *)root node1:(Tree *)node1 node2:(Tree *)node2 {
    if (!root || !node1 || !node2) return nil;
    if (root == node1 || root == node2) return root;
    BOOL node1InLeft = [self findNode:node1 inTree:root.left];
    BOOL node2InLeft = [self findNode:node2 inTree:root.left];
    if (node1InLeft != node2InLeft) return root;
    if (node1InLeft) return [self LCAOfBinaryTree:root.left node1:node1 node2:node2];
    return [self LCAOfBinaryTree:root.right node1:node1 node2:node2];
}

- (BOOL)findNode:(Tree *)node inTree:(Tree *)root {
    if (root == nil || node == nil) return NO;
    if (node == root) return YES;
    return [self findNode:node inTree:root.left] ||
    [self findNode:node inTree:root.right];
}

// O(N) worst case
- (Tree *)bottomUpLCAOfBinaryTree:(Tree *)root node1:(Tree *)node1 node2:(Tree *)node2 {
    if (root == nil) return nil;
    if (root == node1 || root == node2) return root;
    Tree *foundL = [self bottomUpLCAOfBinaryTree:root.left node1:node1 node2:node2];
    Tree *foundR = [self bottomUpLCAOfBinaryTree:root.right node1:node1 node2:node2];
    if (foundL && foundR) return root;
    return foundL ? foundL : foundR;
}

@end
