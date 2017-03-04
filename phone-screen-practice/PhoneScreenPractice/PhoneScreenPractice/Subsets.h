//
//  Subsets.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 05/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subsets : NSObject

- (NSArray<NSArray<NSNumber *> *> *)subsetsBacktracking:(NSArray<NSNumber *> *)nums;
- (NSArray<NSArray<NSNumber *> *> *)subsetsIterative:(NSArray<NSNumber *> *)nums;
- (NSArray<NSArray<NSNumber *> *> *)subsetsWithDuplicate:(NSArray<NSNumber *> *)nums;

@end
