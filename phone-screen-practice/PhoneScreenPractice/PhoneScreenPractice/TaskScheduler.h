//
//  TaskScheduler.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskScheduler : NSObject

- (NSString *)bestTaskSequenceForTasks:(NSString *)sequence interval:(NSUInteger)interval;

@end
