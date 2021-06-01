//
//  Solution.h
//  Solution
//
//  Created by Igor Kotkovets on 1.06.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// https://www.hackerrank.com/challenges
@interface Solution : NSObject
- (NSNumber *)getTotalX:(NSArray *)a b:(NSArray *)b;
- (NSDecimalNumber *)remainderWithDivident:(NSDecimalNumber *)divident divisor:(NSDecimalNumber *)divisor;
- (NSDecimalNumber *)lcmForArray:(NSArray<NSNumber *> *)list;
- (NSDecimalNumber *)gcdForArray:(NSArray<NSNumber *> *)list;
- (NSDecimalNumber *)gcdForA:(NSDecimalNumber *)divident b:(NSDecimalNumber *)divisor;
@end

NS_ASSUME_NONNULL_END
