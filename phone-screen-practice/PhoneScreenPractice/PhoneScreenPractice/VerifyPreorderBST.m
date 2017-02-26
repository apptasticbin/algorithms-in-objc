//
//  VerifyPreorderBST.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 23/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "VerifyPreorderBST.h"

@implementation VerifyPreorderBST

- (BOOL)verifyPreorderBST:(NSArray *)bst {
    if (!bst || !bst.count) return NO;
    return [self verifyPreorderBST:bst start:0 end:bst.count-1];
}

- (BOOL)verifyPreorderBST:(NSArray *)bst start:(NSInteger)start end:(NSInteger)end {
    if (start >= end) return YES;
    NSNumber *root = bst[start];
    NSInteger i = start + 1;
    while (i < end && [root compare:bst[i]] == NSOrderedDescending) i++;
    NSInteger j = i;
    while (j < end && [root compare:bst[j]] == NSOrderedAscending) {
        j++;
    }
    if (j <= end ) return NO;
    return [self verifyPreorderBST:bst start:start+1 end:i-1] &&
    [self verifyPreorderBST:bst start:i end:end];
}

- (BOOL)verifyPreorderBSTWithStack:(NSArray<NSNumber *> *)preorder {
    if (!preorder || !preorder.count) return NO;
    
    NSMutableArray<NSNumber *> *stack = [NSMutableArray array];
    NSInteger max = NSIntegerMin;
    for (NSInteger i=0; i<preorder.count; i++) {
        NSInteger num = preorder[i].integerValue;
        if (num < max) return NO;
        
        while (stack.count > 0 && num > stack.lastObject.integerValue) {
            max = stack.lastObject.integerValue;
            [stack removeLastObject];
        }
        
        [stack addObject:@(num)];
    }
    return YES;
}

@end
