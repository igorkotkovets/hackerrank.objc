//
//  NumberLineJumpsTests.m
//  NumberLineJumpsTests
//
//  Created by igork on 21.02.21.
//

#import <XCTest/XCTest.h>
#import "NumberLineJumps.h"

@interface NumberLineJumpsTests : XCTestCase
@property (nonatomic) NumberLineJumps *solver;
@end

@implementation NumberLineJumpsTests

- (void)setUp {
    self.solver = [[NumberLineJumps alloc] init];
}

- (void)testYES {
    XCTAssertEqualObjects(@"YES", [self.solver kangaroo:@0 v1:@3 x2:@4 v2:@2]);
}

- (void)testNO {
    XCTAssertEqualObjects(@"NO", [self.solver kangaroo:@0 v1:@2 x2:@5 v2:@3]);
}
@end
