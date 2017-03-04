//
//  PopulatingNextRightsPointer.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 04/03/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeLinkNode.h"

@interface PopulatingNextRightsPointer : NSObject

- (void)connectConstantSpaceForPerfectTree:(TreeLinkNode *)root;
- (void)connectConstantSpaceForAnyTree:(TreeLinkNode *)root;
- (void)connectBFS:(TreeLinkNode *)root;

@end
