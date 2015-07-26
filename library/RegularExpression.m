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

@end
