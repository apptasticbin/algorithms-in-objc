//
//  NestedArrayIterator.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 24/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "NestedArrayIterator.h"

@interface NestedArrayIterator ()

@property (nonatomic, strong) NSArray *nestedArray;
@property (nonatomic, strong) NSMutableArray *stack;
@property (nonatomic, strong) NSMutableArray *allObjectsCache;
@property (nonatomic, assign) BOOL hasAllObjects;

@end

@implementation NestedArrayIterator

#pragma mark - Public

- (instancetype)initWithNestedArray:(NSArray *)nestedArray {
    self = [super init];
    if (self) {
        _nestedArray = nestedArray;
        _allObjectsCache = [NSMutableArray array];
        if (_nestedArray) {
            _stack = [NSMutableArray arrayWithArray:nestedArray.reverseObjectEnumerator.allObjects];
        }
        _hasAllObjects = NO;
    }
    return self;
}

- (NSNumber *)next {
    if ([self hasNext]) {
        NSNumber *nextNumber = self.stack.lastObject;
        [self.allObjectsCache addObject:nextNumber];
        [self.stack removeLastObject];
        return nextNumber;
    }
    return nil;
}

- (NSArray *)allObjects {
    if (self.hasAllObjects) {
        return [self.allObjectsCache copy];
    }
    NSMutableArray *cloneStack = [self.stack mutableCopy];
    while (cloneStack.count) {
        id next = cloneStack.lastObject;
        [cloneStack removeLastObject];
        if ([next isKindOfClass:[NSArray class]]) {
            NSArray *nextArray = next;
            [cloneStack addObjectsFromArray:nextArray.reverseObjectEnumerator.allObjects];
        } else {
            NSNumber *nextNumber = next;
            [self.allObjectsCache addObject:nextNumber];
        }
    }
    self.hasAllObjects = YES;
    return [self.allObjectsCache copy];
}

- (void)reset {
    self.stack = [NSMutableArray arrayWithArray:self.nestedArray.reverseObjectEnumerator.allObjects];
}

#pragma mark - Private

- (BOOL)hasNext {
    if (!self.nestedArray || !self.stack || !self.stack.count) {
        return NO;
    }
    while ([self.stack.lastObject isKindOfClass:[NSArray class]]) {
        NSArray *nextArray = self.stack.lastObject;
        [self.stack removeLastObject];
        [self.stack addObjectsFromArray:nextArray.reverseObjectEnumerator.allObjects];
    }
    return YES;
}

@end
