//
//  HackerRankLanguage.m
//  HackerRank
//
//  Created by Igor Kotkovets on 11/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "HackerRankLanguage.h"

@implementation HackerRankLanguage
- (NSString *)solveWithInputString:(NSString *)string {
    NSString *languagesWithSemicolor = @"C:CPP:JAVA:PYTHON:PERL:PHP:RUBY:CSHARP:HASKELL:CLOJURE:BASH:SCALA:ERLANG:CLISP:LUA:BRAINFUCK:JAVASCRIPT:GO:D:OCAML:R:PASCAL:SBCL:DART:GROOVY:OBJECTIVEC";
    NSString *languagesSeparated = [languagesWithSemicolor stringByReplacingOccurrencesOfString:@":" withString:@"|"];
    // 10000...99999
    NSString *pattern = [NSString stringWithFormat:@"[1-9][0-9]{4}\\s(%@)$", languagesSeparated];
    NSError *error = nil;
    NSRegularExpression *regex =
    [[NSRegularExpression alloc] initWithPattern:pattern
                                         options:0
                                           error:&error];
    NSAssert1(error == nil, @"can't create regex. %@", error);

    NSRange range = NSMakeRange(0, string.length);
    if ([regex numberOfMatchesInString:string options:0 range:range]) {
        return @"VALID";
    }
    else {
        return @"INVALID";
    }
}
@end
