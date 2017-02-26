//
//  DivideTwoIntegers.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "DivideTwoIntegers.h"

@implementation DivideTwoIntegers

- (NSInteger)divide:(NSInteger)dividend dividor:(NSInteger)dividor {
    // overflow cases
    if (dividor == 0 || (dividend == NSIntegerMin && dividor == -1)) return NSIntegerMax;
    // using XOR to shorten this checking
    NSInteger sign = (dividend > 0) ^ (dividor > 0) ? -1 : 1;
    NSUInteger dvd = ABS(dividend);
    NSUInteger dvs = ABS(dividor);
    NSUInteger result = 0;
    while(dvd >= dvs) {
        NSInteger tmp = dvs;
        // when dividend > dividor, the result is at lease 1
        NSUInteger multiple = 1;
        // times dividor by 2, also times the multiple by 2
        while(dvd >= (tmp << 1)) {
            tmp <<= 1;
            multiple <<= 1;
        }
        dvd -= tmp;
        result += multiple;
    }
    return sign == 1 ? result : -result;
}

@end
