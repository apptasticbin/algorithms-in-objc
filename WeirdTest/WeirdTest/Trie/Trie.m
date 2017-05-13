//
//  Trie.m
//  WeirdTest
//
//  Created by Bin Yu on 13/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "Trie.h"
#import "TrieNode.h"

@implementation Trie

+ (instancetype)trie {
    Trie *theTrie = [self new];
    theTrie.root = [TrieNode node];
    return theTrie;
}

- (void)addWord:(NSString *)word {
    if (!word) return;
    // insert word characters one by one, change current node following the path
    TrieNode *curNode = self.root;
    for (NSUInteger i=0; i<word.length; i++) {
        unichar c = [word characterAtIndex:i];
        // if there isn't word with this character, create new node.
        // otherwise, just get the existing node.
        if (![curNode hasChild:c]) {
            TrieNode *newNode = [TrieNode node];
            [curNode setChild:c withNode:newNode];
        }
        curNode = [curNode getChild:c];
    }
    // mark this node as the end of a complete word.
    curNode.isWord = YES;
}

- (BOOL)search:(NSString *)word {
    if (!word) return NO;
    return [self search:word root:self.root start:0];
}

- (BOOL)search:(NSString *)word root:(TrieNode *)root start:(NSInteger)start {
    if (!root) {
        return NO;
    }
    if (start == word.length) {
        return root.isWord;
    }
     unichar c = [word characterAtIndex:start];
     if (c != '.') {
         return [self search:word root:[root getChild:c] start:start+1];
     } else {
         for (NSUInteger i=0; i<26; i++) {
             c = 'a'+i;
             BOOL found = [self search:word root:[root getChild:c] start:start+1];
             if (found) return YES;
         }
     }
    return NO;
}

@end

