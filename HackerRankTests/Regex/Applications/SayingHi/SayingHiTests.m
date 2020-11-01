//
//  SayingHiTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 10/31/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SayingHi.h"

@interface SayingHiTests : XCTestCase
@property (nonatomic) SayingHi *sayingHi;
@end

@implementation SayingHiTests

- (void)setUp {
    self.sayingHi = [[SayingHi alloc] init];
}

- (void)testSet1 {
    NSString *expected = @"Hi Alex how are you doing";
    XCTAssertEqualObjects(expected, [self.sayingHi runWithInputString:expected]);

}

- (void)testSet2 {
    NSString *expected = @"hI swimming prior lead control trial gram report island";
    XCTAssertEqualObjects(expected, [self.sayingHi runWithInputString:expected]);

}

@end
