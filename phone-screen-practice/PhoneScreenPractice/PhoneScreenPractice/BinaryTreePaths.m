//
//  BinaryTreePaths.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BinaryTreePaths.h"

@implementation BinaryTreePaths

- (NSArray<NSString *> *)binaryTreePaths:(Tree *)root {
    if (root == nil) return nil;
    NSMutableArray<NSString *> *path = [NSMutableArray array];
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    [self dfs:root path:path results:results];
    return [results copy];
}

- (void)dfs:(Tree *)root path:(NSMutableArray<NSString *> *)path
    results:(NSMutableArray<NSString *> *)results {
    if (root == nil) return;
    if (root.left == nil && root.right == nil) {
        [path addObject:@(root.value).stringValue];
        [results addObject:[path componentsJoinedByString:@"->"]];
        [path removeLastObject];
        return ;
    }
    
    [path addObject:@(root.value).stringValue];
    [self dfs:root.left path:path results:results];
    [self dfs:root.left path:path results:results];
    [path removeLastObject];
}

- (NSArray<NSString *> *)binaryTreePathsShort:(Tree *)root {
    NSMutableArray<NSString *> *paths = [NSMutableArray array];
    if (root == nil) return paths;
    if (root.left == nil && root.right == nil) {
        [paths addObject:@(root.value).stringValue];
        return paths;
    }
    
    for (NSString *path in [self binaryTreePathsShort:root.left]) {
        [paths addObject:[NSString stringWithFormat:@"%@->%@", @(root.value).stringValue, path]];
    }
    
    for (NSString *path in [self binaryTreePathsShort:root.right]) {
        [paths addObject:[NSString stringWithFormat:@"%@->%@", @(root.value).stringValue, path]];
    }
    return paths;
}


@end
