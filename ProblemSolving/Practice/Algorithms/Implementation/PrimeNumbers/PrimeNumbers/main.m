//
//  main.m
//  PrimeNumbers
//
//  Created by igork on 21.02.21.
//

#import <Foundation/Foundation.h>
#import "PrimeNumbers.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSData *inputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

        NSFileHandle *stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];

        PrimeNumbers *solver = [[PrimeNumbers alloc] init];
        NSData *outData = [solver findUpTo:inputString];

        [stdoutFileHandle writeData:outData];
        [stdoutFileHandle closeFile];
    }

    return 0;
}
