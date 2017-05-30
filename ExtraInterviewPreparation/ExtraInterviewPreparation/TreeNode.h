//
//  TreeNode.h
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 24/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode : NSObject <NSCopying>

@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;
@property (nonatomic, strong) NSNumber *value;

+ (TreeNode *)treeNodeWithValue:(NSNumber *)value;
+ (TreeNode *)treeFromArray:(NSArray<NSNumber *> *)array;

@end
