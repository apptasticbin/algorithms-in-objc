//
//  CombinationSum.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CombinationSum : NSObject

- (NSArray<NSArray<NSNumber *> *> *)combinationSumI:(NSArray<NSNumber *> *)candidates
                                             target:(NSInteger)target;
- (NSUInteger)combinationSum4DP:(NSArray<NSNumber *> *)nums target:(NSUInteger)target;
- (NSArray<NSArray<NSNumber *> *> *)combinationSumDFS:(NSArray<NSNumber *> *)nums
                                               target:(NSUInteger)target;

@end
