//
//  BinarySearchTreeIterator.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BinarySearchTreeIterator.h"

@interface BSTIterator ()

@property (nonatomic, strong) NSMutableArray<Tree *> *stack;
@property (nonatomic, strong) Tree *root;
@property (nonatomic, strong) Tree *current;

@end

@implementation BSTIterator

- (instancetype)init:(Tree *)root {
    self = [super init];
    if (self) {
        _stack = [NSMutableArray array];
        _root = root;
        _current = root;
    }
    return self;
}

- (BOOL)hasNext {
    return self.current != nil || self.stack.count != 0;
}

- (NSInteger)next {
    NSAssert([self hasNext], @"No More");
    
    // if the stack is empty, push all left nodes
    while (self.current != nil) {
        [self.stack addObject:self.current];
        self.current = self.current.left;
    }
    Tree *top = self.stack.lastObject;
    [self.stack removeLastObject];
    self.current = self.current.right;
    return top.value;
}

@end
