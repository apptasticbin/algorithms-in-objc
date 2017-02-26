//
//  AddAndSearchWord.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trie.h"

@interface WordDictionary : NSObject

- (void)addWord:(NSString *)word;
- (BOOL)search:(NSString *)word;

@end
