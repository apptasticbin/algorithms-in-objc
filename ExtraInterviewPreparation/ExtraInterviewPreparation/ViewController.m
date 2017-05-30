//
//  ViewController.m
//  ExtraInterviewPreparation
//
//  Created by Bin Yu on 24/05/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "ViewController.h"
#import "TreeNode.h"
#import "LinkedListNode.h"
#import "NestedArrayIterator.h"
#import "TrieNode.h"
#import "Trie.h"
#import "DoubleLinkedListNode.h"
#import "LRUCache.h"
#import "MoveAverageDataStream.h"

#define BOOLSTRING(x) x ? @"YES" : @"NO"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tryRunLengthEncoding];
}

#pragma mark - Foundations

- (void)tryRunLengthEncoding {
    NSString *input = @"wwwwaaadexxxxxx";
    // w4a3d1e1x6
    NSLog(@"Run length encoding of %@: %@", input, [self runLengthEncoding:input]);
    
    input = @"w";
    // w1
    NSLog(@"Run length encoding of %@: %@", input, [self runLengthEncoding:input]);
}

- (void)tryDecodeWays {
    NSString *input = @"12";
    NSLog(@"Decode ways of %@: %@", input, @([self decodeWays:input]));
    NSLog(@"All decode ways of %@: %@", input, [self allDecodeWays:input]);
    
    input = @"1214382";
    NSLog(@"Decode ways of %@: %@", input, @([self decodeWays:input]));
    NSLog(@"All decode ways of %@: %@", input, [self allDecodeWays:input]);

}

- (void)tryCombineSum {
    NSArray *input = @[@(6), @(2), @(3), @(6), @(2), @(7), @(3)];
    NSInteger target = 7;
    NSLog(@"Combine sum of %@ for %@: %@", input, @(target), [self combineSum:input target:target]);
}

- (void)tryWordSearchII {
    NSArray<NSArray<NSString *> *> *letters = @[
                                                @[@"o", @"a", @"a", @"n"],
                                                @[@"e", @"t", @"a", @"e"],
                                                @[@"i", @"h", @"k", @"r"],
                                                @[@"i", @"f", @"l", @"v"]
                                                ];
    NSArray<NSString *> *words = @[@"oath", @"pea", @"eat", @"rain"];
    NSLog(@"Found words among letters %@: %@", letters, [self wordSearchII:letters words:words]);
}

- (void)tryVerifyPreorderBST {
    NSArray *input = @[@(5), @(2), @(1), @(3), @(6)];
    NSLog(@"Verify sequence %@ as preorder BST: %@", input, BOOLSTRING([self verifyPreorderBSTII:input]));
    
    input = @[@(5), @(2), @(1), @(3), @(0)];
    NSLog(@"Verify sequence %@ as preorder BST: %@", input, BOOLSTRING([self verifyPreorderBSTII:input]));
}

- (void)tryNextPermutation {
    NSArray *input = @[@(1), @(2), @(3)];
    NSLog(@"Next permutation of %@: %@", input, [self nextPermutation:input]);
    
    input = @[@(3), @(2), @(1)];
    NSLog(@"Next permutation of %@: %@", input, [self nextPermutation:input]);
    
    input = @[@(1), @(1), @(5)];
    NSLog(@"Next permutation of %@: %@", input, [self nextPermutation:input]);
    
    input = @[@(1), @(3), @(4), @(5), @(2)];
    NSLog(@"Next permutation of %@: %@", input, [self nextPermutation:input]);
    
    input = @[@(1), @(3), @(5), @(4), @(2)];
    NSLog(@"Next permutation of %@: %@", input, [self nextPermutation:input]);
}

- (void)trySortColorII {
    NSArray<NSNumber *> *colors = @[@(3), @(7), @(1), @(8), @(2), @(6), @(4), @(5), @(4), @(9), @(7)];
    NSInteger k = 9;
    NSLog(@"Sort colors %@: %@", colors, [self sortColorsII:colors k:k]);
    
    colors = @[@(3), @(1)];
    k = 3;
    NSLog(@"Sort colors %@: %@", colors, [self sortColorsII:colors k:k]);
    
    colors = @[@(3), @(1), @(3), @(3), @(1)];
    k = 3;
    NSLog(@"Sort colors %@: %@", colors, [self sortColorsII:colors k:k]);
}

- (void)tryMoveAverageDataStream {
    MoveAverageDataStream *moveAverage = [[MoveAverageDataStream alloc] initWithCapacity:3];
    NSLog(@"Add %@: %@", @(1), @([moveAverage next:1]));
    NSLog(@"Add %@: %@", @(10), @([moveAverage next:10]));
    NSLog(@"Add %@: %@", @(3), @([moveAverage next:3]));
    NSLog(@"Add %@: %@", @(5), @([moveAverage next:5]));
}

- (void)tryLRUCache {
    LRUCache *cache = [[LRUCache alloc] initWithCapacity:2];
    [cache putKey:@(1) withValue:@(1)];
    [cache putKey:@(2) withValue:@(2)];
    NSLog(@"Get %@: %@", @(1), [cache getValueOfKey:@(1)]);
    [cache putKey:@(3) withValue:@(3)];
    NSLog(@"Get %@: %@", @(2), [cache getValueOfKey:@(2)]);
    [cache putKey:@(4) withValue:@(4)];
    NSLog(@"Get %@: %@", @(1), [cache getValueOfKey:@(1)]);
    NSLog(@"Get %@: %@", @(3), [cache getValueOfKey:@(3)]);
    NSLog(@"Get %@: %@", @(4), [cache getValueOfKey:@(4)]);
}

- (void)tryDoubleLinkedList {
    DoubleLinkedListNode *head = [DoubleLinkedListNode listWithArray:@[@(1), @(2), @(3), @(4), @(5), @(6)]];
    NSLog(@"Create double linked list: %@", head);
    
    DoubleLinkedListNode *newNode = [DoubleLinkedListNode nodeWithValue:@(99)];
    [newNode addAfterNode:head];
    NSLog(@"Current double linked list: %@", head);
    
    [newNode removeFromCurrentList];
    NSLog(@"Current double linked list: %@", head);
}

