//
//  DecodeWays.h
//  PhoneScreenPractice
//
//  Created by Bin Yu on 28/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DecodeWays : NSObject

- (NSUInteger)numDecodingsDP:(NSString *)s;
- (NSUInteger)numDecodingsConstantSpace:(NSString *)s;

@end
