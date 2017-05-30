//
//  LinkedListNode.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 24/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "LinkedListNode.h"

@implementation LinkedListNode

+ (LinkedListNode *)nodeWithValue:(id)value {
    LinkedListNode *node = [LinkedListNode new];
    node.value = value;
    return node;
}

+ (LinkedListNode *)listFromArray:(NSArray *)array {
    if (!array) {
        return nil;
    }
    LinkedListNode *head = [LinkedListNode nodeWithValue:nil];
    LinkedListNode *tail = head;
    for (NSNumber *value in array) {
        tail.next = [LinkedListNode nodeWithValue:value];
        tail = tail.next;
    }
    return head.next;
}

- (NSString *)description {
    NSMutableArray<NSNumber *> *values = [NSMutableArray array];
    LinkedListNode *head = self;
    while (head) {
        [values addObject:head.value];
        head = head.next;
    }
    return [NSString stringWithFormat:@"\n%@", [values componentsJoinedByString:@"->"]];
}

@end
