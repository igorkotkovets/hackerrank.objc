//
//  TimeConversion.m
//  HackerRankObjC
//
//  Created by Igor Kotkovets on 7/2/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "TimeConversion.h"

@implementation TimeConversion
- (NSString *) timeConversion:(NSString *)ampmDateString {
    NSInteger suffixIndex = ampmDateString.length - 2;

    NSString *ampmSuffix = [ampmDateString substringFromIndex:suffixIndex];
    NSString *timeStringWith = [ampmDateString substringToIndex:suffixIndex];

    NSArray<NSString *> *components = [timeStringWith componentsSeparatedByString:@":"];
    NSString *hoursStr = components[0];
    NSString *minutesStr = components[1];
    NSString *secondsStr = components[2];

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSInteger hours = [[formatter numberFromString:hoursStr] integerValue];
    NSInteger minutes = [[formatter numberFromString:minutesStr] integerValue];
    NSInteger seconds = [[formatter numberFromString:secondsStr] integerValue];

    if ([ampmSuffix isEqualToString:@"PM"] && hours < 12) {
        hours += 12;
    }
    else if ([ampmSuffix isEqualToString:@"AM"] && hours >= 12) {
        hours -= 12;
    }

    NSString *result = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    return result;
}
@end
