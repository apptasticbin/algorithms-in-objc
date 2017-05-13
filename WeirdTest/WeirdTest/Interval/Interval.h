//
//  Interval.h
//  WeirdTest
//
//  Created by Bin Yu on 13/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interval : NSObject

@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSInteger end;

+ (instancetype)intervalWithStart:(NSInteger)start end:(NSInteger)end;

@end
