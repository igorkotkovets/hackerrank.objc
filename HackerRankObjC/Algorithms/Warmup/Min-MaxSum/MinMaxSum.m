//
//  MinMaxSum.m
//  HackerRankObjC
//
//  Created by Igor Kotkovets on 7/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "MinMaxSum.h"

@implementation MinMaxSum
- (void) miniMaxSum:(NSArray *)arr {
    NSUInteger minElementPosition = 0;
    NSUInteger maxElementPosition = 0;
    for (NSUInteger i=0; i<arr.count; i++) {
        NSUInteger currentElement = [arr[i] unsignedIntegerValue];
        if (currentElement < [arr[minElementPosition] unsignedIntegerValue]) {
            minElementPosition = i;
        }
        if (currentElement > [arr[maxElementPosition] unsignedIntegerValue]) {
            maxElementPosition = i;
        }
    }

    NSUInteger minSum = 0;
    NSUInteger maxSum = 0;
    for (NSUInteger i=0; i<arr.count; i++) {
        if (i != minElementPosition) {
            maxSum += [arr[i] unsignedIntegerValue];
        }
        if (i != maxElementPosition) {
            minSum += [arr[i] unsignedIntegerValue];
        }
    }

    printf("%lu %lu", (unsigned long)minSum, (unsigned long)maxSum);

}
@end
