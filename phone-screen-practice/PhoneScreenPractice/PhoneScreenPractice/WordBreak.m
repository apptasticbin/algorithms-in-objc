//
//  WordBreak.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "WordBreak.h"

@implementation WordBreak

- (BOOL)wordBreakI:(NSString *)s dictionary:(NSArray<NSString *> *)wordDict {
    NSSet *wordSet = [NSSet setWithArray:wordDict];
    BOOL dp[s.length+1];
    memset(dp, NO, s.length+1);	// set all dp into NO
    dp[0] = YES;
    for (NSInteger i=1; i<=s.length; i++) {
        for (NSInteger j=i-1; j>=0; j--) {
            if (dp[j]) {
                NSString *sub = [s substringWithRange:NSMakeRange(j, i-j)];
                if ([wordSet containsObject:sub] && dp[j]) {
                    dp[i] = YES;
                    break;
                }
            }
        }
    }
    return dp[s.length];
}

- (NSArray<NSString *> *)wordBreakII:(NSString *)s dictionary:(NSArray<NSString *> *)wordDict {
    return [self DFS:s dictionary:wordDict cache:[NSMutableDictionary dictionary]];
}

- (NSArray<NSString *> *)DFS:(NSString *)s dictionary:(NSArray<NSString *> *)wordDict
                       cache:(NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *)cache {
    // return cache value if found
    if (cache[s] != 0) return cache[s];
    
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    // return empty array for empty string
    if (s.length == 0) return results;
    
    // now we start to find words from dictionary set word by word
    for (NSString *word in wordDict) {
        if ([s hasPrefix:word]) {
            // backtracking now
            NSString *follow = [s substringFromIndex:word.length-1];
            NSArray<NSString *> *followWords = [self DFS:follow dictionary:wordDict cache:cache];
            for (NSString *followWord in followWords) {
                [results addObject:[word stringByAppendingFormat:@" %@", followWord]];
            }
        }
    }
    cache[s] = results;
    return results;
}

@end
