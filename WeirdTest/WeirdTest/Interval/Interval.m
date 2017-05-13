//
//  Interval.m
//  WeirdTest
//
//  Created by Bin Yu on 13/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "Interval.h"

@implementation Interval

+ (instancetype)intervalWithStart:(NSInteger)start end:(NSInteger)end {
    Interval *instance = [Interval new];
    instance.start = start;
    instance.end = end;
    return instance;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"[%@, %@]", @(self.start), @(self.end)];
}

@end
