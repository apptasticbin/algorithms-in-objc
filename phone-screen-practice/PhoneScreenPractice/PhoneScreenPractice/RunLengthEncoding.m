//
//  RunLengthEncoding.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 22/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "RunLengthEncoding.h"

@implementation RunLengthEncoding

- (NSString *)runLengthEncoding:(NSString *)input {
    if (!input || !input.length) return nil;
    NSString *encoded = [NSString string];
    unichar preC = [input characterAtIndex:0];
    NSInteger count = 1;
    for (NSUInteger i=1; i<input.length; i++) {
        unichar curC = [input characterAtIndex:i];
        if (preC == curC) count++;
        else {
            encoded = [encoded stringByAppendingFormat:@"%C", preC];
            encoded = [encoded stringByAppendingString:@(count).stringValue];
            // reset counter and previous character value
            count = 1;
            preC = curC;
        }
    }
    // append last one to the result string
    encoded = [encoded stringByAppendingFormat:@"%C", preC];
    encoded = [encoded stringByAppendingString:@(count).stringValue];
    return encoded;
}

@end
