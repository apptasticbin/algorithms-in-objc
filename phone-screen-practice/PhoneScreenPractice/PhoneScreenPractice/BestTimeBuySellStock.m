//
//  BestTimeBuySellStock.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "BestTimeBuySellStock.h"

@implementation BestTimeBuySellStock

- (NSInteger)maxProfit:(NSArray<NSNumber *> *)prices {
    if (prices == nil || prices.count == 0) return NSIntegerMin;
    NSInteger maxProfit = NSIntegerMin;
    NSInteger minPrice = NSIntegerMax;
    for (NSInteger i=0; i<prices.count; i++) {
        NSInteger price = prices[i].integerValue;
        minPrice = MIN(price, minPrice);
        maxProfit = MAX(maxProfit, price-minPrice);
    }
    return maxProfit;
}

@end
