//
//  ConvertSortedListToBST.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ConvertSortedListToBST.h"

@implementation ConvertSortedListToBST

// Idea: double runner, find middle value, then split the linked list into two parts, recursion
// Ask interviewer: type of value? size of linked list? duplicates?
// NOTICE: DO NOT change the original list.
// [1, 2, 3, 4, 5, 6, 7]
- (Tree *)sortedListToBST:(ListNode *)head {
    if (head == nil) return nil;
    return [self toBST:head tail:nil];
}

- (Tree *)toBST:(ListNode *)head tail:(ListNode *)tail {
    if (head.next == tail) return [Tree nodeWithValue:head.value];
    // create runners
    ListNode *slow = head;
    ListNode *fast = head;
    while (fast != tail && fast.next != tail) {
        fast = fast.next.next;
        slow = slow.next;
    }
    // now slow is the root of the BST
    Tree *root = [Tree nodeWithValue:slow.value];
    root.left = [self toBST:head tail:slow];
    root.right = [self toBST:slow.next tail:tail];
    return root;
}

@end
