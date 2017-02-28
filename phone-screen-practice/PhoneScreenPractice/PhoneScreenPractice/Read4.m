//
//  Read4.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "Read4.h"

NSUInteger read4(char *buf) {
    return 0;
}

@implementation Read4

- (NSUInteger)read:(char *)buf n:(NSUInteger)n {
    char buf4[4];
    NSUInteger size = 0;
    while (true) {
        NSUInteger actual = read4(buf4);
        for (NSUInteger i=0; i<actual && size < n; i++) {
            buf[size++] = buf4[i];
        }
        if (actual == 0 || size == n) return size;
    }
}

@end
