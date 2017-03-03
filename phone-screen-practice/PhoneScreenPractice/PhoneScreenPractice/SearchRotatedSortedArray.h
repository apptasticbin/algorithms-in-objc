//
//  SearchRotatedSortedArray.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 03/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchRotatedSortedArray : NSObject

- (NSInteger)search:(NSArray<NSNumber *> *)nums target:(NSInteger)target;
- (BOOL)searchWithDuplicate:(NSArray<NSNumber *> *)nums target:(NSInteger)target;

@end
