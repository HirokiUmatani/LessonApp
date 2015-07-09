//
//  Logger.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/09.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface Logger : NSObject

extern NSString * const CONST_DEBUG;
extern NSString * const CONST_WARNING;
extern NSString * const CONST_CONNECT_ERROR;
extern NSString * const CONST_TODO;

+ (void)debugLogWithCategory:(NSString *)category
                     message:(id)message
                    Function:(const char[])function
                        line:(NSInteger)line;

@end
