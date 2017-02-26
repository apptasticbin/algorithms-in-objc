//
//  CoinChange.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoinChange : NSObject

- (NSInteger)coinChange:(NSArray<NSNumber *> *)coins amount:(NSUInteger)amount;

@end
