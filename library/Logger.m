//
//  Logger.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/09.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "Logger.h"

@implementation Logger

NSString * const CONST_DEBUG            = @"DEBUG";
NSString * const CONST_WARNING          = @"WARNING";
NSString * const CONST_CONNECT_ERROR    = @"CONNECT ERROR";
NSString * const CONST_TODO             = @"TODO";

+ (void)debugLogWithCategory:(NSString *)category
                     message:(id)message
                    Function:(const char[])function
                        line:(NSInteger)line

{
    #ifdef DEBUG
    if (!category && !message)
    {
        NSLog(@"\n%s[L:%zd]\n[---]\n\n", function, line);
        return;
    }
    if (!category && message)
    {
        NSLog(@"\n%s[L:%zd]\n[---]%@\n\n", function, line, message);
        return;
    }
    if (category && !message)
    {
        NSLog(@"\n%s[L:%zd]\n[%@]\n\n", function, line, category);
        return;
    }
    if (category && message)
    {
        NSLog(@"\n%s[L:%zd]\n[%@]%@\n\n", function, line, category, message);
        return;
    }
    #endif
}
@end
