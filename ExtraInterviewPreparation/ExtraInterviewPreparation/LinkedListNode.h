//
//  LinkedListNode.h
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 24/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedListNode : NSObject

@property (nonatomic, strong) LinkedListNode *next;
@property (nonatomic, strong) id value;

+ (LinkedListNode *)nodeWithValue:(id)value;
+ (LinkedListNode *)listFromArray:(NSArray *)array;

@end
