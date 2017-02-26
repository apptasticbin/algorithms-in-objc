//
//  KCloestPoints.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 23/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCloestPoints : NSObject

- (NSArray<NSValue *> *)kCloestPoints:(NSUInteger)k fromPoints:(NSMutableArray<NSValue *> *)points;

@end
