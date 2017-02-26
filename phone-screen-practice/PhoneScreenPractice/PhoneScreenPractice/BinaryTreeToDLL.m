//
//  BinaryTreeToDLL.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 23/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BinaryTreeToDLL.h"

@implementation BinaryTreeToDLL

- (Tree *)doubleLinkedListFromBinaryTree:(Tree *)root {
    if (root == nil) return nil;
    if (root.left) {
        Tree *left = [self doubleLinkedListFromBinaryTree:root.left];
        Tree *leftTail = [self findTailOfList:left];
        leftTail.right = root;
        root.left = leftTail;
    }
    if (root.right) {
        Tree *right = [self doubleLinkedListFromBinaryTree:root.right];
        Tree *rightHead = [self findHeadOfList:right];
        root.right = rightHead;
        rightHead.left = root;
    }
    return root;
}

- (Tree *)findHeadOfList:(Tree *)node {
    if (!node) return nil;
    while(node.left) node = node.left;
    return node;
}

- (Tree *)findTailOfList:(Tree *)node {
    if (!node) return nil;
    while(node.right) node = node.right;
    return node;
}

- (Tree *)simpleDoubleLinkedListFromBinaryTree:(Tree *)root {
    Tree *head = nil;
    [self rightToLeftBuilder:root head:&head];
    return head;
}

- (void)rightToLeftBuilder:(Tree *)root head:(Tree * __autoreleasing *)head {
    // base case
    if (root == nil) return;
    [self rightToLeftBuilder:root.right head:head];
    
    root.right = *head;
    if (*head != nil) (*head).left = root;
    *head = root;
    
    [self rightToLeftBuilder:root.left head:head];
}

@end
