//
//  Solution.m
//  Solution
//
//  Created by Igor Kotkovets on 1.06.21.
//

#import "Solution.h"

@interface Solution ()
@end

@implementation Solution
/*
 * Complete the 'getTotalX' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY a
 *  2. INTEGER_ARRAY b
 */
- (NSNumber *) getTotalX:(NSArray *)a b:(NSArray *)b {
    NSDecimalNumber *lcma = [self lcmForArray:a];
    NSDecimalNumber *gcdb = [self gcdForArray:b];
    NSUInteger counter = 0;
    NSDecimalNumber *distance = [lcma copy];
    while ([distance compare:gcdb] == NSOrderedAscending || [distance compare:gcdb] == NSOrderedSame) {
        NSDecimalNumber *remainder = [self remainderWithDivident:gcdb divisor:distance];
        if ([remainder compare:@(0)] == NSOrderedSame) {
            counter++;
        }
        distance = [distance decimalNumberByAdding:lcma];
    }
    
    return @(counter);

}

- (NSDecimalNumber *)remainderWithDivident:(NSDecimalNumber *)divident divisor:(NSDecimalNumber *)divisor {
    NSDecimalNumberHandler *handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:NSRoundDown scale:0 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *quotient = [divident decimalNumberByDividingBy:divisor withBehavior:handler];
    NSDecimalNumber *substractAmount = [quotient decimalNumberByMultiplyingBy:divisor];
    NSDecimalNumber *remainder = [divident decimalNumberBySubtracting:substractAmount];
    return remainder;
}

- (NSDecimalNumber *)lcmForArray:(NSArray<NSNumber *> *)list {
    NSDecimalNumber *lcm = [NSDecimalNumber decimalNumberWithDecimal:list.firstObject.decimalValue];
    for (NSUInteger i=1; i<list.count; i++) {
        NSDecimalNumber *element = [NSDecimalNumber decimalNumberWithDecimal:list[i].decimalValue];
        if ([lcm compare:element] == NSOrderedDescending) {
            lcm = [self lcmForA:lcm b:element];
        }
        else {
            lcm = [self lcmForA:element b:lcm];
        }
    }
    return lcm;
}

- (NSDecimalNumber *)lcmForA:(NSDecimalNumber *)a b:(NSDecimalNumber *)b {
    NSDecimalNumber *mult = [a decimalNumberByMultiplyingBy:b];
    if ([a compare:b] == NSOrderedDescending) {
        return [mult decimalNumberByDividingBy:[self gcdForA:a b:b]];
    }
    else {
        return [mult decimalNumberByDividingBy:[self gcdForA:b b:a]];
    }
}

- (NSDecimalNumber *)gcdForArray:(NSArray<NSNumber *> *)list {
    NSDecimalNumber *gcd = [NSDecimalNumber decimalNumberWithDecimal:list.firstObject.decimalValue];
    for (NSUInteger i=1; i<list.count; i++) {
        NSDecimalNumber *element = [NSDecimalNumber decimalNumberWithDecimal:list[i].decimalValue];
        if ([gcd compare:element] == NSOrderedDescending) {
            gcd = [self gcdForA:gcd b:element];
        }
        else {
            gcd = [self gcdForA:element b:gcd];
        }
    }
    return gcd;
}

- (NSDecimalNumber *)gcdForA:(NSDecimalNumber *)divident b:(NSDecimalNumber *)divisor {
    NSDecimalNumber *remainder = [self remainderWithDivident:divident divisor:divisor];
    
    if ([remainder compare:@(0)] == NSOrderedDescending) {
        return [self gcdForA:divisor b:remainder];
    }
    else {
        return divisor;
    }
}
@end
