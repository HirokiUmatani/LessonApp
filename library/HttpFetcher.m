//
//  HttpFercher.m
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/02.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

#import "HttpFetcher.h"

@implementation HttpFetcher

NSString * const CONST_HTTP_GET  = @"GET";
NSString * const CONST_HTTP_POST = @"POST";

static NSInteger  HTTP_TIME_OUT = 15;
#pragma mark - Get Sync
- (void)startSyncFetchingWithUrlString:(NSString *)urlString
                               success:(FetchSuccess)success
                                failed:(FetchFailed)failed
{
    NSMutableURLRequest *request = [self setHttpRequestWithURL:urlString
                                                        method:CONST_HTTP_GET];
    
    [self restartNetworkIndicator];
    
    NSURLResponse *response;
    NSError *error;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request
                                                 returningResponse:&response
                                                             error:&error];
    
    [self stopNetworkIndicator];
    if (error)
    {
        failed([self connectError:error]);
    }
    else
    {
        success(responseData);
    }
    
}

#pragma mark - Get ASync
- (void)startFetchingWithUrlString:(NSString *)urlString
                           success:(FetchSuccess)success
                            failed:(FetchFailed)failed
{
    NSMutableURLRequest *request = [self setHttpRequestWithURL:urlString
                                                        method:CONST_HTTP_GET];

    [self restartNetworkIndicator];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *responceData,
                                               NSError *error)
     {
         [self stopNetworkIndicator];
         if (error)
         {
             failed([self connectError:error]);
         }
         else
         {
             success(responceData);
         }
         
     }];
}

#pragma mark - Post Sync
- (void)startFetchingWithUrlString:(NSString *)urlString
                         paramData:(NSData *)paramData
                           success:(FetchSuccess)success
                            failed:(FetchFailed)failed
{
    NSMutableURLRequest *request = [self setHttpRequestWithURL:urlString
                                                        method:CONST_HTTP_POST];
    request.HTTPBody = paramData;
    
    [self restartNetworkIndicator];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *responceData,
                                               NSError *error)
     {
         [self stopNetworkIndicator];
         if (error)
         {
             failed([self connectError:error]);
         }
         else
         {
             success(responceData);
         }
     }];
}

#pragma mark - Set Post Parameter -
- (NSData *)setStringParameter:(NSString *)paramString, ...NS_REQUIRES_NIL_TERMINATION
{
    NSMutableArray *contentLists = @[].mutableCopy;
    va_list args;
    va_start(args, paramString);
    for (NSString *arg = paramString;
         arg != nil;
         arg = va_arg(args, NSString*))
        [contentLists addObject:arg];
    
    va_end(args);
    
    NSMutableString *newContentString = [NSMutableString string];
    [newContentString appendString:@"@\""];
    for(NSInteger i = 0; i < contentLists.count; i++)
    {
        [newContentString appendString:contentLists[i]];
        if (i == contentLists.count - 1)
            break;
        
        if (i % 2 == 0)
            [newContentString appendString:@"="];
        
        else
            [newContentString appendString:@"&"];
    }
    [newContentString appendString:@"\""];
    NSData *result = [newContentString dataUsingEncoding:NSUTF8StringEncoding];
    return result;
}

#pragma mark - Set Request Parameter
- (NSMutableURLRequest *)setHttpRequestWithURL:(NSString *)urlString method:(NSString *)method
{
    NSMutableURLRequest *request = NSMutableURLRequest.new;
    NSURL *url = [NSURL URLWithString:urlString];
    
    request.URL             = url;
    request.HTTPMethod      = method;
    request.timeoutInterval = HTTP_TIME_OUT;

    return request;
}

#pragma mark - Error
- (NSError *)connectError:(NSError *)error
{
    [Logger debugLogWithCategory:CONST_CONNECT_ERROR
                         message:error
                        Function:__PRETTY_FUNCTION__
                            line:__LINE__];
    return error;
}

#pragma mark - Indicator
- (void)restartNetworkIndicator
{
    UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
    UIApplication.sharedApplication.networkActivityIndicatorVisible = YES;
}
- (void)stopNetworkIndicator
{
    UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
}
@end
