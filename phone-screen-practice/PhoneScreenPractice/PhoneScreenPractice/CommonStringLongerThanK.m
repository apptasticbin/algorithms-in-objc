//
//  CommonStringLongerThanK.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "CommonStringLongerThanK.h"

@implementation CommonStringLongerThanK

- (BOOL)commonString:(NSString *)str1 andString:(NSString *)str2 longerThanOrEqualToK:(NSInteger)k {
    NSInteger dp[str1.length+1][str2.length+1];
    for (NSInteger i=0; i<=str1.length; i++) {
        dp[i][0] = 0;
    }
    for (NSInteger i=0; i<=str1.length; i++) {
        dp[0][i] = 0;
    }
    for (NSInteger i=1; i<=str1.length; i++) {
        for (NSInteger j=1; j<=str2.length; j++) {
            if ([str1 characterAtIndex:i-1] == [str2 characterAtIndex:j-1]) {
                dp[i][j] = dp[i-1][j-1]+1;
            } else {
                dp[i][j] = 0;
            }
            if (dp[i][j] >= k) return YES;
        }
    }
    return NO;
}

@end
