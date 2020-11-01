//
//  SayingHi.m
//  HackerRank
//
//  Created by Igor Kotkovets on 10/31/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "SayingHi.h"

@implementation SayingHi
- (NSString *)runWithInputString:(NSString *)string {
    NSString *pattern = @"^[H|h][I|i]\\s[^D|d]";
    NSError *error = nil;
    NSRegularExpression *regex =
    [[NSRegularExpression alloc] initWithPattern:pattern
                                         options:0
                                           error:&error];
    NSAssert1(error == nil, @"Regex constructor error %@", error);

    NSRange range = NSMakeRange(0, string.length);
    if ([regex numberOfMatchesInString:string options:0 range:range] > 0) {
        return string;
    }
    else {
        return nil;
    }
}
@end
