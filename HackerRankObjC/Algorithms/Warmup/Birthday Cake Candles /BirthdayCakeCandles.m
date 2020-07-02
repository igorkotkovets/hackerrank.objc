//
//  BirthdayCakeCandles.m
//  HackerRankObjC
//
//  Created by Igor Kotkovets on 7/2/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "BirthdayCakeCandles.h"

@implementation BirthdayCakeCandles
- (NSNumber *) birthdayCakeCandles:(NSArray *)arr {
    NSUInteger maxElement = 0;
    NSUInteger numOfMaxElements = 0;

    for (NSNumber *elementObject in arr) {
        NSUInteger currentElement = [elementObject unsignedIntegerValue];
        if (maxElement < currentElement) {
            maxElement = currentElement;
            numOfMaxElements = 1;
        }
        else if (currentElement == maxElement) {
            numOfMaxElements += 1;
        }
    }


    return @(numOfMaxElements);
}
@end
