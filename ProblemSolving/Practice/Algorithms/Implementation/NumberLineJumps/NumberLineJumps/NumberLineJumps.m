//
//  NumberLineJumps.m
//  NumberLineJumps
//
//  Created by igork on 21.02.21.
//

#import "NumberLineJumps.h"

@interface NumberLineJumps ()
@end

@implementation NumberLineJumps
- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (NSString *) kangaroo:(NSNumber *)x1Number
                     v1:(NSNumber *)v1Number
                     x2:(NSNumber *)x2Number
                     v2:(NSNumber *)v2Number {
    NSInteger x1 = x1Number.integerValue;
    NSInteger v1 = v1Number.integerValue;
    NSInteger x2 = x2Number.integerValue;
    NSInteger v2 = v2Number.integerValue;

    NSInteger v1v2 = v1-v2;
    if (v1v2 == 0) {
        if (x1 == x2) {
            return @"YES";
        }
        else {
            return @"NO";
        }
    }
    else {
        NSInteger x2x1 = x2-x1;
        double div = x2x1/v1v2;
        double remainder = x2x1%v1v2;
        if (div < 0) {
            return @"NO";
        }
        else if (remainder == 0) {
            return @"YES";
        }
        else {
            return @"NO";
        }
    }
}
@end
