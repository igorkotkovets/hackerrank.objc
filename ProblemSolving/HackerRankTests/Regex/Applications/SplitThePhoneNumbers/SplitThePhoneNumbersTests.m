//
//  SplitThePhoneNumbersTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/8/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SplitThePhoneNumbers.h"

@interface SplitThePhoneNumbersTests : XCTestCase
@property (nonatomic) SplitThePhoneNumbers *solver;
@end

@implementation SplitThePhoneNumbersTests

- (void)setUp {
    self.solver = [[SplitThePhoneNumbers alloc] init];
}

- (void)testGroupNumbers1 {
    XCTAssertEqualObjects(@"CountryCode=1,LocalAreaCode=877,Number=2638277", [self.solver solveWithInputString:@"1 877 2638277"]);
}


@end
