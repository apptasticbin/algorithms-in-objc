//
//  TrieNode.h
//  WeirdTest
//
//  Created by Bin Yu on 13/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrieNode : NSObject

@property(nonatomic, assign) BOOL isWord;

+ (instancetype)node;
- (BOOL)hasChild:(unichar)c;
- (TrieNode *)getChild:(unichar)c;
- (void)setChild:(unichar)c withNode:(TrieNode *)node;

@end
