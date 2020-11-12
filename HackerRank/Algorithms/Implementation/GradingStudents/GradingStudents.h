//
//  GradingStudents.h
//  HackerRank
//
//  Created by Igor Kotkovets on 11/12/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradingStudents : NSObject
- (NSArray *)gradingStudents:(NSArray *)grades;
- (NSUInteger)processGrade:(NSUInteger)grade;
@end

NS_ASSUME_NONNULL_END
