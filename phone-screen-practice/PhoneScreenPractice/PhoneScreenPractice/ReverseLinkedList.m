//
//  ReverseLinkedList.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ReverseLinkedList.h"

@implementation ReverseLinkedList

- (ListNode *)reverseList:(ListNode *)head {
    if (head == nil || head.next == nil) return head;
    ListNode *next = head.next;
    ListNode *reversedHead = [self reverseList:head.next];
    next.next = head;
    head.next = nil;
    return reversedHead;
}

@end
