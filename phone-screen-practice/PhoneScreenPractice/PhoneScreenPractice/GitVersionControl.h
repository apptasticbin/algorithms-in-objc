//
//  GitVersionControl.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 22/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commit : NSObject<NSCopying>

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) Commit *parent;

@end

@interface GitVersionControl : NSObject

- (Commit *)findAncestorOfCommit:(Commit *) c1 andCommit:(Commit *)c2;

@end
