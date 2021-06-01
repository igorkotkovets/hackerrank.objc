//
//  main.m
//  NumberLineJumps
//
//  Created by igork on 21.02.21.
//

#import <Foundation/Foundation.h>
#import "NumberLineJumps.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSData *inputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

        NSFileHandle *stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];

        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSArray<NSString *> *digitsStrList = [inputString componentsSeparatedByString:@" "];

        NSNumber *x1 = [formatter numberFromString:digitsStrList[0]];
        NSNumber *v1 = [formatter numberFromString:digitsStrList[1]];
        NSNumber *x2 = [formatter numberFromString:digitsStrList[2]];
        NSNumber *v2 = [formatter numberFromString:digitsStrList[3]];

        NSString *result = [NSString stringWithFormat:@"___%@ %@ %@ %@", x1, v1, x2, v2];
        [stdoutFileHandle writeData:[result dataUsingEncoding:NSUTF8StringEncoding]];

        NumberLineJumps *solver = [[NumberLineJumps alloc] init];
        NSString *outStr = [solver kangaroo:x1 v1:v1 x2:x2 v2:v2];

        [stdoutFileHandle writeData:[outStr dataUsingEncoding:NSUTF8StringEncoding]];
        [stdoutFileHandle closeFile];
    }

    return 0;
}
