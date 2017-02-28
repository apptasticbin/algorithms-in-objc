//
//  BSTFromPreorder.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tree.h"

@interface BSTFromPreorder : NSObject

- (Tree *)BSTFromPreOrderTraversal:(NSArray<NSNumber *> *)preorder;
- (Tree *)BSTFromPreOrderRecersive:(NSArray<NSNumber *> *)preorder;
- (Tree *)BSTFromPreorderStack:(NSInteger [])preorder size:(NSUInteger)size;

@end
