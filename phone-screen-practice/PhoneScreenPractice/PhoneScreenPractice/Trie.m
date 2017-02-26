//
//  Trie.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "Trie.h"

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
    return [self search:word root:self.root];
}

- (BOOL)search:(NSString *)word root:(TrieNode *)root {
    if (word.length == 0 && root.isWord) return YES;
    unichar c = [word characterAtIndex:0];
    if (c != '.' && [root hasChild:c]) {
        [self search:[word substringWithRange:NSMakeRange(0,1)] root:[root getChild:c]];
    } else if (c == '.') {
        for (NSUInteger i=0; i<26; i++) {
            c = 'a'+i;
            BOOL found = [self search:[word substringWithRange:NSMakeRange(0,1)] root:[root getChild:c]];
            if (found) return YES;
        }
    }
    return NO;
}

@end
