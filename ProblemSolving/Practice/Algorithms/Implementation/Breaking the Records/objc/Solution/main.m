//
//  main.m
//  Solution
//
//  Created by Igor Kotkovets on 1.06.21.
//

#import <Foundation/Foundation.h>
#import "Solution.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSData *inputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

        NSFileHandle *stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];

        Solution *solver = [[Solution alloc] init];
//        NSData *outData = [solver solveWithInputString:inputString];

//        [stdoutFileHandle writeData:outData];
        [stdoutFileHandle closeFile];
    }

    return 0;
}
