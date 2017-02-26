//
//  BinaryTreeToDLL.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 23/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface BinaryTreeToDLL : NSObject

- (Tree *)doubleLinkedListFromBinaryTree:(Tree *)root;
- (Tree *)simpleDoubleLinkedListFromBinaryTree:(Tree *)root;

@end
