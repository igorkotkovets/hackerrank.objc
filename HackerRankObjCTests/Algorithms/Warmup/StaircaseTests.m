//
//  StaircaseTests.m
//  HackerRankObjCTests
//
//  Created by Igor Kotkovets on 7/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Staircase.h"

@interface StaircaseTests : XCTestCase

@end

@implementation StaircaseTests

- (void)testSolution {
    Solution *solution = [Solution new];

    [solution staircase:@(3)];
}

@end
