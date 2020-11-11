//
//  DetectHTMLLinks.h
//  HackerRank
//
//  Created by Igor Kotkovets on 11/9/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// https://www.hackerrank.com/challenges/detect-html-links/problem
@interface DetectHTMLLinks : NSObject
- (NSArray<NSDictionary<NSString *, NSString *> *> *)solveWithInputString:(NSString *)inStr;
- (NSArray<NSDictionary<NSString *, NSString *> *> *)extractHrefTextPairsFrom:(NSString *)inStr;
- (NSString *)extractHrefValueFromAttributesStr:(NSString *)inStr;
- (NSString *)extractTextValueFrom:(NSString *)inStr;
@end

NS_ASSUME_NONNULL_END
