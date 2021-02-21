//
//  GradingStudentsTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/12/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GradingStudents.h"

@interface GradingStudentsTests : XCTestCase
@property (nonatomic) GradingStudents *solver;
@end

@implementation GradingStudentsTests

- (void)setUp {
    self.solver = [[GradingStudents alloc] init];
}

- (void)testSolveMethod {
    NSArray *inArray = @[@(73),@(67),@(38),@(33)];
    NSArray *outArray = [self.solver gradingStudents:inArray];
    NSArray *expected = @[@(75),@(67),@(40),@(33)];
    XCTAssertEqualObjects(outArray, expected);
}

- (void)testProcessGrade {
//    XCTAssertEqual([self.solver processGrade:29], 29);
//    XCTAssertEqual([self.solver processGrade:84], 85);
    XCTAssertEqual([self.solver processGrade:38], 38);
}

@end
