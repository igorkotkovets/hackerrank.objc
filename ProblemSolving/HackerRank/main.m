
#import <Foundation/Foundation.h>
#import "DetectHTMLLinks.h"



int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSData *availableInputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *availableInputString = [[NSString alloc] initWithData:availableInputData encoding:NSUTF8StringEncoding];
        DetectHTMLLinks *solution = [[DetectHTMLLinks alloc] init];

        NSArray<NSDictionary<NSString *, NSString *> *> *result = [solution solveWithInputString:availableInputString];

        NSFileHandle *stdoutFileHandle = [NSFileHandle fileHandleWithStandardOutput];
        NSMutableString *line = [[NSMutableString alloc] init];
        for (NSUInteger i=0; i<result.count; i++) {
            NSDictionary *dict = result[i];
            NSString *key = dict.allKeys.firstObject;
            NSString *value = dict[key];
            if(i>0){
                [line appendString:@"\n"];
            }
            [line appendFormat:@"%@,%@", key, value];
        }

        [stdoutFileHandle writeData:[line dataUsingEncoding:NSUTF8StringEncoding]];
        [stdoutFileHandle closeFile];
    }

    return 0;
}
