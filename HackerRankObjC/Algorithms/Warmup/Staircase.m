//
//  Staircase.m
//  HackerRankObjC
//
//  Created by Igor Kotkovets on 7/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "Staircase.h"


@implementation Solution
// Complete the staircase function below.
- (void) staircase:(NSNumber *)n {
    NSMutableString *result = [NSMutableString new];
    for (NSInteger i=1; i<=n.integerValue; i++) {
        NSInteger len = n.integerValue;
        char repeatString[len + 1];
        memset(repeatString, ' ', len-i);
        memset(repeatString+len-i, '#', i);

        // Set terminating null
        repeatString[len] = '\0';

        NSString *row = [NSString stringWithCString:repeatString encoding:NSASCIIStringEncoding];

        [result appendFormat:@"%@\n", row];
    }
    printf("%s", [result cStringUsingEncoding:NSASCIIStringEncoding]);
}
@end
