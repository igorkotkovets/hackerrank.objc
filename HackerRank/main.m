
#import <Foundation/Foundation.h>
#import "DetectHTMLAttributes.h"



int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSData *availableInputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *availableInputString = [[NSString alloc] initWithData:availableInputData encoding:NSUTF8StringEncoding];
        DetectHTMLAttributes *solution = [[DetectHTMLAttributes alloc] init];

        NSDictionary<NSString *, NSArray<NSString *> *> *result = [solution solveWithInputString:availableInputString];

        NSFileHandle *stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];
        NSArray *sortedKeys = [[result allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSMutableString *line = [[NSMutableString alloc] init];
        for (NSUInteger i=0; i<sortedKeys.count; i++) {
            NSString *key = sortedKeys[i];
            if(i>0){
                [line appendString:@"\n"];
            }
            [line appendFormat:@"%@:", key];
            NSArray<NSString *> *values = result[key];
            NSArray<NSString *> *sortedValues = [values sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
            for (NSUInteger j=0; j<sortedValues.count; j++) {
                NSString *value = sortedValues[j];
                if (j>0) {
                    [line appendString:@","];
                }

                [line appendString:value];
            }
        }

        [stdoutFileHandle writeData:[line dataUsingEncoding:NSUTF8StringEncoding]];
        [stdoutFileHandle closeFile];
    }

    return 0;
}
