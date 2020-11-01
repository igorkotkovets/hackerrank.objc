#import <Foundation/Foundation.h>

@interface ProblemSolution : NSObject
@end

@implementation ProblemSolution
- (NSString *)solveWithInputString:(NSString *)string {
    NSString *languagesWithSemicolor = @"C:CPP:JAVA:PYTHON:PERL:PHP:RUBY:CSHARP:HASKELL:CLOJURE:BASH:SCALA:ERLANG:CLISP:LUA:BRAINFUCK:JAVASCRIPT:GO:D:OCAML:R:PASCAL:SBCL:DART:GROOVY:OBJECTIVEC";
    NSString *languagesSeparated = [languagesWithSemicolor stringByReplacingOccurrencesOfString:@":" withString:@"|"];
    // 10000...99999
    NSString *pattern = [NSString stringWithFormat:@"[1-9][0-9]{4}\\s(%@)$", languagesSeparated];
    NSError *error = nil;
    NSRegularExpression *regex =
    [[NSRegularExpression alloc] initWithPattern:pattern
                                         options:0
                                           error:&error];
    NSAssert1(error == nil, @"can't create regex. %@", error);

    NSRange range = NSMakeRange(0, string.length);
    if ([regex numberOfMatchesInString:string options:0 range:range]) {
        return @"VALID";
    }
    else {
        return @"INVALID";
    }
}
@end

int main(int argc, const char* argv[]) {
    @autoreleasepool {
        NSData *availableInputData = [[NSFileHandle fileHandleWithStandardInput] availableData];
        NSString *availableInputString = [[NSString alloc] initWithData:availableInputData encoding:NSUTF8StringEncoding];
        NSArray *availableInputArray = [availableInputString componentsSeparatedByString:@"\n"];
        ProblemSolution *solution = [[ProblemSolution alloc] init];

        NSMutableData *outData = [[NSMutableData alloc] initWithCapacity:availableInputData.length];
        for (NSUInteger i=1; i<availableInputArray.count; i++) {
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

