//
//  TeamFormation.m
//  HackerRankObjC
//
//  Created by Igor Kotkovets on 7/2/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "TeamFormation.h"

@implementation TeamFormation
- (void)run {
    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
    NSInteger numberOfContestants = [self readNumberOfContestants:kbd];
    NSLog(@"%d",numberOfContestants*2);
}

- (NSInteger)readNumberOfContestants:(NSFileHandle *)kbd {
    NSData *inputData = [kbd availableData];
    NSString *numberStr = [[NSString alloc] initWithData:inputData
                     encoding:NSUTF8StringEncoding];
    NSInteger value = numberStr.integerValue;
    return value;
}

//- (NSInteger)readNumberOfContestants:(NSFileHandle *)kbd {
//    NSData *inputData = [kbd availableData];
//    NSString *numberStr = [[NSString alloc] initWithData:inputData
//                     encoding:NSUTF8StringEncoding];
//    NSInteger value = numberStr.integerValue;
//    return value;
//}
@end
