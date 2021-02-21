//
//  LanguageDetection.h
//  HackerRank
//
//  Created by Igor Kotkovets on 11/3/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

// https://www.hackerrank.com/challenges/programming-language-detection/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LanguageDetection : NSObject

- (instancetype)initWithLanguageCode:(NSString *)language
                           regexList:(NSArray<NSString *> *)list;
- (NSString *)solveWithInputString:(NSString *)inputString;
+ (instancetype)CLanguageDetection;
+ (instancetype)JavaLanguageDetection;
+ (instancetype)PythonLanguageDetection;
@end

NS_ASSUME_NONNULL_END
