//
//  AccessShiftedElement.h
//  HackerRank
//
//  Created by Igor Kotkovets on 7/6/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/what-is-modular-arithmetic


@interface AccessElementInShiftedArray : NSObject
- (NSNumber *)runWith:(NSArray<NSNumber *> *)numbers shift:(NSNumber *)shiftOn accessElementAt:(NSNumber *)position;
@end

NS_ASSUME_NONNULL_END
