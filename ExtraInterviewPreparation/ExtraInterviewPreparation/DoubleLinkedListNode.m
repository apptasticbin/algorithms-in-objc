//
//  DoubleLinkedListNode.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 28/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "DoubleLinkedListNode.h"

@implementation DoubleLinkedListNode

+ (instancetype)nodeWithKey:(NSNumber *)key value:(NSNumber *)value {
    DoubleLinkedListNode *node = [DoubleLinkedListNode new];
    node.key = key;
    node.value = value;
    node.next = node.previous = nil;
    return node;
}

+ (instancetype)nodeWithValue:(NSNumber *)value {
    return [self nodeWithKey:nil value:value];
}

+ (instancetype)listWithArray:(NSArray<NSNumber *> *)array {
    DoubleLinkedListNode *head = [DoubleLinkedListNode nodeWithValue:nil];
    DoubleLinkedListNode *tail = head;
    for (NSNumber *number in array) {
        DoubleLinkedListNode *node = [DoubleLinkedListNode nodeWithValue:number];
        [node addAfterNode:tail];
        tail = node;
    }
    return head.next;
}

- (void)addBeforeNode:(DoubleLinkedListNode *)node {
    if (!node) {
        return;
    }
    self.next = node;
    if (node.previous) {
        self.previous = node.previous;
        node.previous.next = self;
    }
    node.previous = self;
}

- (void)addAfterNode:(DoubleLinkedListNode *)node {
    if (!node) {
        return;
    }
    self.previous = node;
    self.next = node.next;
    if (node.next) {
        node.next.previous = self;
    }
    node.next = self;
}

- (void)removeFromCurrentList {
    if (self.next) {
        self.next.previous = self.previous;
    }
    if (self.previous) {
        self.previous.next = self.next;
    }
}

- (NSString *)description {
    NSMutableArray<NSNumber *> *desc = [NSMutableArray array];
    DoubleLinkedListNode *cur = self;
    while (cur) {
        [desc addObject:cur.value];
        cur = cur.next;
    }
    return [NSString stringWithFormat:@"\n%@",[desc componentsJoinedByString:@" <--> "] ];
}

@end
