//
//  PrimeNumbersTests.m
//  PrimeNumbersTests
//
//  Created by igork on 21.02.21.
//

#import <XCTest/XCTest.h>
#import "PrimeNumbers.h"

@interface PrimeNumbersTests : XCTestCase
@property (nonatomic) PrimeNumbers *primeNumbers;
@end

@implementation PrimeNumbersTests

- (void)setUp {
    self.primeNumbers = [[PrimeNumbers alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testFindUpTo {
    NSArray *result = [self.primeNumbers findUpTo:10];
    NSArray *expected = @[@(2),@(3),@(5),@(7)];

    XCTAssertEqualObjects(result, expected);
}

@end
