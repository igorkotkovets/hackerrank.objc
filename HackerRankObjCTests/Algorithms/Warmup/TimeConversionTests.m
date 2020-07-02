//
//  TimeConversionTests.m
//  HackerRankObjCTests
//
//  Created by Igor Kotkovets on 7/2/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TimeConversion.h"

@interface TimeConversionTests : XCTestCase

@end

@implementation TimeConversionTests

- (void)testTimeConversion {
    TimeConversion *timeConversion = [[TimeConversion alloc] init];
    NSString *inDate = @"12:00:00PM";

    NSString *dateIn24Format = [timeConversion timeConversion:inDate];

    XCTAssertEqualObjects(@"24:00:00", dateIn24Format);
}

- (void)testTimeConversion2 {
    TimeConversion *timeConversion = [[TimeConversion alloc] init];
    NSString *inDate = @"12:40:22AM";

    NSString *dateIn24Format = [timeConversion timeConversion:inDate];

    XCTAssertEqualObjects(@"00:40:22", dateIn24Format);
}

- (void)testTimeConversion3 {
    TimeConversion *timeConversion = [[TimeConversion alloc] init];
    NSString *inDate = @"06:40:03AM";

    NSString *dateIn24Format = [timeConversion timeConversion:inDate];

    XCTAssertEqualObjects(@"06:40:03", dateIn24Format);
}

- (void)testTimeConversion4 {
    TimeConversion *timeConversion = [[TimeConversion alloc] init];
    NSString *inDate = @"12:45:54PM";

    NSString *dateIn24Format = [timeConversion timeConversion:inDate];

    XCTAssertEqualObjects(@"12:45:54", dateIn24Format);
}

@end
