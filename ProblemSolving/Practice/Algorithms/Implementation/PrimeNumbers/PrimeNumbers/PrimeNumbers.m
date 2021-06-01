//
//  PrimeNumbers.m
//  PrimeNumbers
//
//  Created by igork on 21.02.21.
//

#import "PrimeNumbers.h"

@interface PrimeNumbers ()
@end

@implementation PrimeNumbers
- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (NSArray<NSNumber *> *)findUpTo:(NSUInteger)max {
    NSUInteger lowerBound = 2;
    NSUInteger upperBound = max;
    NSUInteger capacity = upperBound>lowerBound ? (max-1) : 0;
    NSMutableDictionary<NSNumber *, NSObject *> *numbersDict = [NSMutableDictionary dictionaryWithCapacity:max];
    for (NSUInteger i=lowerBound; i<=max; i++) {
        numbersDict[@(i)] = @(i);
    }

    for (NSUInteger n=lowerBound; n<=max; n++) {
        NSNumber *primeNumberOrNull = (NSNumber *)numbersDict[@(n)];
        if ((NSNull *)primeNumberOrNull == [NSNull null]) {
            continue;
        }

        NSUInteger primeNumber = [primeNumberOrNull unsignedIntegerValue];
        for (NSUInteger i=primeNumber; i<=max; i++) {
            numbersDict[@(i*primeNumber)] = [NSNull null];
        }
    }

    NSMutableArray *result = [NSMutableArray arrayWithCapacity:capacity];
    for (NSUInteger i=lowerBound; i<=max; i++) {
        NSNumber *primeNumberOrNull = (NSNumber *)numbersDict[@(i)];
        if ((NSNull *)primeNumberOrNull != [NSNull null]) {
            [result addObject:primeNumberOrNull];
        }
    }
    return result;
}
@end
