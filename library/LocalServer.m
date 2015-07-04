//
//  LocalServer.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/23.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "LocalServer.h"

@implementation LocalServer
static const NSInteger CONST_PORT_NUMBER = 59123;
static LocalServer * _sharedInstance = nil;
static dispatch_once_t _onceToken;
#pragma mark - Life Cycle
+ (LocalServer *)sharedInstance
{
    if (_sharedInstance)
        return _sharedInstance;

    dispatch_once(&_onceToken, ^
    {
        _sharedInstance = [LocalServer new];
        
        [_sharedInstance createLocalServer];
        [_sharedInstance setPort:CONST_PORT_NUMBER];
        [_sharedInstance setDocumentRoot:NSHomeDirectory()];
       
    });
    return _sharedInstance;
}

#pragma mark - Action
- (BOOL)start
{
    NSError *error;
    return [_sharedInstance.httpServer start:&error];
}
- (void)stop
{
    [_sharedInstance.httpServer stop];
}

#pragma mark - Setting
- (void)setDocumentRoot:(NSString *)documentRoot
{
    _sharedInstance.httpServer.documentRoot = documentRoot;
}

- (void)setPort:(NSInteger)port
{
    _sharedInstance.httpServer.port = port;
}

- (void)setMimeType:(NSDictionary *)mimeTypes
{
    [_sharedInstance.httpServer setMIMETypes:mimeTypes];
}

#pragma mark - Create
- (void)createLocalServer
{
    _sharedInstance.httpServer = [RoutingHTTPServer new];
}

@end
