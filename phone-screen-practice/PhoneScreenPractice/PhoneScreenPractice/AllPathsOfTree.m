//
//  AllPathsOfTree.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 22/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "AllPathsOfTree.h"

@implementation AllPathsOfTree

- (NSArray<NSArray *> *)allPathsOfTree:(Tree *)root {
    if (root == nil) return [NSArray array];
    NSArray *leftPaths = [self allPathsOfTree:root.left];
    NSArray *rightPaths = [self allPathsOfTree:root.right];
    NSArray *subPaths = [leftPaths arrayByAddingObjectsFromArray:rightPaths];
    NSMutableArray *paths = [NSMutableArray array];
    for (NSArray *subPath in subPaths) {
        NSArray *path = [subPath arrayByAddingObject:@(root.value)];
        [paths addObject:path];
    }
    // NOTICE: this path is from "leaf" to "root"
    return paths;
}

@end
