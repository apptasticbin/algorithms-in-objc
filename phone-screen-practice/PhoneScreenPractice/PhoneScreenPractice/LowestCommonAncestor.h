//
//  LowestCommonAncestor.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 24/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface LowestCommonAncestor : NSObject

- (Tree *)LCAOfBinaryTree:(Tree *)root node1:(Tree *)node1 node2:(Tree *)node2;
- (Tree *)bottomUpLCAOfBinaryTree:(Tree *)root node1:(Tree *)node1 node2:(Tree *)node2;

@end
