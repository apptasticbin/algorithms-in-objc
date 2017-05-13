//
//  Trie.h
//  WeirdTest
//
//  Created by Bin Yu on 13/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrieNode;

@interface Trie : NSObject

@property (nonatomic, strong) TrieNode *root;

+ (instancetype)trie;
- (void)addWord:(NSString *)word;
- (BOOL)search:(NSString *)word;

@end

