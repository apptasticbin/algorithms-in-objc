//
//  TrieNode.h
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 27/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrieNode : NSObject

@property (nonatomic, assign) BOOL isWord;
@property (nonatomic, strong) NSMutableDictionary<NSString *, TrieNode *> *children;

- (BOOL)hasChild:(NSString *)c;
- (TrieNode *)getChild:(NSString *)c;
- (void)setChild:(TrieNode *)child forCharacter:(NSString *)c;

@end
