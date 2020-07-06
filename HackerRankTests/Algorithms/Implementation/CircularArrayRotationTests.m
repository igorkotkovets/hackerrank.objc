//
//  CircularArrayRotationTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 7/6/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CircularArrayRotation.h"

@interface CircularArrayRotationTests : XCTestCase

@end

@implementation CircularArrayRotationTests

- (void)testRotation {
    NSArray<NSNumber *> *elements = @[@(3), @(4), @(5)];
    NSNumber *rotationCount = @(2);
    NSArray<NSNumber *> *queries = @[@(1), @(2)];

    NSArray<NSString *> *result = [[[CircularArrayRotation alloc] init] circularArrayRotation:elements
                                                                   k:rotationCount
                                                             queries:queries];

    NSArray<NSString *> *expected = @[@"5", @"3"];

    XCTAssertEqualObjects(expected, result);
}

@end
