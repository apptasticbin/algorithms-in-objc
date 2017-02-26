//
//  PaintHouses.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 26/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PreviousMinimumCost : NSObject

@property (nonatomic, assign) NSUInteger color;
@property (nonatomic, assign) NSUInteger cost;

+ (instancetype)empty;
+ (instancetype)cost:(NSUInteger)cost color:(NSUInteger)color;

@end

@interface PaintHouses : NSObject

@end