- (void)tryRemoveInvalidParentheses {
    NSString *input = @"()())()";
    NSLog(@"Remove invalid parentheses from %@: %@", input, [self removeInvalidParentheses:input]);
    
    input = @"(a)())()";
    NSLog(@"Remove invalid parentheses from %@: %@", input, [self removeInvalidParentheses:input]);

    input = @")(";
    NSLog(@"Remove invalid parentheses from %@: %@", input, [self removeInvalidParentheses:input]);
}

- (void)tryKCloestPoints {
    NSArray<NSValue *> *points = @[
                                   [NSValue valueWithCGPoint:CGPointMake(3, 3)],
                                   [NSValue valueWithCGPoint:CGPointMake(1, 1)],
                                   [NSValue valueWithCGPoint:CGPointMake(2, 2)],
                                   [NSValue valueWithCGPoint:CGPointMake(4, 4)],
                                   [NSValue valueWithCGPoint:CGPointMake(9, 9)],
                                   [NSValue valueWithCGPoint:CGPointMake(5, 5)],
                                   [NSValue valueWithCGPoint:CGPointMake(7, 7)]];
    NSInteger k = 5;
    NSLog(@"%@ cloest points to zeor of %@: %@", @(k), points, [self kCloestPoints:points k:k]);
}

- (void)tryValidatePalindrome {
    NSString *input = @"A man, a plan, a canal: Panama";
    NSLog(@"%@ is palindrome: %@", input, BOOLSTRING([self validatePalindrome:input]));
    
    input = @"race a car";
    NSLog(@"%@ is palindrome: %@", input, BOOLSTRING([self validatePalindrome:input]));

}

- (void)tryStrStr {
    NSString *string = @"abcdefghigk";
    NSString *substring = @"def";
    NSLog(@"Index of substring %@ in string %@: %@", substring, string, @([self hasString:substring inString:string]));
    
    string = @"abcdefghigk";
    substring = @"aefa";
    NSLog(@"Index of substring %@ in string %@: %@", substring, string, @([self hasString:substring inString:string]));

}

- (void)tryMaxSizeOfSubarraySumToTarget {
    NSArray<NSNumber *> *numbers = @[@(1), @(-1), @(5), @(-2), @(3)];
    NSInteger target = 3;
    NSLog(@"Max size of subarray in %@ with sum of %@: %@",
          numbers, @(target), [self maxSizeOfSubarray:numbers sumTo:target]);
}

- (void)tryBinaryTreeLevelOrderTraversal {
    TreeNode *root = [TreeNode treeFromArray:@[@(4), @(2), @(6), @(1), @(3), @(5), @(7)]];
    NSLog(@"Levels of tree %@: %@", root, [self binaryTreeLevelOrderTraversal:root]);
}

- (void)tryFourSum {
    NSArray<NSNumber *> *numbers = @[@(1), @(0), @(-1), @(0), @(-2), @(2)];
    NSInteger sum = 0;
    NSLog(@"Numbers in %@ with sum of %@: %@", numbers, @(sum), [self fourSum:numbers sum:sum]);
    
    numbers = @[@(-1), @(0), @(1), @(2), @(-1), @(-4)];
    sum = -2;
    NSLog(@"Numbers in %@ with sum of %@: %@", numbers, @(sum), [self fourSum:numbers sum:sum]);
}

- (void)tryThreeSum {
    NSArray<NSNumber *> *numbers = @[@(-1), @(0), @(1), @(2), @(-1), @(-4)];
    NSInteger sum = 0;
    NSLog(@"Numbers in %@ with sum of %@: %@", numbers, @(sum), [self threeSum:numbers sum:sum]);
    
    numbers = @[@(-1), @(0), @(1), @(2), @(-1), @(-4)];
    sum = -2;
    NSLog(@"Numbers in %@ with sum of %@: %@", numbers, @(sum), [self threeSum:numbers sum:sum]);

}

- (void)tryTwoSum {
    NSArray<NSNumber *> *numbers = @[@(7), @(2), @(15), @(11)];
    NSInteger sum = 22;
    NSLog(@"Indeces of sum of %@ in %@: %@", @(sum), numbers, [self twoSum:numbers sum:sum]);
}

- (void)tryLowestCommonAncestor {
    TreeNode *root = [TreeNode treeFromArray:@[@(4), @(2), @(6), @(1), @(3), @(5), @(7)]];
    TreeNode *node1 = [TreeNode treeNodeWithValue:@(2)];
    TreeNode *node2 = [TreeNode treeNodeWithValue:@(3)];
    NSLog(@"LCA between %@ and %@ in tree %@: %@", node1.value, node2.value, root,
          [self lowestCommonAncestorBetweenNode:node1 andNode:node2 inTree:root].value);
    
    node1 = [TreeNode treeNodeWithValue:@(3)];
    node2 = [TreeNode treeNodeWithValue:@(5)];
    NSLog(@"LCA between %@ and %@ in tree %@: %@", node1.value, node2.value, root,
          [self lowestCommonAncestorBetweenNode:node1 andNode:node2 inTree:root].value);
    
    node1 = [TreeNode treeNodeWithValue:@(5)];
    node2 = [TreeNode treeNodeWithValue:@(7)];
    NSLog(@"LCA between %@ and %@ in tree %@: %@", node1.value, node2.value, root,
          [self lowestCommonAncestorBetweenNode:node1 andNode:node2 inTree:root].value);
}

- (void)tryCloneBinaryTree {
    TreeNode *root = [TreeNode treeFromArray:@[@(4), @(2), @(6), @(1), @(3), @(5), @(7)]];
    TreeNode *cloneRoot = [self cloneBinaryTree:root];
    NSLog(@"Clone binary tree %@: %@", root, cloneRoot);
}

- (void)tryRemoveDuplicateStrings {
    NSArray<NSString *> *input = @[@"abc", @"efc", @"abc", @"bce", @"abc", @"efc"];
    NSLog(@"Remove duplicates of %@: %@", input, [self removeDuplicateStringsTrie:input]);
}

