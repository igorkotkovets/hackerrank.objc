//
//  GradingStudents.m
//  HackerRank
//
//  Created by Igor Kotkovets on 11/12/20.
//  Copyright © 2020 Igor Kotkovets. All rights reserved.
//

#import "GradingStudents.h"

@implementation GradingStudents
- (NSArray *) gradingStudents:(NSArray *)grades {
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:grades.count];
    for (NSInteger i=0; i<grades.count; i++) {
        NSUInteger outValue = [self processGrade:[grades[i] unsignedIntegerValue]];
        [result addObject:@(outValue)];
    }

    return result;
}

- (NSUInteger)processGrade:(NSUInteger)grade {
    if (grade<38) {
        return grade;
    }

    NSUInteger remain = grade%5;
    NSUInteger div = grade/5;
    if (5-remain<3) {
        return div*5+5;
    }
    else {
        return grade;
    }
}
@end
