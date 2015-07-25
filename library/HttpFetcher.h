//
//  HttpFercher.h
//  LessonApp
//
//  Created by hirokiumatani on 2015/06/02.
//  Copyright (c) 2015年 hirokiumatani. All rights reserved.
//

/*** request success blocks */
typedef void (^FetchSuccess)();

/*** request failed blocks */
typedef void (^FetchFailed)();


/*** @class fetcher web api class */
@interface HttpFetcher : NSObject

#pragma mark Method
/*** sync fetcher get method */
- (void)startSyncFetchingWithUrlString:(NSString *)urlString
                           success:(FetchSuccess)success
                            failed:(FetchFailed)failed;
/*** async fetcher get method */
- (void)startAsyncFetchingWithUrlString:(NSString *)urlString
                                success:(FetchSuccess)success
                                 failed:(FetchFailed)failed;

/*** async fetcher post method */
- (void)startFetchingWithUrlString:(NSString *)urlString
                         paramData:(NSData *)paramData
                           success:(FetchSuccess)success
                            failed:(FetchFailed)failed;

/*** genarate post parameter */
- (NSData *)setStringParameter:(NSString *)paramString,...NS_REQUIRES_NIL_TERMINATION;
@end
