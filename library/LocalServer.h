//
//  LocalServer.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/23.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//
#import "GCDWebServer.h"
#import "GCDWebServerDataResponse.h"

@interface LocalServer : NSObject

@property(nonatomic,strong)GCDWebServer* webServer;
- (void)test;
@end
