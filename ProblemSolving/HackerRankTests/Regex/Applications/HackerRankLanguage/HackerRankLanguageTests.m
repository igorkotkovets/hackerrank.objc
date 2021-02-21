//
//  HackerRankLanguageTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HackerRankLanguage.h"

@interface HackerRankLanguageTests : XCTestCase
@property (nonatomic) HackerRankLanguage *hackRankLanguage;
@end

@implementation HackerRankLanguageTests

- (void)setUp {
    self.hackRankLanguage = [[HackerRankLanguage alloc] init];
}

- (void)testSet1 {
    XCTAssertEqualObjects(@"VALID", [self.hackRankLanguage solveWithInputString:@"11011 LUA"]);

    XCTAssertEqualObjects(@"VALID", [self.hackRankLanguage solveWithInputString:@"11011 C"]);

    XCTAssertEqualObjects(@"VALID", [self.hackRankLanguage solveWithInputString:@"11022 CPP"]);

    XCTAssertEqualObjects(@"INVALID", [self.hackRankLanguage solveWithInputString:@"11044 X"]);

    XCTAssertEqualObjects(@"INVALID", [self.hackRankLanguage solveWithInputString:@"38957 TTDDHKGFA"]);

    XCTAssertEqualObjects(@"VALID", [self.hackRankLanguage solveWithInputString:@"21590 HASKELL"]);

    XCTAssertEqualObjects(@"VALID", [self.hackRankLanguage solveWithInputString:@"50068 GROOVY"]);

    XCTAssertEqualObjects(@"VALID", [self.hackRankLanguage solveWithInputString:@"73758 ERLANG"]);

}

@end
