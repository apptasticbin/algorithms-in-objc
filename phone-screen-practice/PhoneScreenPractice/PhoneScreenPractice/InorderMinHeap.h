//
//  InorderMinHeap.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 07/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface InorderMinHeap : NSObject

- (Tree *)inOrderMinimumHeap:(NSArray<NSNumber *> *)nums;

@end
