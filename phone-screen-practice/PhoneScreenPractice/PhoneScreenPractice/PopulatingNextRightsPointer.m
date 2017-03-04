//
//  PopulatingNextRightsPointer.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "PopulatingNextRightsPointer.h"

@implementation PopulatingNextRightsPointer

// Ask interviewer: contant space includes call stack space?
- (void)connectConstantSpaceForPerfectTree:(TreeLinkNode *)root {
    // because the tree is perfect binary tree,
    // so we know that if root has left tree, it MUST has right tree
    if (root == nil) return;
    if (root.left != nil) {
        root.left.next = root.right;
        if (root.next != nil) {
            root.right.next = root.next.left;
        }
    }
    [self connectConstantSpaceForPerfectTree:root.left];
    [self connectConstantSpaceForPerfectTree:root.right ];
}

- (void)connectConstantSpaceForAnyTree:(TreeLinkNode *)root {
    // we use dummy head as the dummy head of current level
    // pre as the runner pointer for this level
    TreeLinkNode *dummyHead = [TreeLinkNode new];
    TreeLinkNode *cur = dummyHead;
    while (root != nil) {
        if (root.left) {
            // if root has left node, then we link it with its left node (dummy node for the most left one)
            cur.next = root.left;
            cur = cur.next;
        }
        if (root.right) {
            cur.next = root.right;
            cur = cur.next;
        }
        root = root.next;
        // when we meet the end or previous level, move root to current level
        if (root == nil) {
            cur = dummyHead;
            root = dummyHead.next;
            dummyHead.next = nil;
        }
    }
}

// NOTICE: this solution is not constant space solution.
- (void)connectBFS:(TreeLinkNode *)root {
    if (root == nil) return;
    NSMutableArray<TreeLinkNode *> *queue = [NSMutableArray array];
    [queue addObject:root];
    while(queue.count) {
        NSInteger size = queue.count;
        for (NSInteger i=0; i<size; i++) {
            TreeLinkNode *top = queue[i];
            if (i+1 < size) {
                TreeLinkNode *next = queue[i+1];
                top.next = next;
            } else {
                top.next = nil;
            }
            if (top.left) [queue addObject:top.left];
            if (top.right) [queue addObject:top.right];
        }
        [queue removeObjectsInRange:NSMakeRange(0, size)];
    }
}

@end
