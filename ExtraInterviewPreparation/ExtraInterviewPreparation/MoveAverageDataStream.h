//
//  MoveAverageDataStream.h
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 28/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoveAverageDataStream : NSObject

- (instancetype)initWithCapacity:(NSUInteger)capacity;
- (NSInteger)next:(NSInteger)newValue;

@end
