//
//  DataProvider.h
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DataProvider <NSObject>
@property (readonly, copy) NSData *availableData;
@end

NS_ASSUME_NONNULL_END
