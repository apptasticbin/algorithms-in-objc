//
//  FirstBadVersion.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "FirstBadVersion.h"

@implementation FirstBadVersion

BOOL isBadVersion(NSUInteger version) {
    @throw NSGenericException;
}

- (NSUInteger)firstBadVersion:(NSUInteger)n {
    NSInteger left = 1;
    NSInteger right = n;
    while(left < right) {
        NSInteger mid = left + (right-left)/2;
        if (!isBadVersion(mid)) left = mid+1;
        else right = mid;
    }
    return left;
}

@end