- (void)tryTrie {
    Trie *wordTrie = [Trie new];
    NSArray<NSString *> *input = @[@"abc", @"efc", @"bce"];
    for (NSString *word in input) {
        [wordTrie addWord:word];
    }
    
    NSString *word = @"abc";
    NSLog(@"Find word %@: %@", word, BOOLSTRING([wordTrie searchWord:word]));
    
    word = @"eav";
    NSLog(@"Find word %@: %@", word, BOOLSTRING([wordTrie searchWord:word]));
    
    word = @"..c";
    NSLog(@"Find word %@: %@", word, BOOLSTRING([wordTrie searchWord:word]));
    
    word = @"...";
    NSLog(@"Find word %@: %@", word, BOOLSTRING([wordTrie searchWord:word]));
    
    word = @".d.";
    NSLog(@"Find word %@: %@", word, BOOLSTRING([wordTrie searchWord:word]));
}

- (void)tryIntegerFromString {
    NSString *input = @"+2938472";
    NSLog(@"Integer from string %@: %@", input, @([self integerFromString:input]));
    
    input = @"+";
    NSLog(@"Integer from string %@: %@", input, @([self integerFromString:input]));
    
    input = @"-192";
    NSLog(@"Integer from string %@: %@", input, @([self integerFromString:input]));

    input = @"-0002093";
    NSLog(@"Integer from string %@: %@", input, @([self integerFromString:input]));
    
    input = @"   -  0 002093";
    NSLog(@"Integer from string %@: %@", input, @([self integerFromString:input]));
}

- (void)tryVerifyBinarySearchTree {
    TreeNode *binarySearchTree = [TreeNode treeFromArray:@[@(4), @(2), @(6), @(1), @(3), @(5), @(7)]];
    NSLog(@"Binary search tree %@ is valid: %@",
          binarySearchTree, BOOLSTRING([self verifyBinarySearchTree:binarySearchTree]));
    
    binarySearchTree = [TreeNode treeFromArray:@[@(4), @(22), @(6), @(1), @(3), @(0), @(7)]];
    NSLog(@"Binary search tree %@ is valid: %@",
          binarySearchTree, BOOLSTRING([self verifyBinarySearchTree:binarySearchTree]));
}

- (void)tryRemoveDuplicateNumbers {
    NSArray<NSNumber *> *input = @[@(3), @(0), @(0), @(0), @(5), @(5), @(6)];
    NSLog(@"Remove Continuous Duplicates in %@: %@", input, [self removeContinuousDuplicates:input]);
    
    input = @[@(3), @(0), @(3), @(0), @(5), @(1), @(5)];
    NSLog(@"Remove Duplicates %@: %@", input, [self removeDuplicates:input]);
}

- (void)tryNestedArrayIterator {
    NSArray<NSNumber *> *nestedArray = @[@[@(1), @(2)], @(3), @[@(4), @[@(5), @[@(6), @(7)]]]];
    NestedArrayIterator *nestedArrayIterator = [[NestedArrayIterator alloc] initWithNestedArray:nestedArray];
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray array];
    while (YES) {
        NSNumber *nextNumber = [nestedArrayIterator next];
        if (!nextNumber) {
            break;
        }
        [numbers addObject:nextNumber];
    }
    NSLog(@"Flatten nested array %@: %@", nestedArray, numbers);
}

- (void)tryMoveZeros {
    NSMutableArray<NSNumber *> *numbers = [NSMutableArray arrayWithArray:@[@(3), @(0), @(4), @(0), @(5), @(0), @(6)]];
    NSLog(@"Move Zeros in %@: %@", [numbers copy], [self moveZeros:numbers]);
}

- (void)tryBinaryTreeFromLinkedList {
    LinkedListNode *head = [LinkedListNode listFromArray:@[@(3), @(1), @(4), @(0), @(5), @(2), @(6)]];
    NSLog(@"Linked List: %@\n to Tree: %@", head, [self binaryTreeFromLinkedList:head]);
    
    head = [LinkedListNode listFromArray:@[@(1), @(4), @(0), @(5), @(2), @(6)]];
    NSLog(@"Linked List: %@\n to Tree: %@", head, [self binaryTreeFromLinkedList:head]);
}

- (void)tryLinkedListFromBinaryTree {
    TreeNode *root = [TreeNode treeFromArray:@[@(0), @(1), @(2), @(3), @(4), @(5), @(6)]];
    NSLog(@"Tree: %@\nto Linked List:%@", root, [self linkedListFromBinaryTree:root]);
}

- (void)trySwapLinkedList {
    LinkedListNode *linkedList = [LinkedListNode listFromArray:@[@(0), @(1), @(2), @(3), @(4)]];
    NSLog(@"%@", [self swapLinkedList:linkedList]);
}

- (void)tryLinkedList {
    LinkedListNode *linkedList = [LinkedListNode listFromArray:@[@(0), @(1), @(2), @(3), @(4)]];
    NSLog(@"%@", linkedList);
}

- (void)tryTree {
    TreeNode *root = [TreeNode treeFromArray:@[@(0), @(1), @(2), @(3), @(4), @(5)]];
    NSLog(@"%@", root);
}

# pragma mark - Questions

- (NSString *)runLengthEncoding:(NSString *)input {
    if (!input || !input.length) {
        return input;
    }
    
    NSMutableString *encode = [NSMutableString string];
    for (NSInteger i = 0; i < input.length; i++) {
        NSInteger count = 1;
        while ((i < input.length - 1) &&
               [input characterAtIndex:i] == [input characterAtIndex:i+1]) {
            i++;
            count++;
        }
        [encode appendFormat:@"%C%ld", [input characterAtIndex:i], count];
    }
    return [encode copy];
}

- (NSArray<NSString *> *)allDecodeWays:(NSString *)encode {
    if (!encode || !encode.length) {
        return nil;
    }
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    [self allDecodeWaysHelper:encode start:0 result:[NSMutableArray array] results:results];
    return results;
}

