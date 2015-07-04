//
//  LocalServer.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/23.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//


#import <RoutingHTTPServer/RoutingHTTPServer.h>

@interface LocalServer : NSObject
/** HTTP local server */
@property (strong, nonatomic) RoutingHTTPServer *httpServer;

/** singletone */
+ (LocalServer *)sharedInstance;

/** server start　*/
- (BOOL)start;

/** server stop */
- (void)stop;

/** 
 setting rootdirectory
 @param documentRoot 
 defaut : Home directory
 */
- (void)setDocumentRoot:(NSString *)documentRoot;

/**
 setting port number
 @param port default:8888
 */

- (void)setPort:(NSInteger)port;

/**
 setting mime type
 @param mimeTypes
 example : @{@"ext":@"application type"}
 */
- (void)setMimeType:(NSDictionary *)mimeTypes;

@end
