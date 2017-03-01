//
//  ContainsDuplicate.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContainsDuplicate : NSObject

- (BOOL)containsNearbyAlmostDuplicate:(NSArray<NSNumber *> *)nums k:(NSInteger)k t:(NSInteger)t;
- (BOOL)checkDuplicatesWithinK:(NSArray<NSNumber *> *)nums k:(NSUInteger)k;

@end
