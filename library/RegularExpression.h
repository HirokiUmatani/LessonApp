//
//  RegularExpression.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/12.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

@interface RegularExpression : NSObject
+ (NSArray *)searchReqularExpressinWithPattern:(NSString *)pattern
                                   searchValue:(NSString *)searchValue;

+ (NSArray *)convertListsFromRegularExpressionLists:(NSArray*)egularExpressionLists
                                        searchValue:(NSString *)searchValue;
@end
