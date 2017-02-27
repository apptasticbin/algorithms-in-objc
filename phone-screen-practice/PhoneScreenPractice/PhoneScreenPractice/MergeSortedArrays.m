//
//  MergeSortedArrays.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 27/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "MergeSortedArrays.h"

@implementation MergeSortedArrays

- (void)merge:(NSInteger *)nums1 and:(NSInteger *)nums2 m:(NSUInteger)m n:(NSUInteger)n {
    if (nums1 == nil || nums2 == nil || m == 0 || n == 0) return;
    NSInteger end1 = m-1, end2 = n-1, end = m+n-1;
    while (end2 >= 0) {
        if (end1 >= 0) {
            nums1[end--] = nums1[end1] > nums2[end2] ? nums1[end1--] : nums2[end2--];
        } else {
            nums1[end--] = nums2[end2--];
        }
    }
}

@end