- (void)allDecodeWaysHelper:(NSString *)encode
                      start:(NSInteger)start
                     result:(NSMutableArray<NSString *> *)result
                    results:(NSMutableArray<NSString *> *)results {
    if (start >= encode.length) {
        [results addObject:[result componentsJoinedByString:@""]];
        return;
    }
    
    NSInteger c1 = [encode substringWithRange:NSMakeRange(start, 1)].integerValue;
    
    if (c1 == 0) {
        return;
    }
    
    if (c1 > 0 && c1 <= 9) {
        [result addObject:[self decodeFrom:c1]];
        [self allDecodeWaysHelper:encode start:start+1 result:result results:results];
        [result removeLastObject];
    }
    
    if (start >= encode.length - 1) {
        return;
    }
    NSInteger c2 = [encode substringWithRange:NSMakeRange(start+1, 1)].integerValue;
    if (c1 == 1 || (c1 == 2 && c2 >= 0 && c2 <= 6)) {
        [result addObject:[self decodeFrom:c1*10+c2]];
        [self allDecodeWaysHelper:encode start:start+2 result:result results:results];
        [result removeLastObject];
    }
}

- (NSString *)decodeFrom:(NSInteger)encode {
    return @[@"",
             @"A", @"B", @"C", @"D", @"E", @"F", @"G",
             @"H", @"I", @"J", @"K", @"L", @"M", @"N",
             @"O", @"P", @"Q",
             @"R", @"S", @"T",
             @"U", @"V", @"W",
             @"X", @"Y", @"Z"][encode];
}

- (NSInteger)decodeWays:(NSString *)encode {
    if (!encode || !encode.length) {
        return 0;
    }
    NSInteger dp[encode.length+1];
    memset(dp, 0, sizeof(dp));
    dp[0] = 1;
    dp[1] = [encode characterAtIndex:0] == '0' ? 0 : 1;
    for (NSInteger i = 2; i <= encode.length; i++) {
        NSInteger c = [encode substringWithRange:NSMakeRange(i-1, 1)].integerValue;
        NSInteger pc = [encode substringWithRange:NSMakeRange(i-2, 1)].integerValue;
        if (c > 0 && c <= 9) {
            dp[i] += dp[i-1];
        }
        if (pc == 1 || (pc == 2 && c >= 0 && c < 7)) {
            dp[i] += dp[i-2];
        }
    }
    return dp[encode.length];
}

