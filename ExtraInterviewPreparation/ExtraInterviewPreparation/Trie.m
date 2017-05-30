//
//  Trie.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 27/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "Trie.h"
#import "TrieNode.h"

@implementation Trie

- (instancetype)init
{
    self = [super init];
    if (self) {
        _root = [TrieNode new];
    }
    return self;
}

- (void)addWord:(NSString *)word {
    TrieNode *cur = self.root;
    for (NSInteger i = 0; i < word.length; i++) {
        NSString *c = [word substringWithRange:NSMakeRange(i, 1)];
        if (![cur hasChild:c]) {
            [cur setChild:[TrieNode new] forCharacter:c];
        }
        cur = [cur getChild:c];
    }
    cur.isWord = YES;
}

- (BOOL)searchWord:(NSString *)word {
    return [self searchWord:word start:0 node:self.root];
}

#pragma mark - Private

- (BOOL)searchWord:(NSString *)word start:(NSUInteger)start node:(TrieNode *)node {
    if (start == word.length) {
        return node.isWord;
    }
    
    NSString *c = [word substringWithRange:NSMakeRange(start, 1)];
    if (![c isEqualToString:@"."]) {
        if ([node hasChild:c]) {
            return [self searchWord:word start:start+1 node:[node getChild:c]];
        }
    } else {
        unichar pc = 'a';
        for (NSUInteger i = 0; i < 25; i++) {
            NSString *ps = [NSString stringWithFormat:@"%C", (unichar)(pc + i)];
            if ([node hasChild:ps]) {
                BOOL found = [self searchWord:word start:start+1 node:[node getChild:ps]];
                if (found) {
                    return YES;
                }
            }
        }
    }
    return NO;
}

@end
