//
//  Tree.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 22/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tree : NSObject

@property (nonatomic, strong) Tree *left;
@property (nonatomic, strong) Tree *right;
@property (nonatomic, assign) NSInteger value;

@end
