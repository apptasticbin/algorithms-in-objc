//
//  WordSearch.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trie.h"

@interface WordSearch : NSObject

- (BOOL)exist:(NSArray<NSArray<NSString *> *> *)board word:(NSString *)word;
- (NSArray<NSString *> *)findWords:(NSArray<NSString *> *)words
                           inBoard:(NSArray<NSArray<NSString *> *> *)board;

@end
