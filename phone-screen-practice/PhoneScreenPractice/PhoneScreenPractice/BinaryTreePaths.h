//
//  BinaryTreePaths.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 01/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface BinaryTreePaths : NSObject

- (NSArray<NSString *> *)binaryTreePaths:(Tree *)root;
- (NSArray<NSString *> *)binaryTreePathsShort:(Tree *)root;

@end
