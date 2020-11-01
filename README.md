# hackerrank.objc
Solutions from HackerRank 


Template for INPUT / OUTPUT tasks

```objc
#import <Foundation/Foundation.h>
int main()
{
    char *word;
    scanf("%[^\n]s",word);
    NSString* inputStr = [NSString stringWithFormat:@"Hello, World.\n%@",[NSString stringWithCString:word encoding:NSUTF8StringEncoding]];
    
    NSString *outputStr = [inputStr capitalizedString];
    
    printf("%s", [outputStr cStringUsingEncoding:NSUTF8StringEncoding]);
    return 0;
}
```
