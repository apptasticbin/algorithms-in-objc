//
//  RegularExpressionMatching.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "RegularExpressionMatching.h"

@implementation RegularExpressionMatching

- (BOOL)isMatch:(NSString *)s p:(NSString *)p {
    if (s == nil || p == nil) return NO;
    BOOL dp[s.length+1][p.length+1];
    // initialize the dp container
    // empty string matches empty string
    dp[0][0] = YES;
    // if the length of p is 0, then we would say s is not match to empty string
    for (NSInteger i=1; i<=s.length; i++) dp[i][0] = NO;
    // if the length of s is 0, then if the previous character in p p[j-1] == '*'
    // and also previous character is NOT the first one, then we could say dp[0][j] = dp[0][j-2]
    for (NSInteger j=1; j<=p.length; j++) {
        unichar c = [p characterAtIndex:j-1];
        if (c == '*' && j>1) dp[0][j] = dp[0][j-2];
    }
    
    // now we can build the DP table
    for (NSInteger i=1; i<=s.length; i++) {
        for (NSInteger j=1; j<=p.length; j++) {
            unichar sc = [s characterAtIndex:i];
            unichar pc = [p characterAtIndex:j];
            unichar pcc = [p characterAtIndex:j-1];
            if (pc != '*') {
                dp[i][j] = dp[i-1][j-1] && (sc == pc || pc == '.');
            } else if (j > 1) {
                dp[i][j] = dp[i][j-2] || ((sc == pcc || pcc == '.') && dp[i-1][j]);
            }
        }
    }
    return dp[s.length][p.length];
}

@end
