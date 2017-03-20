//
//  FindDistanceBetweenTwoNodesInTree.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 20/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "FindDistanceBetweenTwoNodesInTree.h"

@implementation FindDistanceBetweenTwoNodesInTree

- (Tree *)findLCAOfNode:(Tree *)node1 andNode:(Tree *)node2 inTree:(Tree *)root {
    if (root == nil) {
        return nil;
    }
    if (root == node1 || root == node2) {
        return root;
    }
    Tree *foundInLeft = [self findLCAOfNode:node1 andNode:node2 inTree:root.left];
    Tree *foundInRight = [self findLCAOfNode:node1 andNode:node2 inTree:root.right];
    if (foundInLeft && foundInRight) {
        return root;
    }
    if (foundInLeft) {
        return foundInLeft;
    }
    if (foundInRight) {
        return foundInRight;
    }
    return nil;
}

- (NSUInteger)pathLengthBetweenTreeRoot:(Tree *)root toNode:(Tree *)node {
    if (root == nil || node == nil) {
        return 0;
    }
    if (root == node) {
        return 1;
    }
    NSUInteger distance = [self pathLengthBetweenTreeRoot:root.left toNode:node];
    if (distance > 0) {
        return distance + 1;
    }
    
    distance = [self pathLengthBetweenTreeRoot:root.right toNode:node];
    if (distance > 0) {
        return distance + 1;
    }
    return 0;
}

- (NSUInteger)findDistanceBetweenNode:(Tree *)node1 andNode:(Tree *)node2 inTree:(Tree *)root {
    if (root == nil || node1 == nil || node2 == nil) {
        return 0;
    }
    Tree *lca = [self findLCAOfNode:node1 andNode:node2 inTree:root];
    NSUInteger distBetweenNode1AndRoot = [self pathLengthBetweenTreeRoot:root toNode:node1] - 1;
    NSUInteger distBetweenNode2AndRoot = [self pathLengthBetweenTreeRoot:root toNode:node2] - 1;
    NSUInteger distBetweenLCAAndRoot = [self pathLengthBetweenTreeRoot:root toNode:lca] - 1;
    return distBetweenNode1AndRoot + distBetweenNode2AndRoot - 2 * distBetweenLCAAndRoot;
}

@end
