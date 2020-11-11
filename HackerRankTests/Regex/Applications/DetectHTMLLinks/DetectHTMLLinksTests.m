//
//  DetectHTMLLinksTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/9/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DetectHTMLLinks.h"

@interface DetectHTMLLinksTests : XCTestCase
@property (nonatomic) DetectHTMLLinks *solver;
@end

@implementation DetectHTMLLinksTests

- (void)setUp {
    self.solver = [[DetectHTMLLinks alloc] init];
}

- (void)testExtractInnerTextFromString {
    NSString *inStr = @"<p><a href=\"http://www.quackit.com/html/tutorial/html_links.cfm\">Example Link</a></p>";
    NSArray *expected = @[@{@"http://www.quackit.com/html/tutorial/html_links.cfm":@"Example Link"}];
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testExtractHrefValueFromAttributesStr {
    NSString *inStr = @" href=\"http://www.quackit.com/html/tutorial/html_links.cfm\"";
    XCTAssertEqualObjects(@"http://www.quackit.com/html/tutorial/html_links.cfm", [self.solver extractHrefValueFromAttributesStr:inStr]);
}

- (void)testSolvingProblem00 {
    NSBundle *testBundle = [NSBundle bundleForClass:[DetectHTMLLinksTests class]];
    NSString *path = [testBundle pathForResource:@"detect-html-links00" ofType:@"txt"];
    NSString *inStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];;
    NSArray *expected = @[@{@"http://www.quackit.com/html/tutorial/html_links.cfm":@"Example Link"},
                                 @{@"http://www.quackit.com/html/examples/html_links_examples.cfm":@"More Link Examples..."}];
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testSolvingProblem08 {
    NSBundle *testBundle = [NSBundle bundleForClass:[DetectHTMLLinksTests class]];
    NSString *path = [testBundle pathForResource:@"detect-html-links08" ofType:@"txt"];
    NSString *inStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];;
    NSArray *expected = @[@{@"/wiki/Main_Page":@"Main page"},
                               @{@"/wiki/Portal:Contents":@"Contents"},
                               @{@"/wiki/Portal:Featured_content":@"Featured content"},
                               @{@"/wiki/Portal:Current_events":@"Current events"},
                               @{@"/wiki/Special:Random":@"Random article"},
                               @{@"//donate.wikimedia.org/wiki/Special:FundraiserRedirector?utm_source=donate&amp;utm_medium=sidebar&amp;utm_campaign=C13_en.wikipedia.org&amp;uselang=en":@"Donate to Wikipedia"},
    ];
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testSolvingProblem03 {
    NSBundle *testBundle = [NSBundle bundleForClass:[DetectHTMLLinksTests class]];
    NSString *path = [testBundle pathForResource:@"detect-html-links03" ofType:@"txt"];
    NSString *inStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];;
    NSArray *expected = @[@{@"/wiki/File:Female_and_male_Pardalotus_punctatus.jpg":@""}];
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testExtractShortTag {
//    XCTAssertEqualObjects(@"aabb", [self.solver isTextPlainStr:@"aabb"]);
    NSString *inStr = @"<img alt=\"About this image\" src=\"//bits.wikimedia.org/static-1.22wmf7/extensions/ImageMap/desc-20.png\" style=\"border: none;\" />";
    XCTAssertEqualObjects(@"",[self.solver extractTextValueFrom:inStr]);
}

- (void)testSolveProblemX {
    NSString *inStr = @"<li class=\"interwiki-da\"><a href=\"//da.wikipedia.org/wiki/\" title=\"\" lang=\"da\" hreflang=\"da\"><b>Dansk</b></a></li>";
    NSArray *expected = @[@{@"//da.wikipedia.org/wiki/": @"Dansk"}];
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testSolveProblemXI {
    NSString *inStr = @"<a href=\"//sh.wikipedia.org/wiki/\" title=\"\" lang=\"sh\" hreflang=\"sh\">Srpskohrvatski / </a>";
    NSArray *expected = @[@{@"//sh.wikipedia.org/wiki/": @"Srpskohrvatski /"}];
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}

- (void)testSolve {
    NSString *inStr = @"<a href=\"/wiki/Roxy_Cinema_(Kolkata)\" title=\"Roxy Cinema (Kolkata)\">Roxy, Kolkata</a>, for 3 years and 8 months?</li>";
    NSArray *expected = @[@{@"/wiki/Roxy_Cinema_(Kolkata)": @"Roxy, Kolkata"}];
    XCTAssertEqualObjects(expected, [self.solver solveWithInputString:inStr]);
}


@end
