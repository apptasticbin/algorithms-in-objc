//
//  BinaryTreeLongestConsecutiveSequence.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BinaryTreeLongestConsecutiveSequence.h"

@implementation BinaryTreeLongestConsecutiveSequence

- (NSUInteger)longestConsecutive:(Tree *)root {
    return [self helper:root parent:nil lengthWithoutRoot:0];
}

- (NSUInteger)helper:(Tree *)root parent:(Tree *)parent lengthWithoutRoot:(NSUInteger)lengthWithoutRoot {
    if (root == nil) return 0;
    NSUInteger length = (parent != nil && root.value == parent.value+1) ? lengthWithoutRoot+1 : 1;
    NSUInteger left = [self helper:root.left parent:root lengthWithoutRoot:length];
    NSUInteger right = [self helper:root.right parent:root lengthWithoutRoot:length];
    return MAX(length, MAX(left, right));
}

@end
