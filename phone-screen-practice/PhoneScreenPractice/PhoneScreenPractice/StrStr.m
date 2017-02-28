//
//  StrStr.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "StrStr.h"

@implementation StrStr

- (NSUInteger)strStr:(NSString *)haystack needle:(NSString *)needle {
    if (haystack == nil || needle == nil) return -1;
    for (NSInteger i=0; i<haystack.length-needle.length; i++) {
        NSInteger j=0;
        for (; j<needle.length; j++) {
            if ([haystack characterAtIndex:i+j] != [needle characterAtIndex:j]) break;
        }
        if (j == needle.length) return i;
    }
    return -1;
}

@end
