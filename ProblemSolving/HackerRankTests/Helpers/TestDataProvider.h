//
//  TestDataProvider.h
//  HackerRankTests
//
//  Created by Igor Kotkovets on 11/1/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestDataProvider : NSObject <DataProvider>
@property (nonatomic, copy) NSData *availableData;
- (instancetype)initWithString:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
