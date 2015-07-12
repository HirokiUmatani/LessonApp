//
//  LocalServer.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/23.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "GCDWebServer.h"
#import "GCDWebServerDataResponse.h"

extern NSString * const CONST_M3U8_MIME_TYPE;
extern NSString * const CONST_TS_MIME_TYPE;

@interface LocalServer : NSObject

@property(nonatomic,strong)GCDWebServer* webServer;
- (void)start;
@end
