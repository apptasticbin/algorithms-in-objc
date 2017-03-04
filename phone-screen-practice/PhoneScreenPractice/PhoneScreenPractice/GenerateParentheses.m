//
//  GenerateParentheses.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "GenerateParentheses.h"

@implementation GenerateParentheses

- (NSArray<NSString *> *)generateParenthesis:(NSInteger)n {
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    [self helperWithLeftParenthesis:n rightParenthesis:n path:@"" results:results];
    return results;
}

- (void)helperWithLeftParenthesis:(NSInteger)leftP rightParenthesis:(NSInteger)rightP
                             path:(NSString *)path
                          results:(NSMutableArray<NSString *> *)results {
    if (leftP == 0 && rightP == 0) {
        [results addObject:[path copy]];
        return;
    }
    
    if (leftP > 0) {
        [self helperWithLeftParenthesis:leftP-1 rightParenthesis:rightP
                                   path:[path stringByAppendingString:@"("]
                                results:results];
    }
    
    if (rightP > leftP) {
        [self helperWithLeftParenthesis:leftP rightParenthesis:rightP-1
                                   path:[path stringByAppendingString:@")"]
                                results:results];
    }
}

@end
