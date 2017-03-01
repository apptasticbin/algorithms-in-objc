//
//  FindAllAnagrams.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "FindAllAnagrams.h"

@implementation FindAllAnagrams

- (NSArray<NSNumber *> *)findAnagrams:(NSString *)s p:(NSString *)p {
    NSMutableDictionary<NSString *, NSNumber *> *hashTable = [NSMutableDictionary dictionary];
    NSMutableArray<NSNumber *> *results = [NSMutableArray array];
    
    // put all letters in p into hash table, count them
    for (NSInteger i=0; i<p.length; i++) {
        NSString *c = [p substringWithRange:NSMakeRange(i,1)];
        if (!hashTable[c]) hashTable[c] = @(1);
        else hashTable[c] = @(hashTable[c].integerValue+1);
    }
    
    // now we iterate s from beginning to end
    NSInteger count = p.length;
    NSInteger start = 0, end = 0;
    while (end < s.length) {
        NSString *c = [s substringWithRange:NSMakeRange(end,1)];
        
        // if current character is not in p, we still add them into hash table
        if (!hashTable[c]) hashTable[c] = @(0);
        
        // decrease the total count and letter count by 1
        if (hashTable[c].integerValue > 0) count--;
        
        hashTable[c] = @(hashTable[c].integerValue-1);
        // move the end pointer to next one
        end++;
        
        // if count == 0, then we find a anagram of p.
        if (count == 0) [results addObject:@(start)];
        
        if (end - start == p.length) {
            NSString *sc = [p substringWithRange:NSMakeRange(start, 1)];
            // here we filter out all non-anagram letters, whose count is -1.
            if (hashTable[sc].integerValue >= 0) count++;
            hashTable[sc] = @(hashTable[sc].integerValue+1);
            start++;
        }
    }
    // http://stackoverflow.com/questions/27389591/best-practice-return-mutablearray-copy-or-mutablearray-if-return-type-is-nsarra
    /* Generally speaking:
     If your caller is following these guidelines, just return the mutable array since it's slightly cheaper, 	   and the caller won't mutate it.
     If you're not sure whether caller might not follow these guidelines, and you want to code defensively, 	   return an immutable copy using array.copy.
     **/
    return [results copy];
}

@end
