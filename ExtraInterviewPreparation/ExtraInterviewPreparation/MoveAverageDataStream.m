//
//  MoveAverageDataStream.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 28/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MoveAverageDataStream.h"

@interface MoveAverageDataStream ()

@property (nonatomic, assign) NSUInteger capacity;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *queue;
@property (nonatomic, assign) NSInteger sum;

@end

@implementation MoveAverageDataStream

- (instancetype)initWithCapacity:(NSUInteger)capacity {
    self = [super init];
    if (self) {
        _capacity = capacity;
        _queue = [NSMutableArray array];
        _sum = 0;
    }
    return self;
}

- (NSInteger)next:(NSInteger)newValue {
    [self.queue addObject:@(newValue)];
    self.sum += newValue;
    if (self.queue.count > self.capacity) {
        self.sum -= self.queue.firstObject.integerValue;
        [self.queue removeObjectAtIndex:0];
    }
    return self.sum / self.queue.count;
}

@end
