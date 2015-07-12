//
//  RegularExpression.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/12.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "RegularExpression.h"

@implementation RegularExpression

+ (NSArray *)searchReqularExpressinWithPattern:(NSString *)pattern
                                   searchValue:(NSString *)searchValue
{
    
    NSError *regularExpressinErrror = nil;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&regularExpressinErrror];
    return [regularExpression matchesInString:searchValue options:0 range:NSMakeRange(0, searchValue.length)];
}

+ (NSArray *)convertListsFromRegularExpressionLists:(NSArray*)egularExpressionLists
                                   searchValue:(NSString *)searchValue
{
    NSMutableArray *result = @[].mutableCopy;
    for (NSTextCheckingResult *match in egularExpressionLists)
    {
        NSMutableDictionary *tmpDictionary = @{}.mutableCopy;
        [tmpDictionary setObject:[searchValue substringWithRange:[match rangeAtIndex:2]] forKey:@"No"];
        [tmpDictionary setObject:[searchValue substringWithRange:[match rangeAtIndex:3]] forKey:@"Artist"];
        [tmpDictionary setObject:[searchValue substringWithRange:[match rangeAtIndex:4]] forKey:@"Title"];
        [result addObject:tmpDictionary];
    }
    return result;
}
@end
