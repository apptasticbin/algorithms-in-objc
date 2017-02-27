//
//  FlattenNestedListIterator.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "FlattenNestedListIterator.h"

@interface NestedInteractor ()

@property (nonatomic, strong) NSMutableArray<NSNumber *> *queue;
@property (nonatomic, strong) NSArray<NestedInteger *> *nums;
@property (nonatomic, assign) NSUInteger idx;

@end

@implementation NestedInteractor

- (instancetype)initWithNums:(NSArray<NestedInteger *> *)nums {
    self = [super init];
    if (self) {
        _queue = [NSMutableArray array];
        _nums = nums;
        _idx = 0;
    }
    return self;
}

- (NSNumber *)next {
    if ([self hasNext]) {
        if (self.queue.count) {
            NSNumber *front = self.queue.firstObject;
            [self.queue removeObjectAtIndex:0];
            return front;
        } else {
            [self push:self.nums[self.idx++]];
            return [self next];
        }
    }
    return nil;
}


- (BOOL)hasNext {
    return self.idx < self.nums.count || self.queue.count > 0;
}

#pragma mark - Private

- (void)push:(NestedInteger *)nestedInteger {
    if ([nestedInteger isInteger]) {
        [self.queue addObject:[nestedInteger getInteger]];
    } else {
        NSArray<NestedInteger *> *list = [nestedInteger getList];
        for (NSUInteger i=0; i<list.count; i++) {
            [self push:list[i]];
        }
    }
}

@end
