//
//  ValidatePalindrome.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ValidatePalindrome.h"

@implementation ValidatePalindrome

- (BOOL)isPalindrome:(NSString *)s {
    NSInteger left = 0, right = s.length-1;
    NSCharacterSet *alphanumeric = [NSCharacterSet alphanumericCharacterSet];
    while (left < right) {
        while (left < right && ![alphanumeric characterIsMember:[s characterAtIndex:left]]) left++;
        while (left < right && ![alphanumeric characterIsMember:[s characterAtIndex:right]]) right--;
        unichar lc = [s characterAtIndex:left];
        unichar lr = [s characterAtIndex:right];
        if (lc != lr) return NO;
        left++; right--;
    }
    return YES;
}

@end
