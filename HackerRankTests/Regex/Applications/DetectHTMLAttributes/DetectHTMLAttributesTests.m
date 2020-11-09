//
//  DetectHTMLAttributesTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/8/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DetectHTMLAttributes.h"

@interface DetectHTMLAttributesTests : XCTestCase
@property (nonatomic) DetectHTMLAttributes *solver;
@end

@implementation DetectHTMLAttributesTests

- (void)setUp {
    self.solver = [[DetectHTMLAttributes alloc] init];
}

- (void)testExtractTagAttributesPair {
    NSString *inStr = @"<p><a href=\"http://www.quackit.com/html/tutorial/html_links.cfm\">Example Link</a></p>";
    NSDictionary *result = [self.solver solveWithInputString:inStr];
    NSDictionary *expected = @{@"a":@[@"href"],
                             @"p":@[]};
    XCTAssertEqualObjects(expected, result);
}

- (void)testExtractAttributes {
    NSString *inStr = @"href=\"http://www.quackit.com/html/tutorial/html_links.cfm\"";
    NSArray *expected = @[@"href"];
    XCTAssertEqualObjects(expected, [self.solver extractAttributesFrom:inStr]);
}

- (void)testSolvingProblem {
    NSBundle *testBundle = [NSBundle bundleForClass:[DetectHTMLAttributes class]];
    NSString *path = [testBundle pathForResource:@"detect-html-attributes01" ofType:@"txt"];
    NSString *inStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];;
    NSDictionary *expected = @{@"div":@[@"style",@"class"],
                          @"b":@[],
                          @"a":@[@"href",@"title"]};
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testExtract2Attributes {
    NSString *inStr = @" style=\"text-align: right;\" class=\"noprint\"";
    NSArray *expected = @[@"style", @"class"];
    XCTAssertEqualObjects(expected, [self.solver extractAttributesFrom:inStr]);
}

- (void)testSolvingProblem1 {
    NSString *inStr = @"<div class=\"portal\" role=\"navigation\" id='p-navigation'></div>";
    NSDictionary *expected = @{@"div":@[@"class", @"role", @"id"]};
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testSolvingProblem2 {
    NSString *inStr = @"<area href=\"/wiki/File:Pardalotus_punctatus_female_with_nesting_material_-_Risdon_Brook.jpg\" shape=\"rect\" coords=\"3,3,297,238\" alt=\"Female\" title=\"Female\" />";
    NSDictionary *expected = @{@"area":@[@"href", @"shape", @"coords", @"alt", @"title"]};
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testExtract5Attributes {
    NSString *inStr = @" href=\"/wiki/File:Pardalotus_punctatus_female_with_nesting_material_-_Risdon_Brook.jpg\" shape=\"rect\" coords=\"3,3,297,238\" alt=\"Female\" title=\"Female\" ";
    NSArray *expected = @[@"href", @"shape", @"coords", @"alt", @"title"];
    XCTAssertEqualObjects(expected, [self.solver extractAttributesFrom:inStr]);
}

@end
