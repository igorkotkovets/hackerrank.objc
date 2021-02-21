//
//  DetectHTMLAttributes.h
//  HackerRank
//
//  Created by Igor Kotkovets on 11/8/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetectHTMLAttributes : NSObject
- (NSDictionary<NSString *, NSArray<NSString *> *> *)solveWithInputString:(NSString *)inputString;
- (NSArray<NSString *> *)extractAttributesFrom:(NSString *)inputString;
@end

NS_ASSUME_NONNULL_END
