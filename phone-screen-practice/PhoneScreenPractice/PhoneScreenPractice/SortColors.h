//
//  SortColors.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 25/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SortColors : NSObject

- (void)twoPassSortColors:(NSMutableArray<NSNumber *> *)colors;
- (void)onePassSortColors:(NSMutableArray<NSNumber *> *)colors;
- (void)onePassTrickySortColors:(NSMutableArray<NSNumber *> *)colors;

- (void)sortColors2:(NSMutableArray<NSNumber *> *)colors k:(NSUInteger)k;

@end
