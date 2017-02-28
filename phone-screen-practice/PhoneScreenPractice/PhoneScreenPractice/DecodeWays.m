//
//  DecodeWays.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "DecodeWays.h"

@implementation DecodeWays

- (NSUInteger)numDecodingsDP:(NSString *)s {
    if (s == nil || s.length == 0 || [s characterAtIndex:0] == '0') return 0;
    
    NSUInteger dp[s.length+1];
    memset(dp, 0, s.length+1);
    dp[0] = 1;	// empty string
    dp[1] = 1;	// string size 1 and first character is not '0'
    // i here means string size, not index
    for (NSInteger i=2; i<=s.length; i++) {
        unichar p = [s characterAtIndex:i-2];
        unichar c = [s characterAtIndex:i-1];
        if (c > '0') dp[i] = dp[i-1];
        if (p == '1' || (p == '2' && c <= '6')) dp[i] += dp[i-2];
    }
    return dp[s.length];
}

- (NSUInteger)numDecodingsConstantSpace:(NSString *)s {
    if (s == nil || s.length == 0 || [s characterAtIndex:0] == '0') return 0;
    // d1: decoding ways of d[i-1]
    // d2: decoding ways of d[i-2]
    NSUInteger d1 = 1, d2 = 1, res = 0;
    for (NSInteger i=2; i<=s.length; i++) {
        unichar p = [s characterAtIndex:i-2];
        unichar c = [s characterAtIndex:i-1];
        if (c != '0') res += d1;
        if (p == '1' || (p == '2' && c <= '6')) res += d2;
        // update d1 and d2
        d2 = d1; d1 = res; res = 0;
    }
    return res;
}

@end
