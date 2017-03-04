//
//  LetterCombinationsOfPhoneNumber.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "LetterCombinationsOfPhoneNumber.h"

@implementation LetterCombinationsOfPhoneNumber

// Traditional "Backtracking" question
// O(k^N)
// Ask interviewer: what are letter(s) for '0' and '1'?

- (NSArray<NSString *> *)letterCombinations:(NSString *)digits {
    if (digits.length == 0) return nil;
    return [self helper:digits start:0];
}

- (NSArray<NSString *> *)helper:(NSString *)digits start:(NSInteger)start {
    if (start == digits.length) return @[];
    
    NSArray<NSString *> *combines = [self helper:digits start:start+1];
    
    NSInteger digit = [digits characterAtIndex:start] - '0';
    NSArray<NSString *> *letters = [self digitToLetters:digit];
    
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    for (NSString *combine in combines) {
        for (NSString *letter in letters) {
            [results addObject:[letter stringByAppendingString:combine]];
        }
    }
    return results;
}

- (NSArray<NSString *> *)digitToLetters:(NSInteger)digit {
    return [@[
              @[@""],
              @[@""],
              @[@"a", @"b", @"c"],
              @[@"d", @"e", @"f"],
              @[@"g", @"h", @"i"],
              @[@"j", @"k", @"l"],
              @[@"m", @"n", @"o"],
              @[@"p", @"q", @"r", @"s"],
              @[@"w", @"x", @"y", @"z"]
              ] objectAtIndex:digit];
}

@end
