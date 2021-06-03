//
//  Solution.m
//  Solution
//
//  Created by Igor Kotkovets on 1.06.21.
//

#import "Solution.h"

@interface Solution ()
@end

@implementation Solution
/*
 * Complete the 'breakingRecords' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY scores as parameter.
 */

- (NSArray *)breakingRecords:(NSArray *)scores {
    NSNumber *maxScore = scores.firstObject;
    NSNumber *minScore = scores.firstObject;
    NSUInteger maxScoreBreakingCounter = 0;
    NSUInteger minScoreBreakingCounter = 0;
    
    for (NSNumber *iscore in scores) {
        if ([maxScore compare:iscore] == NSOrderedAscending) {
            maxScore = iscore;
            ++maxScoreBreakingCounter;
        }
        if ([minScore compare:iscore] == NSOrderedDescending) {
            minScore = iscore;
            ++minScoreBreakingCounter;
        }
    }
    
    return @[@(maxScoreBreakingCounter), @(minScoreBreakingCounter)];
}
@end
