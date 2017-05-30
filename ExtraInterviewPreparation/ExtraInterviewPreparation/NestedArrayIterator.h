//
//  NestedArrayIterator.h
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 24/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NestedArrayIterator : NSObject

- (instancetype)initWithNestedArray:(NSArray *)nestedArray;
- (NSNumber *)next;
- (NSArray<NSNumber *> *)allObjects;
- (void)reset;

@end
