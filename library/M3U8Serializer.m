//
//  M3U8Serializer.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "M3U8Serializer.h"

@implementation M3U8Serializer
+ (NSArray *)movieDownloadListsFromM3UList:(NSData *)data
{
    NSString *pattern = @"([\\w\\_-]+.ts)";
    
    NSString *searchValue = [DataConvertor stringFromData:data];
    NSArray *result = [RegularExpression searchReqularExpressinWithPattern:pattern
                                                               searchValue:searchValue];
    NSMutableArray *downloadLists = @[].mutableCopy;
    for (NSTextCheckingResult *match in result)
    {
        [downloadLists addObject:[searchValue substringWithRange:[match rangeAtIndex:1]]];
    }
    return downloadLists;
}
@end
