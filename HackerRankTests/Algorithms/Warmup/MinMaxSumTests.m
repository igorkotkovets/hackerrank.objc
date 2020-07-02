//
//  MinMaxSumTests.m
//  HackerRankObjCTests
//
//  Created by Igor Kotkovets on 7/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MinMaxSum.h"

@interface MinMaxSumTests : XCTestCase

@end

@implementation MinMaxSumTests

- (void)testMinMaxSum {
    MinMaxSum *sum = [MinMaxSum new];

    NSNumber *num1 = [NSNumber numberWithUnsignedInteger:1];
    NSNumber *num2 = [NSNumber numberWithUnsignedInteger:2];
    NSNumber *num3 = [NSNumber numberWithUnsignedInteger:3];
    NSNumber *num4 = [NSNumber numberWithUnsignedInteger:4];
    NSNumber *num5 = [NSNumber numberWithUnsignedInteger:5];

    [sum miniMaxSum:@[num1, num2, num3, num4, num5]];
}

- (void)testMinMaxSum2 {
    MinMaxSum *sum = [MinMaxSum new];

    NSNumber *num1 = [NSNumber numberWithUnsignedInteger:7];
    NSNumber *num2 = [NSNumber numberWithUnsignedInteger:69];
    NSNumber *num3 = [NSNumber numberWithUnsignedInteger:2];
    NSNumber *num4 = [NSNumber numberWithUnsignedInteger:221];
    NSNumber *num5 = [NSNumber numberWithUnsignedInteger:8974];

    [sum miniMaxSum:@[num1, num2, num3, num4, num5]];
}

@end
