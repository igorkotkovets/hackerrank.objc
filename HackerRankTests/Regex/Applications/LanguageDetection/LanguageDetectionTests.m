//
//  LanguageDetectionTests.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/3/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LanguageDetection.h"

@interface LanguageDetectionTests : XCTestCase
@property (nonatomic) LanguageDetection *detection;
@property (nonatomic) NSString *exampleCLanguage;
@property (nonatomic) NSString *exampleJava0;
@property (nonatomic) NSString *exampleJava1;
@property (nonatomic) NSString *exampleJava2;
@property (nonatomic) NSString *examplePython0;
@property (nonatomic) NSString *examplePython1;
@end

@implementation LanguageDetectionTests

- (NSString *)stringFromFile:(NSString *)file {
    NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
    NSURL *cUrl = [testBundle URLForResource:file withExtension:nil];
    return [NSString stringWithContentsOfURL:cUrl encoding:NSUTF8StringEncoding error:nil];
}

- (void)setUp {
    self.exampleCLanguage = [self stringFromFile:@"c0.c"];

    self.exampleJava0 = [self stringFromFile:@"java0.java"];
    self.exampleJava1 = [self stringFromFile:@"java1.java"];
    self.exampleJava2 = [self stringFromFile:@"java2.java"];

    self.examplePython0 = [self stringFromFile:@"python0.py"];
    self.examplePython1 = [self stringFromFile:@"python1.py"];
}

- (void)testCheckCLanguageDetection {
    LanguageDetection *detection = [LanguageDetection CLanguageDetection];
    XCTAssertEqualObjects(@"C", [detection solveWithInputString:self.exampleCLanguage]);

    XCTAssertNil([detection solveWithInputString:self.exampleJava0]);
    XCTAssertNil([detection solveWithInputString:self.exampleJava1]);

    XCTAssertNil([detection solveWithInputString:self.examplePython0]);
    XCTAssertNil([detection solveWithInputString:self.examplePython1]);
}

- (void)testCheckJavaLanguageDetection {
    LanguageDetection *detection = [LanguageDetection JavaLanguageDetection];
    XCTAssertEqualObjects(@"Java", [detection solveWithInputString:self.exampleJava0]);
    XCTAssertEqualObjects(@"Java", [detection solveWithInputString:self.exampleJava1]);
    XCTAssertEqualObjects(@"Java", [detection solveWithInputString:self.exampleJava2]);

    XCTAssertNil([detection solveWithInputString:self.exampleCLanguage]);
    XCTAssertNil([detection solveWithInputString:self.examplePython0]);
    XCTAssertNil([detection solveWithInputString:self.examplePython1]);
}

- (void)testCheckPythonLanguageDetection {
    LanguageDetection *detection = [LanguageDetection PythonLanguageDetection];
    XCTAssertEqualObjects(@"Python", [detection solveWithInputString:self.examplePython0]);
    XCTAssertEqualObjects(@"Python", [detection solveWithInputString:self.examplePython1]);
    XCTAssertNil([detection solveWithInputString:self.exampleCLanguage]);
    XCTAssertNil([detection solveWithInputString:self.exampleJava0]);
    XCTAssertNil([detection solveWithInputString:self.exampleJava1]);
    XCTAssertNil([detection solveWithInputString:self.exampleJava2]);
}

- (void)testCheckPythonFunDetection {
    LanguageDetection *detection = [LanguageDetection PythonLanguageDetection];
    NSString *pythonFun = [self stringFromFile:@"pythonfun0.py"];
    XCTAssertEqualObjects(@"Python", [detection solveWithInputString:pythonFun]);

    pythonFun = [self stringFromFile:@"pythonfun1.py"];
    XCTAssertEqualObjects(@"Python", [detection solveWithInputString:pythonFun]);

    pythonFun = [self stringFromFile:@"pythonfun2.py"];
    XCTAssertEqualObjects(@"Python", [detection solveWithInputString:pythonFun]);
}


@end
