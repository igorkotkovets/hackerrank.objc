//
//  DetectHTMLAttributes.m
//  HackerRank
//
//  Created by Igor Kotkovets on 11/8/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "DetectHTMLAttributes.h"

@interface DetectHTMLAttributes ()
@property (nonatomic) NSRegularExpression *tagAndAttributesRegExp;
@property (nonatomic) NSRegularExpression *attributesRegExp;
@end

@implementation DetectHTMLAttributes
- (instancetype)init
{
    self = [super init];
    if (self) {
        // https://www.regular-expressions.info/backref.html
        // <([A-Z][A-Z0-9]*)\b[^>]*>.*?</\1>
//        NSString *captureTagPattern = @"<([A-Z][A-Z0-9]*)\\b[^>]*>.*?</\\1>";
//        NSString *captureTagAndAttributesPattern = @"<([A-Z][A-Z0-9]*)\\b([^>]*)>(.*?)</\\1>";
        NSString *captureOpenTagPattern = @"<([A-Z][A-Z0-9]*)\\b([^>]*)/*>";
        NSRegularExpressionOptions options = NSRegularExpressionAnchorsMatchLines
        |NSRegularExpressionCaseInsensitive|NSRegularExpressionDotMatchesLineSeparators;
        NSError *error = nil;
        self.tagAndAttributesRegExp =
        [[NSRegularExpression alloc] initWithPattern:captureOpenTagPattern
                                             options:options
                                               error:&error];
        NSAssert1(error == nil, @"can't create regex. %@", error);

        NSString *attributesPattern = @"(\\w+)=['\"]([^'\"]*)['\"]";
        self.attributesRegExp =
        [[NSRegularExpression alloc] initWithPattern:attributesPattern
                                             options:options
                                               error:&error];
        NSAssert1(error == nil, @"can't create regex. %@", error);
    }
    return self;
}

- (NSDictionary<NSString *, NSArray<NSString *> *> *)solveWithInputString:(NSString *)inputString {
    NSArray<NSTextCheckingResult *> *matches = [self.tagAndAttributesRegExp matchesInString:inputString options:0 range:NSMakeRange(0, inputString.length)];
    NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *result = [[NSMutableDictionary alloc] init];
    for (NSTextCheckingResult *match in matches) {
        NSUInteger numberOfRanges = [match numberOfRanges];
        NSString *tagStr = nil;
        if (numberOfRanges > 1) {
            NSRange tagRange = [match rangeAtIndex:1];
            tagStr = [inputString substringWithRange:tagRange];
        }

        if (numberOfRanges > 2) {
            NSRange attributesRange = [match rangeAtIndex:2];
            NSString *attributesStr = [inputString substringWithRange:attributesRange];
            NSArray<NSString *> *attrs = [self extractAttributesFrom:attributesStr];
            NSMutableArray<NSString *> *existentValues = result[tagStr];
            if (!existentValues) {
                existentValues = [NSMutableArray arrayWithArray:attrs];
            }
            else {
                for (NSString *value in attrs) {
                    if (![existentValues containsObject:value]) {
                        [existentValues addObject:value];
                    }
                }
            }
            result[tagStr] = existentValues;
        }
    }

    return result;
}

- (NSArray<NSString *> *)extractAttributesFrom:(NSString *)inputString {
    NSArray<NSTextCheckingResult *> *matches = [self.attributesRegExp matchesInString:inputString options:0 range:NSMakeRange(0, inputString.length)];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *match in matches) {
        NSUInteger numberOfRanges = [match numberOfRanges];

        if (numberOfRanges>1) {
            NSRange attrKeyValueRange = [match rangeAtIndex:1];
            if (!NSEqualRanges((NSRange){NSNotFound, 0}, attrKeyValueRange)) {
                NSString *keyStr = [inputString substringWithRange:attrKeyValueRange];
                [result addObject:keyStr];
            }
        }
    }

    return result;
}

- (NSArray<NSString *> *)sortAttributes:(NSArray<NSString *> *)attrs {
    return [attrs sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}
@end
