//
//  BinaryTreeInorderTraversal.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 02/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface BinaryTreeInorderTraversal : NSObject

- (NSArray<NSNumber *> *)inorderTraversalRecursive:(Tree *)root;
- (NSArray<NSNumber *> *)inorderTraversalInterative:(Tree *)root;
- (NSArray<NSNumber *> *)inorderTraversalInterativeBetter:(Tree *)root;

@end
