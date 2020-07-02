//
//  BirthdayCakeCandlesTests.m
//  HackerRankObjCTests
//
//  Created by Igor Kotkovets on 7/2/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BirthdayCakeCandles.h"

@interface BirthdayCakeCandlesTests : XCTestCase

@end

@implementation BirthdayCakeCandlesTests

- (void)testBlowsOut {
    BirthdayCakeCandles *candles = [[BirthdayCakeCandles alloc] init];

    NSNumber *result = [candles birthdayCakeCandles:@[@(3), @(2), @(1), @(3)]];

    XCTAssertEqualObjects(@(2), result);
}

@end
