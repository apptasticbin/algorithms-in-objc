//
//  VerifyPreorderBST.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 23/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerifyPreorderBST : NSObject

- (BOOL)verifyPreorderBST:(NSArray *)bst;
- (BOOL)verifyPreorderBSTWithStack:(NSArray<NSNumber *> *)preorder;

@end
