//
//  Trie.h
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 27/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TrieNode;

@interface Trie : NSObject

@property (nonatomic, strong) TrieNode *root;

- (void)addWord:(NSString *)word;
- (BOOL)searchWord:(NSString *)word;

@end
