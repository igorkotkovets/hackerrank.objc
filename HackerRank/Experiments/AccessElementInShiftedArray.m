//
//  AccessShiftedElement.m
//  HackerRank
//
//  Created by Igor Kotkovets on 7/6/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "AccessElementInShiftedArray.h"

@implementation AccessElementInShiftedArray
- (NSNumber *)runWith:(NSArray<NSNumber *> *)numbers shift:(NSNumber *)shiftOnNumber accessElementAt:(NSNumber *)positionNumber {
    NSUInteger arraySize = numbers.count;
    NSUInteger position = positionNumber.unsignedIntegerValue;
    NSUInteger shift = shiftOnNumber.unsignedIntegerValue;
    NSNumber *element = numbers[(position+shift)%arraySize];
    return element;
}
@end
