//
//  CircularArrayRotation.h
//  HackerRank
//
//  Created by Igor Kotkovets on 7/6/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// https://www.hackerrank.com/challenges/circular-array-rotation/problem

@interface CircularArrayRotation : NSObject
- (NSArray<NSString *> *)circularArrayRotation:(NSArray *)a k:(NSNumber *)k queries:(NSArray *)queries;
@end

NS_ASSUME_NONNULL_END
