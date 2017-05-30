//
//  TrieNode.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 27/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "TrieNode.h"

@implementation TrieNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        _children = [NSMutableDictionary dictionary];
        _isWord = NO;
    }
    return self;
}

- (BOOL)hasChild:(NSString *)c {
    return self.children[c] != nil;
}

- (TrieNode *)getChild:(NSString *)c {
    return self.children[c];
}

- (void)setChild:(TrieNode *)child forCharacter:(NSString *)c {
    if (![self hasChild:c]) {
        self.children[c] = child;
    }
}

@end
