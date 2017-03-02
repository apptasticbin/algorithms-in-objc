//
//  WordSearch.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "WordSearch.h"

@implementation WordSearch

#pragma mark - Word Search I

- (BOOL)exist:(NSArray<NSArray<NSString *> *> *)board word:(NSString *)word {
    if (board == nil || word == nil || word.length == 0) return NO;
    NSUInteger m = board.count;
    if (m == 0) return NO;
    NSUInteger n = board[0].count;
    NSString *firstC = [word substringWithRange:NSMakeRange(0,1)];
    for (NSInteger i=0; i<m; i++) {
        for (NSInteger j=0; j<n; j++) {
            NSString *c = board[i][j];
            NSMutableSet<NSValue *> *visited = [NSMutableSet set];
            if ([c isEqualToString:firstC]) {
                BOOL found = [self dfs:board i:i j:j word:word start:0 visited:visited];
                if (found) return YES;
            }
        }
    }
    return NO;
}

- (BOOL)dfs:(NSArray<NSArray<NSString *> *> *)board
          i:(NSInteger)i j:(NSInteger)j
       word:(NSString *)word
      start:(NSUInteger)start
    visited:(NSMutableSet<NSValue *> *)visited {
    if (start == word.length) return YES;
    if (i>board.count-1 || i<0 || j>board[0].count-1 || j<0) return NO;
    // for iOS, use valueWithCGPoint and NSMakeCGPoint
    NSValue *pos = [NSValue valueWithPoint:NSMakePoint(i, j)];
    if ([visited containsObject:pos]) return NO;
    [visited addObject:pos];
    
    NSString *bc = board[i][j];
    NSString *sc = [word substringWithRange:NSMakeRange(start,1)];
    if (![bc isEqualToString:sc]) return NO;
    // go left, right, up and down
    return [self dfs:board i:i+1 j:j word:word start:start+1 visited:visited] ||
    [self dfs:board i:i-1 j:j word:word start:start+1 visited:visited] ||
    [self dfs:board i:i j:j+1 word:word start:start+1 visited:visited] ||
    [self dfs:board i:i j:j-1 word:word start:start+1 visited:visited];
}

#pragma mark - Word Search II

- (NSArray<NSString *> *)findWords:(NSArray<NSString *> *)words
                           inBoard:(NSArray<NSArray<NSString *> *> *)board {
    if (board == nil || words == nil || words.count == 0) return NO;
    NSUInteger m = board.count;
    if (m == 0) return NO;
    NSUInteger n = board[0].count;
    
    // first, we create the Trie
    Trie *trie = [Trie trie];
    for (NSInteger i=0; i<words.count; i++) {
        [trie addWord:words[i]];
    }
    
    // we use set here to avoid duplicates
    NSMutableSet<NSString *> *results = [NSMutableSet set];
    // then, we still do dfs
    for (NSInteger i=0; i<m; i++) {
        for (NSInteger j=0; j<n; j++) {
            NSMutableSet<NSValue *> *visited = [NSMutableSet set];
            [self dfs:board i:i j:j word:board[i][j] trieNode:trie.root
              visited:visited results:results];
        }
    }
    return [results allObjects];
}

- (void)dfs:(NSArray<NSArray<NSString *> *> *)board
          i:(NSInteger)i j:(NSInteger)j
       word:(NSString *)word
   trieNode:(TrieNode *)trieNode
    visited:(NSMutableSet<NSValue *> *)visited
    results:(NSMutableSet<NSString *> *)results {
    if (i>board.count-1 || i<0 || j>board[0].count-1 || j<0) return;
    // for iOS, use valueWithCGPoint and NSMakeCGPoint
    NSValue *pos = [NSValue valueWithPoint:NSMakePoint(i, j)];
    if ([visited containsObject:pos]) return;
    [visited addObject:pos];
    
    unichar c = [board[i][j] characterAtIndex:0];
    if (![trieNode hasChild:c]) return;
    NSString *nextWord = [word stringByAppendingString:board[i][j]];
    TrieNode *nextNode = [trieNode getChild:c];
    if (nextNode.isWord) [results addObject:nextWord];
    
    [self dfs:board i:i+1 j:j word:nextWord trieNode:nextNode visited:visited results:results];
    [self dfs:board i:i-1 j:j word:nextWord trieNode:nextNode visited:visited results:results];
    [self dfs:board i:i j:j+1 word:nextWord trieNode:nextNode visited:visited results:results];
    [self dfs:board i:i j:j-1 word:nextWord trieNode:nextNode visited:visited results:results];
}

@end
