//
//  PEARURLParser.h
//  URLParser
//
//  Created by hirokiumatani on 2015/10/31.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLEntity.h"
@interface PEARURLParser : NSObject
+ (URLEntity *)urlParse:(NSString *)urlString;
@end
