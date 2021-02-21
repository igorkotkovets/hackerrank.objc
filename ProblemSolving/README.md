# hackerrank.objc
Solutions from HackerRank 


Template for INPUT / OUTPUT tasks

```objc
#import <Foundation/Foundation.h>

@interface ProblemSolving : NSObject
@end

@implementation ProblemSolving
- (NSString *)solveWithInputString:(NSString *)string {
    // code here
    return nil;;
}
@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSData *availableInputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *availableInputString = [[NSString alloc] initWithData:availableInputData encoding:NSUTF8StringEncoding];
        NSArray *availableInputArray = [availableInputString componentsSeparatedByString:@"\n"];
        ProblemSolution *solution = [[ProblemSolving alloc] init];

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
```

Compile `main.m` file
```bash
$ clang -fobjc-arc main.m -o prog1
```
