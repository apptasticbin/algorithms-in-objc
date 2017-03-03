//
//  MergeKLists.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 03/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MergeKLists.h"

@implementation MergeKLists

- (ListNode *)mergeKLists:(NSArray<ListNode *> *)lists {
    if (lists == nil) return nil;
    return [self mergeHelper:lists start:0 end:lists.count-1];
}

- (ListNode *)mergeHelper:(NSArray<ListNode *> *)lists
                    start:(NSInteger)start end:(NSInteger)end {
    if (start == end) return lists[start];
    NSInteger mid = start + (end - start)/2;
    ListNode *left = [self mergeHelper:lists start:start end:mid];
    ListNode *right = [self mergeHelper:lists start:mid+1 end:end];
    return [self mergeList:left andList:right];
}

- (ListNode *)mergeList:(ListNode *)list1 andList:(ListNode *)list2 {
    // fake merged head; the real head is merged.next
    ListNode *fakeHead = [ListNode nodeWithValue:0];
    ListNode *tail = fakeHead;
    while(list1 && list2) {
        // here I assume that we have ascending order lists
        if (list1.value <= list2.value) {
            tail.next = list1;
            tail = list1;
            list1 = list1.next;
        } else {
            tail.next = list2;
            tail = list2;
            list2 = list2.next;
        }
    }
    if (list1) tail.next = list1;
    else tail.next = list2;
    return fakeHead.next;
}

@end