- (NSArray<NSArray<NSNumber *> *> *)combineSum:(NSArray<NSNumber *> *)numbers
                                        target:(NSInteger)target {
    if (!numbers || !numbers.count) {
        return nil;
    }
    // SORTING is the MOST important step
    numbers = [numbers sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    [self combineSumWithHelper:numbers
                         start:0 target:target
                        result:[NSMutableArray array]
                       results:results];
    return results;
}

- (void)combineSumWithHelper:(NSArray<NSNumber *> *)numbers
                       start:(NSInteger)start
                      target:(NSInteger)target
                      result:(NSMutableArray<NSNumber *> *)result
                     results:(NSMutableArray<NSArray<NSNumber *> *> *)results {
    if (start == numbers.count || target < 0) {
        return;
    }
    if (target == 0) {
        [results addObject:[result copy]];
        return;
    }
    for (NSInteger i = start; i < numbers.count; i++) {
        if (i > start && [numbers[i] isEqualToNumber:numbers[i-1]]) {
            continue;
        }
        NSNumber *num = numbers[i];
        [result addObject:num];
        [self combineSumWithHelper:numbers
                             start:i target:target-num.integerValue
                            result:result
                           results:results];
        [result removeLastObject];
    }
}

- (NSArray<NSString *> *)wordSearchII:(NSArray<NSArray<NSString *> *> *)letters
                                words:(NSArray<NSString *> *)words {
    if (!letters || !letters.count) {
        return nil;
    }
    NSInteger m = letters.count;
    if (!letters[0].count) {
        return nil;
    }
    NSInteger n = letters[0].count;
    
    Trie *wordTrie = [Trie new];
    for (NSString *word in words) {
        [wordTrie addWord:word];
    }
    
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    for (NSInteger i = 0; i < m; i++) {
        for (NSInteger j = 0; j < n; j++) {
            [self wordSearchIIHelper:letters
                                   x:i y:j
                                   m:m n:n
                                node:wordTrie.root
                             visited:[NSMutableSet set]
                              result:[NSMutableArray array]
                             results:results];
        }
    }
    
    return results;
}

- (void)wordSearchIIHelper:(NSArray<NSArray<NSString *> *> *)letters
                         x:(NSInteger)x y:(NSInteger)y
                         m:(NSInteger)m n:(NSInteger)n
                      node:(TrieNode *)node
                   visited:(NSMutableSet<NSValue *> *)visited
                    result:(NSMutableArray<NSString *> *)result
                   results:(NSMutableArray<NSString *> *)results {
    if (x < 0 || y < 0 || x >= m || y >= n) {
        return;
    }
    
    NSValue *pos = [NSValue valueWithCGPoint:CGPointMake(x, y)];
    if ([visited containsObject:pos]) {
        return;
    }
    
    [visited addObject:pos];
    
    NSString *c = letters[x][y];
    if (![node hasChild:c]) {
        return;
    }
    
    TrieNode *nextNode = [node getChild:c];
    [result addObject:c];
    
    if (nextNode.isWord) {
        [results addObject:[result componentsJoinedByString:@""]];
    }
    
    NSArray<NSArray<NSNumber *> *> *deltas = @[ @[@(1), @(0)], @[@(-1), @(0)], @[@(0), @(1)], @[@(0), @(-1)] ];
    for (NSArray<NSNumber *> *delta in deltas) {
        [self wordSearchIIHelper:letters
                               x:x + delta[0].integerValue y:y + delta[1].integerValue
                               m:m n:n node:nextNode
                         visited:visited
                          result:result
                         results:results];
    }
    
    [result removeLastObject];
    [visited removeObject:pos];
}

- (BOOL)verifyPreorderBSTII:(NSArray<NSNumber *> *)input {
    if (!input || !input.count) {
        return NO;
    }
    return [self verifyPreorderBSTHelper:input start:0 end:input.count-1 min:NSIntegerMin max:NSIntegerMax];
}

- (BOOL)verifyPreorderBSTHelper:(NSArray<NSNumber *> *)input
                          start:(NSInteger)start end:(NSInteger)end
                            min:(NSInteger)min max:(NSInteger)max {
    if (start > end) {
        return YES;
    }
    NSInteger cur = input[start].integerValue;
    if (cur <= min || cur >= max) {
        return NO;
    }
    NSInteger i = 0;
    for (i = start + 1; i <= end; i++) {
        if (input[i].integerValue > cur) {
            break;
        }
    }
    return [self verifyPreorderBSTHelper:input start:start+1 end:i-1 min:min max:cur] &&
    [self verifyPreorderBSTHelper:input start:i end:end min:cur max:max];
}

// http://www.cnblogs.com/grandyang/p/5327635.html
- (BOOL)verifyPreorderBST:(NSArray<NSNumber *> *)input {
    if (!input || !input.count) {
        return input;
    }
    
    NSMutableArray<NSNumber *> *stack = [NSMutableArray array];
    NSInteger lastRoot = NSIntegerMin;
    for (NSInteger i = 0; i < input.count; i++) {
        NSInteger cur = input[i].integerValue;
        if (cur < lastRoot) {
            return NO;
        }
        while (stack.count > 0 && cur >= stack.lastObject.integerValue) {
            lastRoot = stack.lastObject.integerValue;
            [stack removeLastObject];
        }
        [stack addObject:@(cur)];
    }
    return YES;
}

// NOTICE: string CAN NOT be separated by empty string @""
// previousPermutation is similar
// 1 3 4 5 2 -> 1 3 5 4 2
// https://leetcode.com/problems/next-permutation/#/solutions
- (NSArray<NSNumber *> *)nextPermutation:(NSArray<NSNumber *> *)input {
    if (!input || !input.count || input.count < 2) {
        return input;
    }
    NSMutableArray<NSNumber *> *next = [input mutableCopy];
    NSInteger i = next.count-2;
    for (; i >= 0; i--) {
        if (next[i].integerValue < next[i+1].integerValue) {
            break;
        }
    }
    // NOTICE: i is -1, not 0
    if (i < 0) {
        return next.reverseObjectEnumerator.allObjects;
    }
    // find first number which is GREATER THAN ith number
    for (NSInteger j = next.count - 1; j > i; j--) {
        if (next[i].integerValue < next[j].integerValue) {
            [next exchangeObjectAtIndex:i withObjectAtIndex:j];
            break;
        }
    }
    
    NSArray<NSNumber *> *reverse = [next subarrayWithRange:NSMakeRange(i+1, next.count-i-1)];
    reverse = reverse.reverseObjectEnumerator.allObjects;
    [next replaceObjectsInRange:NSMakeRange(i+1, next.count-i-1) withObjectsFromArray:reverse];
    
    return [next copy];
}

// NLog(K)
- (NSArray<NSNumber *> *)sortColorsII:(NSArray<NSNumber *> *)colors k:(NSUInteger)k {
    if (!colors || !colors.count || k < 1) {
        return colors;
    }
    NSMutableArray<NSNumber *> *sortedColors = [colors mutableCopy];
    [self sortColorsIIHelper:sortedColors start:0 end:colors.count-1 startColor:1 endColor:k];
    return sortedColors;
}

- (void)sortColorsIIHelper:(NSMutableArray<NSNumber *> *)colors
                     start:(NSInteger)start end:(NSInteger)end
                startColor:(NSInteger)startColor endColor:(NSInteger)endColor {
    if (start >= end || startColor == endColor) {
        return;
    }
    NSInteger midColor = startColor + (endColor - startColor) / 2;
    NSInteger less = start;
    for (NSInteger more = start; more <= end; more++) {
        if (colors[more].integerValue < midColor) {
            [colors exchangeObjectAtIndex:less withObjectAtIndex:more];
            less++;
        }
    }
    
    [self sortColorsIIHelper:colors start:start end:less-1 startColor:startColor endColor:midColor-1];
    [self sortColorsIIHelper:colors start:less end:end startColor:midColor+1 endColor:end];
}

// BFS Graph, not Tree
- (NSArray<NSString *> *)removeInvalidParentheses:(NSString *)input {
    if (!input || !input.length) {
        return nil;
    }
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    NSMutableArray<NSString *> *queue = [NSMutableArray array];
    // IMPORTANT: check duplicates
    NSMutableSet<NSString *> *visited = [NSMutableSet set];
    BOOL found = NO;
    NSInteger length = 0;
    
    [queue addObject:input];
    
    while (queue.count) {
        NSString *top = queue.firstObject;
        if (top.length < length) {
            break;
        }
        
        if ([self isValidParentheses:top]) {
            [results addObject:top];
            found = YES;
            length = top.length;
        }
        [queue removeObjectAtIndex:0];
        
        if (found) continue;
        
        for (NSInteger i = 0; i < top.length; i++) {
            unichar c = [top characterAtIndex:i];
            if (![self isParenthese:c]) {
                continue;
            }
            NSString *next = [NSString stringWithFormat:@"%@%@", [top substringToIndex:i], [top substringFromIndex:i+1]];
            if (![visited containsObject:next]) {
                [visited addObject:next];
                [queue addObject:next];
            }
        }
    }
    
    return results;
}
                
- (BOOL)isValidParentheses:(NSString *)input {
    NSInteger left = 0;
    for (NSInteger i = 0; i < input.length; i++) {
        unichar c = [input characterAtIndex:i];
        if (c == '(') {
            left++;
        } else if (c == ')') {
            left--;
        }
        if (left < 0) {
            return NO;
        }
    }
    return left == 0;
}

- (BOOL)isParenthese:(unichar)input {
    return input == '(' || input == ')';
}

- (NSInteger)read:(NSInteger)size buffer:(char *)buffer {
    NSInteger total = 0;
    char buffer4[4];
    
    while (YES) {
        NSInteger readSize = [self read4:buffer4];
        for (NSInteger i = 0; i < readSize && total < size; i++) {
            buffer[total++] = buffer4[i];
        }
        if (total == size || readSize == 0) break;
    }
    
    return total;
}

- (NSInteger)read4:(char *)buffer {
    return 4;
}

- (NSArray<NSValue *> *)kCloestPoints:(NSArray<NSValue *> *)points k:(NSUInteger)k{
    if (!points || !points.count || k == 0 || k > points.count) {
        return nil;
    }
    return [self select:[points mutableCopy] k:k start:0 end:points.count-1];
}

- (NSArray<NSValue *> *)select:(NSMutableArray<NSValue *> *)points k:(NSUInteger)k
                                start:(NSInteger)start end:(NSInteger)end {
    if (start == end) {
        return [points subarrayWithRange:NSMakeRange(0, start)];
    }
    NSInteger pivot = arc4random_uniform((uint32_t)(end-start+1)) + start;
    NSInteger pIndex = [self partition:points start:start end:end pivot:pivot];
    // IMPORTANT: pIndex == k, NOT k-1
    if (pIndex == k) {
        return [points subarrayWithRange:NSMakeRange(0, k)];
    } else if (pIndex > k) {
        return [self select:points k:k start:start end:pIndex-1];
    } else {
        return [self select:points k:k start:pIndex+1 end:end];
    }
}

- (NSInteger)partition:(NSMutableArray<NSValue *> *)points
                 start:(NSInteger)start end:(NSInteger)end
                 pivot:(NSInteger)pivot {
    NSInteger pivotDist = [self distanceToZero:points[pivot].CGPointValue];
    [points exchangeObjectAtIndex:pivot withObjectAtIndex:end];
    NSInteger left = start;
    for (NSInteger right = start; right < end; right++) {
        NSInteger rightDist = [self distanceToZero:points[right].CGPointValue];
        if (rightDist <= pivotDist) {
            [points exchangeObjectAtIndex:left withObjectAtIndex:right];
            left++;
        }
    }
    [points exchangeObjectAtIndex:left withObjectAtIndex:end];
    return left;
}

- (NSInteger)distanceToZero:(CGPoint)point {
    return point.x * point.x + point.y * point.y;
}

- (BOOL)validatePalindrome:(NSString *)input {
    if (!input || !input.length) {
        return NO;
    }
    
    NSInteger left = 0;
    NSInteger right = input.length - 1;
    NSCharacterSet *alphanumericSet = [NSCharacterSet alphanumericCharacterSet];
    
    while (left < right) {
        while (left < right && ![alphanumericSet characterIsMember:[input characterAtIndex:left]]) {
            left++;
        }
        while (left < right && ![alphanumericSet characterIsMember:[input characterAtIndex:right]]) {
            right--;
        }
        
        if (left < right) {
            NSString *lc = [input substringWithRange:NSMakeRange(left, 1)];
            NSString *rc = [input substringWithRange:NSMakeRange(right, 1)];
            if (![lc.lowercaseString isEqualToString:rc.lowercaseString]) {
                return NO;
            }
        }
        left++; right--;
    }
    return YES;
}

- (NSInteger)hasString:(NSString *)substring inString:(NSString *)string {
    if (!substring || !string ||
        !substring.length || !string.length ||
        substring.length > string.length) {
        return -1;
    }
    
    for (NSInteger i = 0; i < string.length - substring.length; i++) {
        NSInteger j = 0;
        for (; j < substring.length; j++) {
            if ([string characterAtIndex:i+j] != [substring characterAtIndex:j]) {
                break;
            }
        }
        if (j == substring.length) return i;
    }
    return -1;
}

- (NSArray<NSNumber *> *)maxSizeOfSubarray:(NSArray<NSNumber *> *)numbers sumTo:(NSInteger)target {
    if (!numbers || !numbers.count) {
        return nil;
    }
    
    NSMutableDictionary<NSNumber *, NSNumber *> *previousSums = [NSMutableDictionary dictionary];
    NSInteger sum = 0;
    NSInteger maxSize = 0;
    NSInteger start = 0;
    
    for (NSInteger i = 0; i < numbers.count; i++) {
        sum += numbers[i].integerValue;
        if (sum == target) {
            if (i+1 > maxSize) {
                start = 0;
                maxSize = i+1;
            }
        } else if (previousSums[@(sum-target)]) {
            // i - (pre + 1) +1 => i - pre
            if (i-previousSums[@(sum-target)].integerValue > maxSize) {
                maxSize = i-previousSums[@(sum-target)].integerValue;
                start = previousSums[@(sum-target)].integerValue + 1;
            }
        }
        if (!previousSums[@(sum)]) {
            previousSums[@(sum)] = @(i);
        }
    }
    return [numbers subarrayWithRange:NSMakeRange(start, maxSize)];
}

- (NSArray<NSArray<NSNumber *> *> *)binaryTreeLevelOrderTraversal:(TreeNode *)root {
    if (!root) {
        return nil;
    }
    
    NSMutableArray<NSArray<NSNumber *> *> *levels = [NSMutableArray array];
    NSMutableArray<TreeNode *> *queue = [NSMutableArray array];
    [queue addObject:root];
    
    while (queue.count) {
        NSInteger size = queue.count;
        NSMutableArray<NSNumber *> *level = [NSMutableArray array];
        for (NSInteger i = 0; i < size; i++) {
            TreeNode *node = queue[i];
            [level addObject:node.value];
            if (node.left) {
                [queue addObject:node.left];
            }
            if (node.right) {
                [queue addObject:node.right];
            }
        }
        [levels addObject:level];
        [queue removeObjectsInRange:NSMakeRange(0, size)];
    }
    
    return levels;
}

- (NSArray<NSArray<NSNumber *> *> *)fourSum:(NSArray<NSNumber *> *)numbers sum:(NSInteger)sum {
    if (!numbers || !numbers.count) {
        return nil;
    }
    
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    numbers = [numbers sortedArrayUsingSelector:@selector(compare:)];
    
    for (NSInteger i = 0; i < numbers.count - 3; i++) {
        if (i > 0 && [numbers[i] isEqualToNumber:numbers[i-1]]) {
            continue;
        }
        
        for (NSInteger j = i+1; j < numbers.count - 2; j++) {
            if (j > i+1 && [numbers[j] isEqualToNumber:numbers[j-1]]) {
                continue;
            }
            
            NSInteger target = sum - numbers[i].integerValue - numbers[j].integerValue;
            NSInteger k = j + 1;
            NSInteger l = numbers.count - 1;
            
            while (k < l) {
                if (numbers[k].integerValue + numbers[l].integerValue == target) {
                    [results addObject:@[numbers[i], numbers[j], numbers[k], numbers[l]]];
                    k++; l--;
                    
                    while (k < l && [numbers[k] isEqualToNumber:numbers[k-1]]) {
                        k++;
                    }
                    
                    while (k < l && [numbers[l] isEqualToNumber:numbers[l+1]]) {
                        l--;
                    }
                } else if (numbers[k].integerValue + numbers[l].integerValue < target) {
                    k++;
                } else {
                    l--;
                }
            }
        }
    }
    
    return [results copy];
}

- (NSArray<NSArray<NSNumber *> *> *)threeSum:(NSArray<NSNumber *> *)numbers sum:(NSInteger)sum {
    if (!numbers || !numbers.count) {
        return nil;
    }
    
    numbers = [numbers sortedArrayUsingComparator:^NSComparisonResult(NSNumber *num1, NSNumber *num2) {
        return [num1 compare:num2];
    }];
    
    NSMutableArray<NSArray<NSNumber *> *> *results = [NSMutableArray array];
    
    for (NSInteger i = 0; i < numbers.count - 2; i++) {
        if (i > 0 && [numbers[i] isEqualToNumber:numbers[i-1]]) {
            continue;
        }
        
        NSInteger target = sum - numbers[i].integerValue;
        NSInteger j = i+1;
        NSInteger k = numbers.count-1;
        
        while (j < k) {
            if (numbers[j].integerValue + numbers[k].integerValue == target) {
                [results addObject:@[numbers[i], numbers[j], numbers[k]]];
                
                j++; k--;
                
                while (j < k && [numbers[j] isEqualToNumber:numbers[j-1]]) {
                    j++;
                }
                
                while (j < k && [numbers[k] isEqualToNumber:numbers[k+1]]) {
                    k--;
                }
            } else if (numbers[j].integerValue + numbers[k].integerValue > target) {
                k--;
            } else {
                j++;
            }
        }
    }
    return [results copy];
}

- (NSArray<NSNumber *> *)twoSum:(NSArray<NSNumber *> *)numbers sum:(NSInteger)sum {
    if (!numbers || !numbers.count) {
        return nil;
    }
    NSMutableDictionary<NSNumber *, NSNumber *> *exist = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < numbers.count; i++) {
        NSNumber *target = @(sum - numbers[i].integerValue);
        if (exist[target]) {
            return @[exist[target], @(i)];
        }
        exist[numbers[i]] = @(i);
    }
    return nil;
}

