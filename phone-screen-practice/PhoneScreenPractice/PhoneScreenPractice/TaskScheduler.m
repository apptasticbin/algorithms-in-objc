//
//  TaskScheduler.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "TaskScheduler.h"

@implementation TaskScheduler

- (NSString *)bestTaskSequenceForTasks:(NSString *)sequence interval:(NSUInteger)interval {
    if (sequence == nil || sequence.length == 0) return nil;
    // mark the latest timeout for tasks
    NSMutableDictionary<NSString *, NSNumber *> * timeouts = [NSMutableDictionary dictionary];
    NSMutableString *result = [NSMutableString string];
    NSInteger time = 0;
    NSInteger pos = 0;
    while (pos < sequence.length) {
        NSString *task = [sequence substringWithRange:NSMakeRange(pos,1)];
        if (!timeouts[task]) {
            timeouts[task] = @(time+interval+1);
            [result appendString:task];
            pos++;
        } else {
            NSInteger nextStart = timeouts[task].integerValue;
            if (time >= nextStart) {
                timeouts[task] = @(time+interval+1);
                [result appendString:task];
                pos++;
            } else {
                [result appendString:@"_"];
            }
        }
        // always move forward the time pointer, to simulate the time ticking
        time++;
    }
    return result;
}

@end
