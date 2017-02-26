//
//  RemoveInvalidParentheses.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 25/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "RemoveInvalidParentheses.h"

@implementation RemoveInvalidParentheses

- (NSArray<NSString *> *)removeInvalidParentheses:(NSString *)s {
    if (s == nil) return nil;
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    NSMutableArray<NSString *> *queue = [NSMutableArray array];
    NSMutableSet<NSString *> *visited = [NSMutableSet set];
    BOOL found = NO;
    [queue addObject:s];
    while (queue.count) {
        NSString *front = queue.firstObject;
        [queue removeObjectAtIndex:0];
        if ([self isValid:front]) {
            found = YES;
            [results addObject:front];
        }
        // if this node is valid, it's children MUST be invalid, due to removing one more parenthese.
        if (found) continue;
        for (NSUInteger i=0; i<front.length; i++) {
            if (![self isParenthesis:[front characterAtIndex:i]]) continue;
            NSMutableString *mutableFront = [front mutableCopy];
            [mutableFront deleteCharactersInRange:NSMakeRange(i,1)];
            if (![visited containsObject:mutableFront]) {
                [visited addObject:mutableFront];
                [queue addObject:mutableFront];
            }
        }
    }
    return results;
}

- (BOOL)isValid:(NSString *)s {
    NSInteger count = 0;
    for (NSUInteger i=0; i<s.length; i++) {
        if ([s characterAtIndex:i] == '(') {
            count++;
        } else if ([s characterAtIndex:i] == ')') {
            count--;
        }
        if (count < 0) return NO;
    }
    return YES;
}

- (BOOL)isParenthesis:(unichar)c {
    return c == '(' || c == ')';
}

@end
