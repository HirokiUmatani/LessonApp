//
//  LocalServer.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/23.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "LocalServer.h"
#import "GCDWebServerURLEncodedFormRequest.h"

static NSString * CONST_M3U8_MIME_TYPE   = @"vnd.apple.mpegURL";
static NSString * CONST_TS_MIME_TYPE     = @"video/MP2T";

@implementation LocalServer
- (void)start
{
    _webServer = [GCDWebServer new];
    [self setServer];
}

- (void)setServer
{
    [_webServer addHandlerForMethod:@"GET"
                               path:@"/mario/high_15.m3u8"
                       requestClass:[GCDWebServerURLEncodedFormRequest class]
                       processBlock:^GCDWebServerResponse *(GCDWebServerRequest* request)
     {
         
         NSString *homePath = NSHomeDirectory();
         NSString *fileName = request.path;
         NSString *filePath = [NSString stringWithFormat:@"%@%@",homePath,fileName];
         NSData *data = [NSData dataWithContentsOfFile:filePath];
         return [GCDWebServerDataResponse responseWithData:data
                                               contentType:CONST_M3U8_MIME_TYPE];
     }];
    
    // TODO need m3u8moviePathList
    for (NSInteger i = 1; i < 32; i++)
    {
        NSString *path = [NSString stringWithFormat:@"/mario/high_15_%zd.ts",i];
        [_webServer addHandlerForMethod:@"GET"
                                   path:path
                           requestClass:[GCDWebServerURLEncodedFormRequest class]
                           processBlock:^GCDWebServerResponse *(GCDWebServerRequest* request)
         {
             
             NSString *homePath = NSHomeDirectory();
             NSString *fileName = request.path;
             NSString *filePath = [NSString stringWithFormat:@"%@%@",homePath,fileName];
             NSData *data = [NSData dataWithContentsOfFile:filePath];
             return [GCDWebServerDataResponse responseWithData:data
                                                   contentType:CONST_TS_MIME_TYPE];
         }];
    }
    
    [_webServer startWithPort:8080 bonjourName:nil];
    [Logger debugLogWithCategory:CONST_DEBUG
                         message:_webServer.serverURL
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
}
- (void)stop
{
    [_webServer stop];
    _webServer = nil;
}
@end