- (TreeNode *)lowestCommonAncestorBetweenNode:(TreeNode *)node1
                                      andNode:(TreeNode *)node2
                                       inTree:(TreeNode *)root {
    if (!root || !node1 || !node2) {
        return nil;
    }
    
    if ([root.value isEqualToNumber:node1.value] ||
        [root.value isEqualToNumber:node2.value]) {
        return root;
    }
    
    TreeNode *foundL = [self lowestCommonAncestorBetweenNode:node1 andNode:node2 inTree:root.left];
    TreeNode *foundR = [self lowestCommonAncestorBetweenNode:node1 andNode:node2 inTree:root.right];
    
    if (foundL && foundR) {
        return root;
    }
    
    return foundL ? foundL : foundR;
}

- (TreeNode *)cloneBinaryTree:(TreeNode *)root {
    if (!root) {
        return root;
    }
    TreeNode *copyRoot = [TreeNode treeNodeWithValue:root.value];
    copyRoot.left = [self cloneBinaryTree:root.left];
    copyRoot.right = [self cloneBinaryTree:root.right];
    
    return copyRoot;
}

- (NSArray<NSString *> *)removeDuplicateStringsTrie:(NSArray<NSString *> *)strings {
    if (!strings || !strings.count) {
        return strings;
    }
    
    Trie *wordTrie = [Trie new];
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    
    for (NSString *string in strings) {
        if (![wordTrie searchWord:string]) {
            [results addObject:string];
            [wordTrie addWord:string];
        }
    }
    
    return [results copy];
}

