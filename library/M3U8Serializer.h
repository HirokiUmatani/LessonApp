//
//  M3U8Serializer.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/07/26.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M3U8Serializer : NSObject
+ (NSArray *)movieDownloadListsFromM3UList:(NSData *)data;
@end
