//
//  LongestPalindromicSubstring.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "LongestPalindromicSubstring.h"

@implementation LongestPalindromicSubstring

- (NSString *)longestPalindrome:(NSString *)s {
    if (s == nil || s.length == 0) return nil;
    // NOTICE: maxLen with initial value 1
    NSInteger maxLen = 1, maxStart = 0;
    for (NSInteger i=0; i<s.length; i++) {
        NSInteger left = i, right = i;
        // first skip all duplicate characters, because duplicates are always palindrome string
        while (right < s.length-1 &&
               [s characterAtIndex:right] == [s characterAtIndex:right+1]) {
            right++;
        }
        // move next start point to right+1
        i = right+1;
        // now expend to left and right "around" the duplicate characters
        while (right < s.length-1 && left > 0 &&
               [s characterAtIndex:left-1] == [s characterAtIndex:right+1]) {
            left--; right++;
        }
        if (maxLen < right - left + 1) {
            maxStart = left;
            maxLen = right - left + 1;
        }
    }
    return [s substringWithRange:NSMakeRange(maxStart, maxLen)];
}

@end
