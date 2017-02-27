//
//  BinaryTreeLevelOrderTraversal.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface BinaryTreeLevelOrderTraversal : NSObject

- (NSArray<NSArray<NSNumber *> *> *)levelOrder:(Tree *)root;

@end
