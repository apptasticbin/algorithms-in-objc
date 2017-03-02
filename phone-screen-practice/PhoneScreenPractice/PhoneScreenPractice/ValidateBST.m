//
//  ValidateBST.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 03/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ValidateBST.h"

@implementation ValidateBST

- (BOOL)isValidBST:(Tree *)root {
    Tree *pre = nil;
    return [self helper:root previous:&pre];
}

- (BOOL)helper:(Tree *)root previous:(Tree * __autoreleasing *)pre {
    if (root == nil) {
        return YES;
    }
    // check left tree
    if ([self helper:root.left previous:pre]) return NO;
    
    // check root should be larger than pre node
    // set root as pre node
    if (*pre != nil && root.value <= (*pre).value) return NO;
    *pre = root;
    
    // check right tree
    return [self helper:root.right previous:pre];
}

@end
