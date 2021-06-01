//
//  SolutionTests.m
//  SolutionTests
//
//  Created by Igor Kotkovets on 1.06.21.
//

#import <XCTest/XCTest.h>
#import "Solution.h"

@interface SolutionTests : XCTestCase
@property (nonatomic) Solution *solution;
@end

@implementation SolutionTests

- (void)setUp {
    self.solution = [[Solution alloc] init];
}

- (void)testRemainder {
    XCTAssertEqualObjects(@(1), ([self.solution remainderWithDivident:[NSDecimalNumber decimalNumberWithString:@"3"] divisor:[NSDecimalNumber decimalNumberWithString:@"2"]]));
}

- (void)testGetTotal {
    XCTAssertEqualObjects(@(3), ([self.solution getTotalX:@[@(2), @(4)] b:@[@(16), @(32), @(96)]]));
    XCTAssertEqualObjects(@(3), ([self.solution getTotalX:@[@(2), @(4)] b:@[@(32), @(16), @(96)]]));
    XCTAssertEqualObjects(@(3), ([self.solution getTotalX:@[@(2), @(4)] b:@[@(96), @(32), @(16)]]));
}

- (void)testLCMArray {
//    XCTAssertEqualObjects(@(4), ([self.solution lcmForArray:@[@(2), @(4)]]));
    XCTAssertEqualObjects(@(96), ([self.solution lcmForArray:@[@(16), @(32), @(96)]]));
}

- (void)testGCDArray {
    XCTAssertEqualObjects([NSDecimalNumber decimalNumberWithString:@"12"], ([self.solution gcdForArray:@[@(36), @(24), @(48)]]));
    XCTAssertEqualObjects([NSDecimalNumber decimalNumberWithString:@"12"], ([self.solution gcdForArray:@[@(36), @(24)]]));
    XCTAssertEqualObjects([NSDecimalNumber decimalNumberWithString:@"1"], ([self.solution gcdForArray:@[@(3), @(5)]]));
    XCTAssertEqualObjects([NSDecimalNumber decimalNumberWithString:@"16"], ([self.solution gcdForArray:@[@(16), @(32), @(96)]]));
}

- (void)testGCD {
    XCTAssertEqualObjects([NSDecimalNumber decimalNumberWithString:@"12"], [self.solution gcdForA:[NSDecimalNumber decimalNumberWithString:@"36"] b:[NSDecimalNumber decimalNumberWithString:@"24"]]);
    XCTAssertEqualObjects([NSDecimalNumber decimalNumberWithString:@"1"], [self.solution gcdForA:[NSDecimalNumber decimalNumberWithString:@"5"] b:[NSDecimalNumber decimalNumberWithString:@"3"]]);
}


@end
