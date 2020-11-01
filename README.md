# hackerrank.objc
Solutions from HackerRank 


Template for INPUT / OUTPUT tasks

```objc
#import <Foundation/Foundation.h>
int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSData *availableInputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *availableInputString = [[NSString alloc] initWithData:availableInputData encoding:NSUTF8StringEncoding];
        NSArray *availableInputArray = [availableInputString componentsSeparatedByString:@"\n"];

        NSMutableData *outData = [[NSMutableData alloc] initWithLength:availableInputData.length];
        for (NSUInteger i=0; i<availableInputArray.count; i++) {

           
        }

        NSFileHandle *stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];
        [stdoutFileHandle writeData:outData];

        [stdoutFileHandle closeFile];
    }

    return 0;
}
```
