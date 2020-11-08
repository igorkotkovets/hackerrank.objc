//
//  SplitThePhoneNumbers.m
//  HackerRank
//
//  Created by Igor Kotkovets on 11/8/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "SplitThePhoneNumbers.h"

@interface SplitThePhoneNumbers ()
@property (nonatomic) NSRegularExpression *regularExpression;
@end

@implementation SplitThePhoneNumbers

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *pattern = @"^(\\d{1,3})[ |-](\\d{1,3})[ |-](\\d{4,10})";
        NSRegularExpressionOptions options = NSRegularExpressionAnchorsMatchLines;
        NSError *error = nil;
        self.regularExpression =
        [[NSRegularExpression alloc] initWithPattern:pattern
                                             options:options
                                               error:&error];
        NSAssert1(error == nil, @"can't create regex. %@", error);
    }
    return self;
}

- (NSString *)solveWithInputString:(NSString *)inputString {
    NSMutableString *result = [[NSMutableString alloc] init];
    NSArray *matches = [self.regularExpression matchesInString:inputString
                                                       options:0
                                                         range:NSMakeRange(0, [inputString length])];
    for (NSTextCheckingResult *match in matches) {
        NSRange countryCodeRange = [match rangeAtIndex:1];
        NSRange localAreaCodeRange = [match rangeAtIndex:2];
        NSRange numberRange = [match rangeAtIndex:3];

        if (result.length) {
            [result appendString:@"\n"];
        }

        [result
         appendFormat:@"CountryCode=%@,LocalAreaCode=%@,Number=%@",
         [inputString substringWithRange:countryCodeRange],
         [inputString substringWithRange:localAreaCodeRange],
         [inputString substringWithRange:numberRange]];


    }

    return result;
}
@end
