//
//  LRUCache.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 28/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "LRUCache.h"
#import "DoubleLinkedListNode.h"

@interface LRUCache ()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, DoubleLinkedListNode *> *cache;
@property (nonatomic, strong) DoubleLinkedListNode *head;
@property (nonatomic, strong) DoubleLinkedListNode *tail;
@property (nonatomic, assign) NSInteger capacity;

@end

@implementation LRUCache

- (instancetype)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        _cache = [NSMutableDictionary dictionary];
        
        _head = [DoubleLinkedListNode nodeWithKey:nil value:nil];
        _tail = [DoubleLinkedListNode nodeWithKey:nil value:nil];
        _head.next = _tail;
        _tail.previous = _head;
        
        _capacity = capacity;
    }
    return self;
}

- (instancetype)init {
    return [self initWithCapacity:0];
}

- (NSNumber *)getValueOfKey:(NSNumber *)key {
    if (self.cache[key]) {
        DoubleLinkedListNode *node = self.cache[key];
        [node removeFromCurrentList];
        [node addAfterNode:self.head];
        return node.value;
    }
    return nil;
}

- (void)putKey:(NSNumber *)key withValue:(NSNumber *)value {
    DoubleLinkedListNode *node = self.cache[key];
    if (node) {
        [node removeFromCurrentList];
        [node addAfterNode:self.head];
        node.value = value;
    } else {
        node = [DoubleLinkedListNode nodeWithKey:key value:value];
        self.cache[key] = node;
        [node addAfterNode:self.head];
        
        if (self.cache.count > self.capacity) {
            DoubleLinkedListNode *last = self.tail.previous;
            [last removeFromCurrentList];
            [self.cache removeObjectForKey:last.key];
        }
    }
}

@end
