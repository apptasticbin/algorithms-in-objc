//
//  GitVersionControl.m
//  PhoneScreenPractice
//
//  Created by Bin Yu on 22/02/2017.
//  Copyright © 2017 Bin Yu. All rights reserved.
//

#import "GitVersionControl.h"

@implementation Commit

// ask interviewer if the class conform to NSCopying as a key of NSDictionary
- (id)copyWithZone:(NSZone *)zone {
    id copy = [[Commit allocWithZone:zone] init];
    return copy;
}

@end

@implementation GitVersionControl

- (Commit *)findAncestorOfCommit:(Commit *) c1 andCommit:(Commit *)c2 {
    /* - after analyzing, I think this is a graph traversal + hash table question.
     - we move two commits up together, and mark every commit on this path as visited
     - if the commit meets the base commit, then we stop there
     - if we find a commit that has already been visited before we meet the base commit,
     then that commit is the LCA commit
     */
    NSMutableDictionary<Commit *, NSNumber *> *visited = [NSMutableDictionary dictionary];
    while (c1 || c2) {
        if (c1 && visited[c1] != nil) return c1;
        if (c2 && visited[c2] != nil) return c2;
        if (c1) visited[c1] = @(YES);
        if (c2) visited[c2] = @(YES);
        c1 = c1.parent;
        c2 = c2.parent;
    }
    return nil;
}

@end
