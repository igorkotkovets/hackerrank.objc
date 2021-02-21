//
//  LanguageDetection.m
//  HackerRank
//
//  Created by Igor Kotkovets on 11/3/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "LanguageDetection.h"

@interface LanguageDetection()
@property (nonatomic) NSString *language;
@property (nonatomic) NSMutableArray<NSRegularExpression *> *regexList;

@end

@implementation LanguageDetection
+ (instancetype)CLanguageDetection {
    return [[self alloc]
            initWithLanguageCode:@"C"
            regexList:@[@"\\s*int\\s+main\\(\\)\\s*\\{"]];
}

+ (instancetype)JavaLanguageDetection {
    NSString *main = @"\\s*public\\s+static\\s+void\\s+main\\(\\s*String\\s*\\[\\s*\\]\\s+\\w+\\)\\s*\\{";
    NSString *import = @"\\s*import\\s+[a-zA-Z]+(\\w*.)*;";
    return [[self alloc]
            initWithLanguageCode:@"Java"
            regexList:@[main, import]];
}

+ (instancetype)PythonLanguageDetection {
    NSString *main = @"\\s*if\\s*\\(\\s*__name__\\s*==\\s*\\'__main__\\'\\s*\\)\\s*\\:\\s*main\\s*\\(\\s*\\)";
    NSString *fun = @"def\\s+\\w+\\s*\\((\\s*\\w+\\s*=\\s*\\w+\\s*)*(\\s*\\w+\\s*)*(,\\s*\\w+\\s*=\\s*\\w+\\s*)*(,\\s*\\w+\\s*)*\\)\\s*:";
    NSString *varDefinition = @"^[a-zA-Z][a-zA-Z0-9]*[ |\\t]*=[ |\\t]*[\"|\\w]+.*\"*";
    return [[self alloc]
            initWithLanguageCode:@"Python"
            regexList:@[main,fun,varDefinition]];
}


- (instancetype)initWithLanguageCode:(NSString *)language regexList:(NSArray<NSString *> *)list
{
    self = [super init];
    if (self) {
        _language = language;
        NSRegularExpressionOptions options = NSRegularExpressionAnchorsMatchLines;
        _regexList = [[NSMutableArray alloc] initWithCapacity:list.count];
        for (NSInteger i=0;i<list.count;i++) {
            NSString *pattern = list[i];
            NSError *error = nil;
            NSRegularExpression *expr =
            [[NSRegularExpression alloc] initWithPattern:pattern
                                                 options:options
                                                   error:&error];
            NSAssert1(error == nil, @"wrong pattern %@", error);
            [_regexList addObject:expr];
        }
    }
    return self;
}

- (NSString *)solveWithInputString:(NSString *)inputString {
    for (NSUInteger i=0; i<self.regexList.count; i++) {
        NSRegularExpression *regex = self.regexList[i];
        NSRange range = NSMakeRange(0, inputString.length);
        NSInteger numberOfMatches = [regex numberOfMatchesInString:inputString options:0 range:range];
        if (numberOfMatches) {
            return self.language;
        }
    }

    return nil;
}

@end
