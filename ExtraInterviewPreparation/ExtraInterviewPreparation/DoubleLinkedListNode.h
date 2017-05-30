//
//  DoubleLinkedListNode.h
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 28/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoubleLinkedListNode : NSObject

@property (nonatomic, strong) NSNumber *key;
@property (nonatomic, strong) NSNumber *value;

@property (nonatomic, strong) DoubleLinkedListNode *next;
@property (nonatomic, weak) DoubleLinkedListNode *previous;

+ (instancetype)nodeWithKey:(NSNumber *)key value:(NSNumber *)value;
+ (instancetype)nodeWithValue:(NSNumber *)value;
+ (instancetype)listWithArray:(NSArray<NSNumber *> *)array;
- (void)addBeforeNode:(DoubleLinkedListNode *)node;
- (void)addAfterNode:(DoubleLinkedListNode *)node;
- (void)removeFromCurrentList;

@end