- (NSArray<NSString *> *)removeDuplicateStringsSimple:(NSArray<NSString *> *)strings {
    if (!strings || !strings.count) {
        return strings;
    }
    NSMutableSet<NSString *> *found = [NSMutableSet set];
    NSMutableArray<NSString *> *results = [NSMutableArray array];
    for (NSString *string in strings) {
        if (![found containsObject:string]) {
            [results addObject:string];
            [found addObject:string];
        }
    }
    return [results copy];
}

- (NSInteger)integerFromString:(NSString *)input {
    if (!input || !input.length) {
        return NSIntegerMin;
    }
    
    NSUInteger start = 0;
    while ([input characterAtIndex:start] == ' ') {
        start++;
    }
    
    unichar signC = [input characterAtIndex:0];
    if ((signC == '+' || signC == '-')) {
        if (input.length == 1) {
            return NSIntegerMin;
        }
        start = 1;
    }
    
    NSInteger sign = signC == '+' ? 1 : -1;
    
    NSInteger result = 0;
    for (NSUInteger i = start; i < input.length; i++) {
        unichar c = [input characterAtIndex:i];
        if (c < '0' || c > '9') {
            break;
        }
        if (result > NSIntegerMax / 10 || (result == NSIntegerMax / 10 && c - '0' > 7)) {
            if (sign == 1) {
                return NSIntegerMax;
            } else {
                return NSIntegerMin;
            }
        }
        
        NSInteger digit = c - '0';
        result = result * 10 + digit;
    }
    
    return result * sign;
}

- (BOOL)verifyBinarySearchTree:(TreeNode *)root {
    if (!root) {
        return NO;
    }
    TreeNode *previous = nil;
    return [self verifyBinarySearchTree:root previous:&previous];
}

