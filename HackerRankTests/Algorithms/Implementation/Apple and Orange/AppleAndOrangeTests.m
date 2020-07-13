//
//  AppleAndOrangeTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 7/13/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppleAndOrange.h"

@interface AppleAndOrangeTests : XCTestCase

@end

@implementation AppleAndOrangeTests

- (void)testCountFruits {
    AppleAndOrange *counter = [[AppleAndOrange alloc] init];
    NSArray<NSNumber *> *apples = @[@(2), @(3), @(-4)];
    NSInteger result = [counter countFruit:7 t:10 tree:4 fetuses:apples];
    
    XCTAssertEqual(1, result);
}

@end
