//
//  KCloestPoints.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 23/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "KCloestPoints.h"

@implementation KCloestPoints

- (NSArray<NSValue *> *)kCloestPoints:(NSUInteger)k fromPoints:(NSMutableArray<NSValue *> *)points {
    if (!points || !points.count || points.count < k) return nil;
    return [self kCloestPoints:k fromPoints:points start:0 end:points.count-1];
}

- (NSArray<NSValue *> *)kCloestPoints:(NSUInteger)k fromPoints:(NSMutableArray<NSValue *> *)points
                                start:(NSUInteger)start end:(NSUInteger)end {
    // http://stackoverflow.com/questions/35758588/maximum-return-value-of-arc4random
    if (start == end) return [points copy];
    NSUInteger selectedPivot = arc4random() % (end-start+1);
    NSUInteger pivotIndex = [self partition:points start:start end:end pivot:selectedPivot];
    if (pivotIndex == k) return [points subarrayWithRange:NSMakeRange(0, k)];
    if (pivotIndex > k) return [self kCloestPoints:k fromPoints:points
                                             start:start end:pivotIndex-1];
    else return [self kCloestPoints:k fromPoints:points
                              start:pivotIndex+1 end:end];
}

- (NSUInteger)partition:(NSMutableArray<NSValue *> *)points
                  start:(NSUInteger)start end:(NSUInteger)end
                  pivot:(NSUInteger)pivot {
    // choose last one as the pivot value
    NSUInteger pivotIndex = pivot;
    NSUInteger pivotDistance = [self distanceToOriginFromPoint:points[pivotIndex].pointValue];
    // move pivot value to end
    [points exchangeObjectAtIndex:pivotIndex withObjectAtIndex:end];
    for (NSUInteger i=start; i<end-1; i++) {
        // NOTICE: we should use CGPointValue for iOS
        NSUInteger distance = [self distanceToOriginFromPoint:points[i].pointValue];
        if (distance < pivotDistance) {
            [points exchangeObjectAtIndex:pivotIndex withObjectAtIndex:i];
            pivotIndex++;
        }
    }
    [points exchangeObjectAtIndex:pivotIndex withObjectAtIndex:end];
    return pivotIndex;
}

- (NSUInteger)distanceToOriginFromPoint:(CGPoint)point {
    return point.x*point.x + point.y*point.y;
}

@end
