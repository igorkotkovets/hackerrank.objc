//
//  AccessShiftedElementTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 7/6/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AccessElementInShiftedArray.h"



@interface AccessElementInShiftedArrayTests : XCTestCase

@end

@implementation AccessElementInShiftedArrayTests

- (void)testAccess {
    AccessElementInShiftedArray *moduleAccess = [AccessElementInShiftedArray new];
    NSArray *inArray = @[@(0), @(1), @(2), @(3), @(4), @(5), @(6), @(7), @(8), @(9), @(0)];

    NSNumber *result = [moduleAccess runWith:inArray shift:@(4) accessElementAt:@(3)];
    XCTAssertEqualObjects(@(7), result);

    result = [moduleAccess runWith:inArray shift:@(5) accessElementAt:@(3)];
    XCTAssertEqualObjects(@(8), result);
}

@end
