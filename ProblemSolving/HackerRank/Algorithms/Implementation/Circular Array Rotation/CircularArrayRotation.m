//
//  CircularArrayRotation.m
//  HackerRank
//
//  Created by Igor Kotkovets on 7/6/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "CircularArrayRotation.h"

@implementation CircularArrayRotation
- (NSArray<NSString *> *) circularArrayRotation:(NSArray *)a k:(NSNumber *)k queries:(NSArray *)queries {
    NSInteger arraySize = a.count;
    NSUInteger shift = k.unsignedIntegerValue;

    NSMutableArray<NSString *> *result = [NSMutableArray arrayWithCapacity:queries.count];
    for (NSNumber *indexNumber in queries) {
        NSUInteger indexPosition = indexNumber.unsignedIntegerValue;
        NSUInteger adoptedRotation = shift % arraySize;

        if (indexPosition >= adoptedRotation) {
            NSNumber *element = a[indexPosition - adoptedRotation];
            [result addObject:[element stringValue]];
        }
        else {
            NSNumber *element = a[arraySize + indexPosition - adoptedRotation];
            [result addObject:[element stringValue]];
        }
    }

    return result;
}
@end
