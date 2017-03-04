//
//  MostFrequentlyOccuringCharacters.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MostFrequentlyOccuringCharacters.h"

@implementation MostFrequentlyOccuringCharacters

- (NSArray<NSString *> *)mostFrequentlyOccurringCharacter:(NSString *)string {
    NSMutableDictionary<NSString *, NSNumber *> *count = [NSMutableDictionary dictionary];
    NSInteger maximum = 0;
    for (NSInteger i=0; i<string.length; i++) {
        NSString *c = [string substringWithRange:NSMakeRange(i,1)];
        if (count[c] == nil) count[c] = @(0);
        count[c] = @(count[c].integerValue+1);
        maximum = MAX(maximum, count[c].integerValue);
    }
    NSSet<NSString *> *mostKeys =
    [count keysOfEntriesPassingTest:^BOOL(NSString *key, NSNumber *obj, BOOL *stop) {
        return obj.integerValue == maximum;
    }];
    return mostKeys.allObjects;
}

@end
