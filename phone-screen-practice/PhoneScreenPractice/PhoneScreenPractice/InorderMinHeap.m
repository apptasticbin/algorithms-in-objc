//
//  InorderMinHeap.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 07/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "InorderMinHeap.h"

@implementation InorderMinHeap

- (Tree *)inOrderMinimumHeap:(NSArray<NSNumber *> *)nums {
    if (nums == nil || nums.count == 0) return nil;
    return [self helper:nums left:0 right:nums.count];
}

- (Tree *)helper:(NSArray<NSNumber *> *)nums left:(NSUInteger)left right:(NSUInteger)right {
    if (left > right) return nil;
    if (left == right) return [Tree nodeWithValue:nums[left].integerValue];
    NSInteger minIndex = [self indexOfMinimum:nums left:left right:right];
    Tree *root = [Tree nodeWithValue:nums[minIndex].integerValue];
    root.left = [self helper:nums left:left right:minIndex-1];
    root.right = [self helper:nums left:minIndex+1 right:right];
    return root;
}

- (NSUInteger)indexOfMinimum:(NSArray<NSNumber *> *)nums
                        left:(NSUInteger)left right:(NSUInteger)right {
    NSInteger minimum = NSIntegerMax;
    NSInteger index = -1;
    for (NSInteger i = left; i <= right; i++) {
        if (minimum > nums[i].integerValue) {
            index = i;
            minimum = nums[i].integerValue;
        }
    }
    return index;
}

@end
