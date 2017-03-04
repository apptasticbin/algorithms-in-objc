//
//  ExpressionAddOperatiors.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ExpressionAddOperatiors.h"

@implementation ExpressionAddOperatiors

- (NSArray<NSString *> *)addOperators:(NSString *)num target:(NSInteger)target {
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    if (num == nil || num.length == 0) return results;
    [self helper:num path:@"" target:target start:0 current:0 multed:0 results:results];
    return results;
}

- (void)helper:(NSString *)num path:(NSString *)path
        target:(NSInteger)target start:(NSInteger)start
       current:(NSInteger)current multed:(NSInteger)multed
       results:(NSMutableArray<NSString *> *)results {
    if (start == num.length && current == target) {
        [results addObject:path];
        return;
    }
    for (NSInteger i=start; i<num.length; i++) {
        // this means we found continuous '0's, which is invalid
        if (i != start && [num characterAtIndex:start] == '0') break;
        NSString *ns = [num substringWithRange:NSMakeRange(start, i-start+1)];
        NSInteger n = ns.integerValue;
        if (start == 0) {
            // if this is the first character in the path, we just move to next one
            [self helper:num path:[path stringByAppendingFormat:@"%@",ns] target:target
                   start:i+1 current:n multed:n results:results];
        } else {
            // for '+' and '-', we just add or minus current value
            // remember to inverse the multed when we do '-'
            [self helper:num path:[path stringByAppendingFormat:@"+%@",ns] target:target
                   start:i+1 current:current+n multed:n results:results];
            [self helper:num path:[path stringByAppendingFormat:@"-%@",ns] target:target
                   start:i+1 current:current-n multed:-n results:results];
            // when we do '*', first we need to remove previous 'multed' value from 'current'
            // this is because we don't know '*' operation beforehand, so previous 'multed'
            // value has already been added or minused in 'current'
            // after removing duplicate 'multed', we add 'multed * n'
            [self helper:num path:[path stringByAppendingFormat:@"*%@",ns] target:target
                   start:i+1 
                 current:current-multed+multed*n
                  multed:multed*n
                 results:results];
        }
    }
}

@end
