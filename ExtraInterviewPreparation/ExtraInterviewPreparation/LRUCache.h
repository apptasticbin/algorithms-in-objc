//
//  LRUCache.h
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 28/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRUCache : NSObject

- (instancetype)initWithCapacity:(NSInteger)capacity;
- (NSNumber *)getValueOfKey:(NSNumber *)key;
- (void)putKey:(NSNumber *)key withValue:(NSNumber *)value;

@end
