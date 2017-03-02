//
//  BinarySearchTreeIterator.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface BSTIterator : NSObject

- (instancetype)init:(Tree *)root;
- (BOOL)hasNext;
- (NSInteger)next;

@end