- (BOOL)verifyBinarySearchTree:(TreeNode *)root previous:(TreeNode * __autoreleasing *)previous {
    if (!root) {
        return YES;
    }
    
    BOOL valid = [self verifyBinarySearchTree:root.left previous:previous];
    if (!valid) {
        return NO;
    }
    
    if (previous && *previous && [(*previous).value compare:root.value] == NSOrderedDescending) {
        return NO;
    }
    *previous = root;
    
    return [self verifyBinarySearchTree:root.right previous:previous];
}

- (NSArray<NSNumber *> *)removeDuplicates:(NSArray<NSNumber *> *)input {
    if (!input || !input.count) {
        return input;
    }
    NSMutableArray<NSNumber *> *results = [NSMutableArray array];
    NSMutableSet<NSNumber *> *found = [NSMutableSet set];
    for (NSUInteger i = 0; i < input.count; i++) {
        if (![found containsObject:input[i]]) {
            [results addObject:input[i]];
            [found addObject:input[i]];
        }
    }
    return results;
}

- (NSArray<NSNumber *> *)removeContinuousDuplicates:(NSArray<NSNumber *> *)input {
    if (!input || !input.count) {
        return input;
    }
    NSMutableArray<NSNumber *> *numbers = [input mutableCopy];
    NSUInteger same = 0;
    for (NSUInteger diff = 0; diff < numbers.count; diff++) {
        if (diff == 0 || ![numbers[diff] isEqualToNumber:numbers[diff-1]]) {
            numbers[same] = numbers[diff];
            same++;
        }
    }
    return [numbers subarrayWithRange:NSMakeRange(0, same)];
}

- (NSArray *)moveZeros:(NSMutableArray<NSNumber *> *)numbers {
    if (!numbers || !numbers.count) {
        return nil;
    }
    NSInteger zeros = 0;
    for (NSUInteger nonZeros = 0; nonZeros < numbers.count; nonZeros++) {
        if (![numbers[nonZeros] isEqualToNumber:@(0)]) {
            if (zeros != nonZeros) {
                [numbers exchangeObjectAtIndex:nonZeros withObjectAtIndex:zeros];
            }
            zeros++;
        }
    }
    return [numbers copy];
}

- (TreeNode *)binaryTreeFromLinkedList:(LinkedListNode *)head {
    return [self binaryTreeFromLinkedListHelper:head tail:nil];
}

- (TreeNode *)binaryTreeFromLinkedListHelper:(LinkedListNode *)head
                                        tail:(LinkedListNode *)tail {
    if (!head) {
        return nil;
    }
    
    // 1 -> NULL
    if (head.next == tail) {
        return [TreeNode treeNodeWithValue:head.value];
    }
    
    LinkedListNode *slow = head;
    LinkedListNode *fast = head;
    
    while (fast != tail && fast.next != tail) {
        slow = slow.next;
        fast = fast.next.next;
    }
    
    TreeNode *root = [TreeNode treeNodeWithValue:slow.value];
    root.left = [self binaryTreeFromLinkedListHelper:head tail:slow];
    root.right = [self binaryTreeFromLinkedListHelper:slow.next tail:tail];
    
    return root;
}

- (LinkedListNode *)linkedListFromBinaryTree:(TreeNode *)root {
    LinkedListNode *head = nil;
    [self llFromBTHelper:root head:&head];
    return head;
}

- (void)llFromBTHelper:(TreeNode *)root head:(LinkedListNode * __autoreleasing *)head {
    if (!root) {
        return;
    }
    [self llFromBTHelper:root.right head:head];
    LinkedListNode *cur = [LinkedListNode nodeWithValue:root.value];
    if (head) {
        cur.next = *head;
    }
    *head = cur;
    [self llFromBTHelper:root.left head:head];
}

- (UIView *)commonSuperViewBetweenView:(UIView *)view1 andView:(UIView *)view2 {
    if (!view1 || !view2) {
        return nil;
    }
    NSInteger height1 = [self heightOfView:view1];
    NSInteger height2 = [self heightOfView:view2];
    NSInteger heightDiff = ABS(height1-height2);
    
    UIView *moveView = height1 > height2 ? view1 : view2;
    while (heightDiff) {
        moveView = moveView.superview;
        heightDiff--;
    }
    
    while (view1 && view2) {
        if (view1 == view2) {
            return view1;
        }
        view1 = view1.superview;
        view2 = view2.superview;
    }
    return nil;
}

- (NSInteger)heightOfView:(UIView *)view {
    NSInteger height = 0;
    while (view) {
        view = view.superview;
        height++;
    }
    return height;
}

- (LinkedListNode *)swapLinkedList:(LinkedListNode *)head {
    if (!head || !head.next) {
        return head;
    }
    LinkedListNode *nextNext = [self swapLinkedList:head.next.next];
    LinkedListNode *next = head.next;
    next.next = head;
    head.next = nextNext;
    return next;
}

- (UIView *)findView:(UIView *)targetView inClonedView:(UIView *)rootView {
    if (!targetView || !rootView) {
        return nil;
    }
    
    NSMutableArray<NSNumber *> *indexPath = [NSMutableArray array];
    UIView *superView = targetView.superview;
    UIView *currentView = targetView;
    
    while (superView) {
        NSUInteger index = [superView.subviews indexOfObject:currentView];
        [indexPath addObject:@(index)];
        
        currentView = superView;
        superView = superView.superview;
    }
    
    currentView = rootView;
    
    for (NSNumber *index in indexPath.reverseObjectEnumerator) {
        currentView = currentView.subviews[index.integerValue];
    }
    
    return currentView;
}

- (BOOL)compareBinaryTree:(TreeNode *)tree1 andBinaryTree:(TreeNode *)tree2 {
    if (!tree1 || !tree2) {
        return tree1 == tree2;
    }
    
    if (![tree1.value isEqual:tree2.value]) {
        return NO;
    }
    
    BOOL same = [self compareBinaryTree:tree1.left andBinaryTree:tree2.left];
    if (!same) {
        return NO;
    }
    
    same = [self compareBinaryTree:tree1.right andBinaryTree:tree2.right];
    if (!same) {
        return NO;
    }
    return YES;
}

@end
