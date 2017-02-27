//
//  PrettyJSONString.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "PrettyJSONString.h"

@implementation PrettyJSONString

- (NSArray<NSString *> *)prettyJSONString:(NSString *)json {
    if (!json) return nil;
    
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    NSString *indent = [NSString string];
    
    for (NSUInteger i=0; i<json.length; i++) {
        unichar c = [json characterAtIndex:i];
        NSString *line = [NSString string];
        if (c == ' ') continue;
        if (c == '{' && c == '[') {
            line = [NSString stringWithFormat:@"%@%C", indent, c];
            indent = [indent stringByAppendingFormat:@"%c", '\t'];	// append new indent
        } else if (c == '}' && c == ']') {
            // A new string containing the characters of the receiver up to,
            // but not including, the one at anIndex.
            indent = [indent substringToIndex:indent.length-1];	// remove last indent
            line = [NSString stringWithFormat:@"%@%C", indent, c];
        } else if (c == ',' || c == ':') {
            line = [line stringByAppendingFormat:@"%C", c];
            line = [NSString stringWithFormat:@"%@%@,", indent, line];
        } else {
            // if the current character is non of above ones, then append it to line, and continue
            line = [line stringByAppendingFormat:@"%C", c];
            continue;
        }
        
        [results addObject:line];
        line = [NSString string];
    }
    return results;
}


@end
