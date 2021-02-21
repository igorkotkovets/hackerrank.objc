//
//  TestDataProvider.m
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "TestDataProvider.h"

@implementation TestDataProvider
- (instancetype)initWithString:(NSString *)str
{
    self = [super init];
    if (self) {
        _availableData = [str dataUsingEncoding:NSUTF8StringEncoding];
    }
    return self;
}
@end
