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

- (void)testRotationOn3 {
    NSArray<NSNumber *> *elements = @[@(3), @(4), @(5)];
    NSArray<NSNumber *> *queries = @[@(0), @(1), @(2)];

    NSArray<NSString *> *result = [[[CircularArrayRotation alloc] init] circularArrayRotation:elements
                                                                                            k:@(1)
                                                                                      queries:queries];
    XCTAssertEqualObjects(((NSArray*)@[@"5", @"3", @"4"]), result);

    result = [[[CircularArrayRotation alloc] init] circularArrayRotation:elements
                                                                   k:@(2)
                                                             queries:queries];
    XCTAssertEqualObjects(((NSArray*)@[@"4", @"5", @"3"]), result);

    result = [[[CircularArrayRotation alloc] init] circularArrayRotation:elements
                                                                   k:@(3)
                                                             queries:queries];
    XCTAssertEqualObjects(((NSArray*)@[@"3", @"4", @"5"]), result);
}

- (void)testRotation2 {
    NSArray<NSNumber *> *elements = @[@(1), @(2), @(3)];
    NSNumber *rotationCount = @(2);
    NSArray<NSNumber *> *queries = @[@(0), @(1), @(2)];

    NSArray<NSString *> *result = [[[CircularArrayRotation alloc] init] circularArrayRotation:elements
                                                                   k:rotationCount
                                                             queries:queries];

    NSArray<NSString *> *expected = @[@"2", @"3", @"1"];

    XCTAssertEqualObjects(expected, result);
}

@end
