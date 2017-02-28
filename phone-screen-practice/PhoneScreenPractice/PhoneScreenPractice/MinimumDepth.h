//
//  MinimumDepth.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface MinimumDepth : NSObject

- (NSUInteger)minDepthDFS:(Tree *)root;
- (NSUInteger)minDepthBFS:(Tree *)root;

@end
