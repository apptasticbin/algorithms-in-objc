//
//  TrieNode.m
//  WeirdTest
//
//  Created by Bin Yu on 13/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "TrieNode.h"

@interface TrieNode ()

@property(nonatomic, strong) NSMutableDictionary<NSString *, TrieNode *> *children;

@end

@implementation TrieNode

+ (instancetype)node {
    TrieNode *node = [self new];
    return node;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _children = [NSMutableDictionary dictionary];
        _isWord = NO;
    }
    return self;
}

- (BOOL)hasChild:(unichar)c {
    NSString *key = [self stringWithUnichar:c];
    return [self.children objectForKey:key] != nil;
}

- (TrieNode *)getChild:(unichar)c {
    NSString *key = [self stringWithUnichar:c];
    return [self.children objectForKey:key];
}

- (void)setChild:(unichar)c withNode:(TrieNode *)node {
    NSString *key = [self stringWithUnichar:c];
    [self.children setObject:node forKey:key];
}

- (NSString *)stringWithUnichar:(unichar)c {
    return [NSString stringWithFormat:@"%C", c];
}

@end
