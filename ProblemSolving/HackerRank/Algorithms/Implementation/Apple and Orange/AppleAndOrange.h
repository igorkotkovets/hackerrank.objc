//
//  AppleAndOrange.h
//  HackerRank
//
//  Created by Igor Kotkovets on 7/13/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppleAndOrange : NSObject
- (NSUInteger)countFruit:(NSInteger)s t:(NSInteger)t tree:(NSInteger)tree fetuses:(NSArray<NSNumber *> *)fetuses;
- (NSArray<NSNumber *> *)countApplesAndOrangesInternal:(NSNumber *)s t:(NSNumber *)t a:(NSNumber *)a b:(NSNumber *)b apples:(NSArray *)apples oranges:(NSArray *)oranges;
- (void)countApplesAndOranges:(NSNumber *)s t:(NSNumber *)t a:(NSNumber *)a b:(NSNumber *)b apples:(NSArray *)apples oranges:(NSArray *)oranges;
@end

NS_ASSUME_NONNULL_END
