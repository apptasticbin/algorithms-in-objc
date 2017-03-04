//
//  WordBreak.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordBreak : NSObject

- (BOOL)wordBreakI:(NSString *)s dictionary:(NSArray<NSString *> *)wordDict;
- (NSArray<NSString *> *)wordBreakII:(NSString *)s dictionary:(NSArray<NSString *> *)wordDict;

@end
