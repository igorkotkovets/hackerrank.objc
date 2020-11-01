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
        SayingHi *sayingHi = [[SayingHi alloc] init];

        NSMutableData *outData = [[NSMutableData alloc] initWithCapacity:availableInputData.length];
        for (NSUInteger i=0; i<availableInputArray.count; i++) {
            NSString *found = nil;// [sayingHi runWithInputString:availableInputArray[i]];
            if (found.length) {
                [outData appendData:[found dataUsingEncoding:NSUTF8StringEncoding]];
            }
        }

        NSFileHandle *stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];
        [stdoutFileHandle writeData:outData];
        [stdoutFileHandle closeFile];
    }

    return 0;
}
```
