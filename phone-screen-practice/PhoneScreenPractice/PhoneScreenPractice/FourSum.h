//
//  FourSum.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FourSum : NSObject

- (NSArray<NSArray<NSNumber *> *> *)fourSum:(NSArray<NSNumber *> *)nums target:(NSInteger)target;
- (NSUInteger) fourSumCountAmongA:(NSArray<NSNumber *> *)A B:(NSArray<NSNumber *> *)B
                                C:(NSArray<NSNumber *> *)C D:(NSArray<NSNumber *> *)D;

@end
