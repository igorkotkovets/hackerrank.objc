
#import <Foundation/Foundation.h>
#import "SplitThePhoneNumbers.h"



int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSData *availableInputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *availableInputString = [[NSString alloc] initWithData:availableInputData encoding:NSUTF8StringEncoding];
        NSArray *availableInputArray = [availableInputString componentsSeparatedByString:@"\n"];
        SplitThePhoneNumbers *solution = [[SplitThePhoneNumbers alloc] init];

        NSMutableData *outData = [[NSMutableData alloc] initWithCapacity:availableInputData.length];
        for (NSUInteger i=0; i<availableInputArray.count; i++) {
            NSString *found = [solution solveWithInputString:availableInputArray[i]];
            if (found.length) {
                NSString *withNewLine = [found stringByAppendingString:@"\n"];
                [outData appendData:[withNewLine dataUsingEncoding:NSUTF8StringEncoding]];
            }
        }

        NSFileHandle *stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];
        [stdoutFileHandle writeData:outData];
        [stdoutFileHandle closeFile];
    }

    return 0;
}
