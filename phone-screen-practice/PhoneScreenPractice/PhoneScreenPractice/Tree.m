//
//  Tree.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 22/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "Tree.h"

@implementation Tree

+ (instancetype)nodeWithValue:(NSInteger)value {
    Tree *node = [self new];
    node.value = value;
    return node;
}

@end
