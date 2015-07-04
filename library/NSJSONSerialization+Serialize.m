//
//  NSJSONSerialization+Serialize.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/03.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "NSJSONSerialization+Serialize.h"

@implementation NSJSONSerialization(Serialize)

+ (NSDictionary *)dictionaryFromJsonData:(NSData *)jsonData
{
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:jsonData
                                                           options:NSJSONReadingMutableContainers
                                                             error:nil];
    return result;
}

+ (NSData *)jsonDataFromDictionary:(NSDictionary *)dictionary
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    return jsonData;
}
@end
