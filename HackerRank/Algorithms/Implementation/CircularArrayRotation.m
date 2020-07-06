//
//  CircularArrayRotation.m
//  HackerRank
//
//  Created by Igor Kotkovets on 7/6/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "CircularArrayRotation.h"

@implementation CircularArrayRotation
- (NSArray<NSString *> *)circularArrayRotation:(NSArray *)a k:(NSNumber *)k queries:(NSArray *)queries {
    NSInteger arraySize = a.count;
    NSMutableArray *shifted = [NSMutableArray arrayWithArray:a];

    for (NSUInteger i=0; i<k.unsignedIntegerValue; i++) {
        NSNumber *last = shifted.lastObject;

        for (NSInteger j=1; j<arraySize; j++) {
            NSInteger index = arraySize-j;
            shifted[index] = shifted[index-1];
        }

        shifted[0] = last;
    }

    NSMutableArray<NSString *> *result = [NSMutableArray arrayWithCapacity:queries.count];
    for (NSNumber *indexNumber in queries) {
        NSNumber *found = shifted[indexNumber.unsignedIntegerValue];
        [result addObject:[found stringValue]];
    }

    return result;
}
@end
