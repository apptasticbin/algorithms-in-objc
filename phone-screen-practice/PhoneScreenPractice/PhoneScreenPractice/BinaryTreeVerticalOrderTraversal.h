//
//  BinaryTreeVerticalOrderTraversal.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 03/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface BinaryTreeVerticalOrderTraversal : NSObject

- (NSArray<NSArray<NSNumber *> *> *)verticalOrder:(Tree *)root;

@end
