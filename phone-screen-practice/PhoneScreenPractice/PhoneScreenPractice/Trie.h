//
//  Trie.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrieNode.h"

@interface Trie : NSObject

@property (nonatomic, strong) TrieNode *root;

+ (instancetype)trie;
- (void)addWord:(NSString *)word;
- (BOOL)search:(NSString *)word;

@end
