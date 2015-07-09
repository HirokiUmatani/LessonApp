//
//  LocalServer.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/23.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "LocalServer.h"

@implementation LocalServer
- (void)test
{
    _webServer = [[GCDWebServer alloc] init];
    [_webServer startWithPort:8080 bonjourName:nil];
    [Logger debugLogWithCategory:CONST_DEBUG
                         message:_webServer.serverURL
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
    
}
@end
