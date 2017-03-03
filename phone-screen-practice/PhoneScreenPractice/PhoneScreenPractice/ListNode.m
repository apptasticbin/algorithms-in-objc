//
//  ListNode.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

+ (instancetype)nodeWithValue:(NSInteger)value {
    ListNode *node = [self new];
    node.value = value;
    return node;
}

@end
