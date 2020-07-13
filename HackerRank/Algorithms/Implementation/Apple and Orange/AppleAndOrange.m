//
//  AppleAndOrange.m
//  HackerRank
//
//  Created by Igor Kotkovets on 7/13/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "AppleAndOrange.h"

@implementation AppleAndOrange
- (NSUInteger)countFruit:(NSInteger)s t:(NSInteger)t tree:(NSInteger)tree fetuses:(NSArray<NSNumber *> *)fetuses {
    NSUInteger result = 0;
    for (NSNumber *fetuse in fetuses) {
        NSInteger position = tree + fetuse.integerValue;
        if (position >= s && position <= t) {
            result += 1;
        }
    }
    return result;
}

- (void)countApplesAndOranges:(NSNumber *)s t:(NSNumber *)t a:(NSNumber *)a b:(NSNumber *)b apples:(NSArray *)apples oranges:(NSArray *)oranges {
    NSUInteger resultApples = [self countFruit:s.integerValue t:t.integerValue tree:a.integerValue fetuses:apples];
    NSUInteger resultOranges = [self countFruit:s.integerValue t:t.integerValue tree:b.integerValue fetuses:oranges];;
    printf("%i", resultApples);
    printf("\n%i", resultOranges);

}
@end
