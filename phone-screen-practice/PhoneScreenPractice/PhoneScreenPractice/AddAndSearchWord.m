//
//  AddAndSearchWord.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "AddAndSearchWord.h"

@interface WordDictionary ()

@property (nonatomic, strong) Trie *trie;

@end

@implementation WordDictionary

- (instancetype)init {
    self = [super init];
    if (self) {
        _trie = [Trie trie];
    }
    return self;
}

- (void)addWord:(NSString *)word {
    [self.trie addWord:word];
}

- (BOOL)search:(NSString *)word {
    return [self.trie search:word];
}

@end
