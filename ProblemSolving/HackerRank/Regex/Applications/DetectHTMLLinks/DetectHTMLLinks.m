//
//  DetectHTMLLinks.m
//  HackerRank
//
//  Created by Igor Kotkovets on 11/9/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "DetectHTMLLinks.h"

@interface DetectHTMLLinks ()
@property (nonatomic) NSRegularExpression *tagRegex;
@property (nonatomic) NSRegularExpression *hrefRegex;
@property (nonatomic) NSRegularExpression *plainTextRegex;
@end

@implementation DetectHTMLLinks
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *pattern = @"<([A-Z][A-Z0-9]*)\\b([^>]*)>\\s*(.*?)\\s*</\\1>";
        NSRegularExpressionOptions options =
        NSRegularExpressionAnchorsMatchLines
        |NSRegularExpressionCaseInsensitive
        |NSRegularExpressionDotMatchesLineSeparators;
        NSError *error = nil;
        self.tagRegex =
        [[NSRegularExpression alloc] initWithPattern:pattern
                                             options:options
                                               error:&error];
        NSAssert1(error == nil, @"can't create regex. %@", error);

        pattern = @"href=[\"|']\\s*([^\"']*)\\s*[\"|']";
        options =
        NSRegularExpressionAnchorsMatchLines
        |NSRegularExpressionCaseInsensitive
        |NSRegularExpressionDotMatchesLineSeparators;
        self.hrefRegex =
        [[NSRegularExpression alloc] initWithPattern:pattern
                                             options:options
                                               error:&error];
        NSAssert1(error == nil, @"can't create regex. %@", error);

        pattern = @"^[^<][\\w\\s\\/?\\*:;\\.,]*[^>]$";
        self.plainTextRegex =
        [[NSRegularExpression alloc] initWithPattern:pattern
                                             options:options
                                               error:&error];
        NSAssert1(error == nil, @"can't create regex. %@", error);
    }
    return self;
}

- (NSArray<NSDictionary<NSString *, NSString *> *> *)solveWithInputString:(NSString *)inStr {
    return [self extractHrefTextPairsFrom:inStr];
}

- (NSArray<NSDictionary<NSString *, NSString *> *> *)extractHrefTextPairsFrom:(NSString *)inStr {
    NSArray<NSTextCheckingResult *> *matches = [self.tagRegex matchesInString:inStr options:0 range:NSMakeRange(0, inStr.length)];
    if (!matches.count) {
        return nil;
    }

    NSMutableArray<NSDictionary<NSString *, NSString *> *> *result = [[NSMutableArray alloc] initWithCapacity:matches.count];
    for (NSTextCheckingResult *match in matches) {
        NSUInteger numberOfRanges = [match numberOfRanges];

        NSString *tag = nil;
        if (numberOfRanges > 1) {
            NSRange tagRange = [match rangeAtIndex:1];
            tag = [inStr substringWithRange:tagRange];
        }

        NSString *hrefValue = nil;
        if (numberOfRanges > 2) {
            NSRange attributesRange = [match rangeAtIndex:2];
            NSString *attributesStr = [inStr substringWithRange:attributesRange];
            hrefValue = [self extractHrefValueFromAttributesStr:attributesStr];
        }

        if (numberOfRanges > 3) {
            NSRange textRange = [match rangeAtIndex:3];
            NSString *innerText = [inStr substringWithRange:textRange];

            if (hrefValue && innerText) {
                NSString *textValue = [self extractTextValueFrom:innerText];
                [result addObject:@{hrefValue:textValue}];
            }
            else if (innerText) {
                NSArray<NSDictionary<NSString *, NSString *> *> *pairs = [self extractHrefTextPairsFrom:innerText];
                if (pairs) {
                    [result addObjectsFromArray:pairs];
                }
            }
        }
    }

    return result;
}

- (NSString *)extractHrefValueFromAttributesStr:(NSString *)inStr {
    NSArray<NSTextCheckingResult *> *matches = [self.hrefRegex matchesInString:inStr options:0 range:NSMakeRange(0, inStr.length)];
    NSString *result = nil;
    for (NSTextCheckingResult *match in matches) {
        NSUInteger numberOfRanges = [match numberOfRanges];
        if (numberOfRanges > 1) {
            NSRange tagRange = [match rangeAtIndex:1];
            result = [inStr substringWithRange:tagRange];
        }
    }
    return result;
}


- (NSString *)extractTextValueFrom:(NSString *)inStr {
    NSTextCheckingResult *match = [self.tagRegex firstMatchInString:inStr options:0 range:NSMakeRange(0, inStr.length)];
    NSUInteger numberOfRanges = [match numberOfRanges];
    if (numberOfRanges > 3) {
        NSRange textRange = [match rangeAtIndex:3];
        NSString *innerText = [inStr substringWithRange:textRange];
        return [self extractTextValueFrom:innerText];
    }

    match = [self.plainTextRegex firstMatchInString:inStr options:0 range:NSMakeRange(0, inStr.length)];
    numberOfRanges = [match numberOfRanges];
    if (numberOfRanges) {
        return inStr;
    }
    else {
        return @"";
    }
}


@end
