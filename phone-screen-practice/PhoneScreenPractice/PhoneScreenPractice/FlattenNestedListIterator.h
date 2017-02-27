//
//  FlattenNestedListIterator.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NestedInteger : NSObject

- (BOOL)isInteger;
- (NSNumber *)getInteger;
- (NSArray<NestedInteger *> *)getList;

@end

@interface NestedInteractor : NSObject

- (NSNumber *)next;
- (BOOL)hasNext;

@end
