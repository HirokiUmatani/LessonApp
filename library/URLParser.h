//
//  URLParser.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "URLEntity.h"
@interface URLParser : NSObject
+ (URLEntity *)urlParse:(NSString *)urlString;
@end
