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

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testBreakingRecords {
    XCTAssertEqualObjects((@[@(4),@(0)]), ([self.solution breakingRecords:@[@(3), @(4), @(21), @(36), @(10), @(28), @(35), @(5), @(24), @(42)]]));
}

@end
