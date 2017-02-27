//
//  BalanceParentheses.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BalanceParentheses.h"

@implementation BalanceParentheses

- (NSString *)balanceParentheses:(NSString *)input {
    // use stack to mark the index of '('. pop top when meeting ')'
    NSString *result = [self removeRightParentheses:input];
    result = [self removeLeftParentheses:result];
    return result;
}

- (NSString *)removeRightParentheses:(NSString *)input {
    NSInteger count = 0;
    NSMutableString *result = [NSMutableString string];
    for (NSInteger i=0; i<input.length; i++) {
        unichar c = [input characterAtIndex:i];
        [result appendFormat:@"%C", c];
        if (c == '(') count++;
        else if (c == ')') {
            if (count > 0) count--;
            else [result deleteCharactersInRange:NSMakeRange(input.length-1, 1)];
        }
    }
    return result;
}

- (NSString *)removeLeftParentheses:(NSString *)input {
    NSInteger count = 0;
    NSMutableString *result = [NSMutableString string];
    for (NSInteger i=input.length-1; i>=0; i--) {
        unichar c = [input characterAtIndex:i];
        [result insertString:[NSString stringWithFormat:@"%C", c] atIndex:0];
        if (c == ')') count++;
        else if (c == '(') {
            if (count > 0) count--;
            else [result deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }
    return result;
}

// TODO
- (NSString *)balanceParenthesesOnePass:(NSString *)input {
    return nil;
}

@end
